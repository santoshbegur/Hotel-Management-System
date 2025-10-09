/* =========================================================
   Initial Page Load
========================================================= */
showHomeContent();

/* =========================================================
   Home / Content Toggle
========================================================= */
function showHomeContent() {
    $("#homeContent").show();
}

function hideHomeContent() {
    $("#homeContent").hide();
}

function hideContent() {
    $("#content").hide();
}

function showContent() {
    $("#content").show();
}

/* =========================================================
   Navigation Click Handling
========================================================= */
// Save active link to localStorage
$(".nav-click").click(function (e) {
    e.preventDefault();
    $(".nav-click").removeClass("active");
    $(this).addClass("active");
    const target = $(this).data("target");
    localStorage.setItem("activeMenu", $(this).data("target")); // store target

    if (target === "home") {
        showHomeContent();
    }
    else {
        hideHomeContent();
        loadList(target);
    }
});

/* =========================================================
   Load Modules: List & Form
========================================================= */

// Load module list
function loadList(moduleName) {
    hideHomeContent();
    let url = `/${moduleName}/${moduleName}_list`;
    fetch(url)
        .then(resp => resp.text())
        .then(html => {
            document.getElementById("content").innerHTML = html;
            // Initialize DataTables AFTER table is added to DOM
            if (typeof initDataTables === "function") {
                initDataTables(moduleName);  // pass module name
            }
        })
        .catch(err => console.error("Failed to load list:", err));
}

// Load form (create / edit)
function loadForm(module, id = null) {
    hideHomeContent();

    const url = id
        ? `/${module}/${module}_list/edit/${id}`
        : `/${module}/${module}_list/create`;

    fetch(url)
        .then(resp => resp.text())
        .then(html => {
            document.getElementById('content').innerHTML = html;
        })
        .catch(err => console.error(`Failed to load ${module} form:`, err));
}

// Load static form fragment
function showForm(moduleName) {
    hideHomeContent();
    const url = `/${moduleName}/${moduleName}_form`;
    fetch(url)
        .then(resp => resp.text())
        .then(html => {
            document.getElementById("content").innerHTML = html;
        })
        .catch(err => console.error("Failed to load form:", err));
}

/* =========================================================
   Form Submission (AJAX)
========================================================= */
function submitForm(event, module) {
    event.preventDefault();
    const form = event.target;
    const formData = new FormData(form);
    const id = formData.get('id');
    const url = id ? `/${module}/${module}_list/update` : `/${module}/${module}_list/create`;
    fetch(url, {method: 'POST', body: formData})
        .then(resp => resp.ok ? resp.text() : Promise.reject('Failed'))
        .then(() => loadList(module))
        .catch(err => {
            console.error(err);
            const msgDiv = document.getElementById('formMessage');
            if (msgDiv) msgDiv.innerHTML = "<div class='alert alert-danger'>Failed to save. Try again.</div>";
        });
}

/* =========================================================
   Alerts
========================================================= */
function showAlert(message, type = "success", duration = 5000) {
    const alertContainer = document.getElementById("alertContainer");
    alertContainer.style.display = "block";

    alertContainer.innerHTML = `
        <div class="alert alert-${type} alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    `;

    setTimeout(() => {
        const alertDiv = alertContainer.querySelector(".alert");
        if (alertDiv) {
            const bsAlert = bootstrap.Alert.getOrCreateInstance(alertDiv);
            bsAlert.close();
        }
        alertContainer.style.display = "none";
    }, duration);
}

/* =========================================================
   Confirm Modal
========================================================= */
function showConfirm(message, confirmText = "OK", confirmClass = "btn-primary", onConfirm) {
    const confirmMessage = document.getElementById("confirmMessage");
    const confirmOkBtn = document.getElementById("confirmOkBtn");

    confirmMessage.textContent = message;
    confirmOkBtn.textContent = confirmText;
    confirmOkBtn.className = "btn " + confirmClass;

    // Remove previous event listeners
    const newBtn = confirmOkBtn.cloneNode(true);
    confirmOkBtn.parentNode.replaceChild(newBtn, confirmOkBtn);

    newBtn.addEventListener("click", () => {
        const modal = bootstrap.Modal.getInstance(document.getElementById("confirmModal"));
        modal.hide();
        onConfirm();
    });

    const modal = new bootstrap.Modal(document.getElementById("confirmModal"));
    modal.show();
}

/* =========================================================
   Delete Items
========================================================= */
function deleteItem(module, id) {
    showConfirm(
        `Are you sure you want to delete item ID ${id}?`,
        "Yes, Delete",
        "btn-danger",
        () => {
            fetch(`/${module}/${module}_list/delete/${id}`, {method: "DELETE"})
                .then(async resp => {
                    if (resp.status === 200) {
                        showAlert(`Item with ID ${id} deleted successfully.`, "success");
                        loadList(module);
                    } else if (resp.status === 409) {
                        showAlert("Cannot delete this item because it is linked to other records.", "warning");
                    } else {
                        const text = await resp.text();
                        showAlert("Delete failed: " + text, "danger");
                    }
                })
                .catch(err => {
                    console.error("Delete failed:", err);
                    showAlert("An error occurred while deleting the item.", "danger");
                });
        }
    );
}


/* =========================================================
   Dynamic RoomType Filtering
========================================================= */
const allRoomTypes = /*[[${roomTypes}]]*/ []; // Thymeleaf injects JSON

const hotelSelect = document.getElementById('hotel');
const roomTypeSelect = document.getElementById('roomType');

if (hotelSelect && roomTypeSelect) {
    hotelSelect.addEventListener('change', () => {
        const hotelId = hotelSelect.value;
        roomTypeSelect.innerHTML = ''; // clear options
        allRoomTypes
            .filter(rt => rt.hotel.id == hotelId)
            .forEach(rt => {
                const opt = document.createElement('option');
                opt.value = rt.id;
                opt.text = rt.name;
                roomTypeSelect.add(opt);
            });
    });
}

function generateTransactionId(reservationId) {
    const methodInput = document.getElementById('method');
    const txnInput = document.getElementById('transactionId');
    if (!methodInput || !txnInput || !reservationId) return;
    // Map payment method to code
    const method = methodInput.value.trim().toUpperCase();
    const methodMap = {
        'UPI': 'UP',
        'PAYPAL': 'PP',
        'CREDIT CARD': 'CC',
        'DEBIT CARD': 'DC',
        'CASH': 'CS'
    };
    const methodCode = methodMap[method] || 'OT'; // OT = Other
    // Generate numeric sequence (can be random or fetched from backend)
    const randomNum = Math.floor(100 + Math.random() * 900); // 100-999
    // Pad reservation ID to 2 digits
    const resIdStr = reservationId.toString().padStart(2, '0');
    // Combine TXN
    const txnId = `TXN${randomNum}${resIdStr}${methodCode}`;
    txnInput.value = txnId;
}

// Attach event before form submission
const paymentForm = document.querySelector("form[onsubmit*='payments']");
if (paymentForm) {
    paymentForm.addEventListener('submit', function (e) {
        const reservationSelect = document.getElementById('reservation');
        const reservationId = reservationSelect ? reservationSelect.value : null;
        generateTransactionId(reservationId);
    });
}

/* =========================================================
   Admin Report Loading
========================================================= */
function loadReport(moduleName) {
    hideHomeContent();

    // Load the report fragment first
    let url = `/reports/${moduleName}_list`; // fallback fragment URL

    fetch(url)
        .then(response => response.text())
        .then(html => {
            document.getElementById('content').innerHTML = html;
            showContent();
            if (moduleName === 'reports') {
                const waitForInputs = setInterval(() => {
                    const startInput = document.getElementById('startDate');
                    const endInput = document.getElementById('endDate');
                    const rangeSelect = document.getElementById('rangeSelect');
                    if (startInput && endInput && rangeSelect) {
                        clearInterval(waitForInputs);
                        initializeDateRange();
                        attachReportFormHandler();
                    }
                }, 50);
            }
        })
        .catch(err => alert("Error loading report page: " + err));
}


/* =========================================================
   Admin Report Loading with Export
========================================================= */
document.addEventListener('DOMContentLoaded', () => {
    initializeDateRange();
    attachReportFormHandler();
});

// ==============================
// Initialize Date Range Inputs
// ==============================
function initializeDateRange() {
    const startInput = document.getElementById('startDate');
    const endInput = document.getElementById('endDate');
    const rangeSelect = document.getElementById('rangeSelect');

    if (!startInput || !endInput || !rangeSelect) return;

    const today = new Date();

    const formatDate = (date) => {
        const y = date.getFullYear();
        const m = String(date.getMonth() + 1).padStart(2, '0');
        const d = String(date.getDate()).padStart(2, '0');
        return `${y}-${m}-${d}`;
    };

    startInput.max = formatDate(today);
    endInput.max = formatDate(today);

    function setDateRange(rangeType) {
        const end = new Date(today);
        const start = new Date(today);

        switch (rangeType) {
            case 'daily':
                break;
            case 'weekly':
                start.setDate(end.getDate() - 7);
                break;
            case 'monthly':
                start.setMonth(end.getMonth() - 1);
                break;
            case 'yearly':
                start.setFullYear(end.getFullYear() - 1);
                break;
            default:
                start.setDate(end.getDate() - 7);
        }

        startInput.value = formatDate(start);
        endInput.value = formatDate(end);
    }

    setDateRange(rangeSelect.value);

    // Update dates when dropdown changes
    rangeSelect.addEventListener('change', function () {
        setDateRange(this.value);
    });
}

// ==============================
// Form Submission (Generate Report)
// ==============================
function attachReportFormHandler() {
    const form = document.getElementById('reportForm');
    if (!form) return;

    form.addEventListener('submit', function (event) {
        event.preventDefault();

        const startDate = document.getElementById('startDate')?.value;
        const endDate = document.getElementById('endDate')?.value;
        const reportType = document.getElementById('reportType')?.value;

        if (!startDate || !endDate || !reportType) {
            alert('Please select valid dates and report type.');
            return;
        }

        const url = `/reports/${reportType}_list?startDate=${encodeURIComponent(startDate)}&endDate=${encodeURIComponent(endDate)}`;

        fetch(url)
            .then(res => res.text())
            .then(html => {
                document.getElementById('reportResult').innerHTML = html;
                // Initialize DataTable for search, pagination, sorting
                const table = $('#reportResult table');
                if (table.length) {
                    // Destroy previous instance if exists (for repeated loads)
                    if ($.fn.DataTable.isDataTable(table)) {
                        table.DataTable().destroy();
                    }

                    table.DataTable({
                        paging: true,             // pagination
                        searching: true,          // search/filter
                        ordering: true,           // column sorting
                        info: true,               // table info
                        pageLength: 5,           // default rows per page
                        lengthMenu: [5, 10, 15, 30, 365, 10000], // rows per page options
                        columnDefs: [{orderable: true}]
                    });
                    // Style the search input + add placeholder dynamically
                    let placeholderText = `Type to search..`;
                    $('.dataTables_filter input')
                        .attr("placeholder", placeholderText)
                        .css({
                            width: '250px',             // wider input
                            display: 'inline-block',    // inline-block
                            marginLeft: '0.5rem',       // spacing
                            border: '1px solid black',   // blue border
                            borderRadius: '6px',        // optional, makes it smooth
                            color: 'black'              // text color
                        });
                    // Style length dropdown
                    $('.dataTables_length select')
                        .css({
                            width: '70px',       // adjust width as needed
                            display: 'inline-block',
                            marginLeft: '0.5rem',
                            border: '1px solid black',
                            borderRadius: '6px',
                            padding: '2px 4px',
                            color: 'black'
                        });
                }

                attachExportHandlers(); // Attach export buttons now that table exists
            })
            .catch(err => alert("Error fetching " + reportType + " report: " + err));
    });
}

// ==============================
// Export Handlers
// ==============================
function attachExportHandlers() {
    const exportExcelBtn = document.getElementById('exportExcel');
    const exportPdfBtn = document.getElementById('exportPdf');
    const reportTable = document.querySelector('#reportResult table');

    if (!reportTable || !exportExcelBtn || !exportPdfBtn) return;

    // Remove old listeners to avoid duplicates
    exportExcelBtn.replaceWith(exportExcelBtn.cloneNode(true));
    exportPdfBtn.replaceWith(exportPdfBtn.cloneNode(true));

    const newExcelBtn = document.getElementById('exportExcel');
    const newPdfBtn = document.getElementById('exportPdf');

    // --- Export Excel ---
    newExcelBtn.addEventListener('click', () => {
        let csv = [];
        for (let row of reportTable.rows) {
            let cols = [];
            for (let cell of row.cells) cols.push(`"${cell.innerText}"`);
            csv.push(cols.join(','));
        }
        const csvFile = new Blob([csv.join('\n')], {type: 'text/csv'});
        const a = document.createElement('a');
        a.href = URL.createObjectURL(csvFile);
        a.download = `${document.getElementById('reportType').value}_${document.getElementById('startDate').value}_to_${document.getElementById('endDate').value}.csv`;
        a.click();
    });

    // --- Export PDF dynamically ---
    newPdfBtn.addEventListener('click', () => {
        const reportTable = document.querySelector('#reportResult table');
        if (!reportTable) {
            alert('No table found for export!');
            return;
        }

        // Get the selected report type dynamically from the filter form
        const reportTypeInput = document.getElementById('reportType');
        const startDateInput = document.getElementById('startDate');
        const endDateInput = document.getElementById('endDate');

        const reportType = reportTypeInput.value; // Will be 'revenue' or 'occupancy'
        const reportTitle = `Report`;

        if (!reportTypeInput || !startDateInput || !endDateInput) {
            alert('Missing report filter inputs!');
            return;
        }

        // Clone the table and add a temporary heading
        const clonedTable = reportTable.cloneNode(true);
        const wrapper = document.createElement('div');
        const titleEl = document.createElement('h3');
        titleEl.innerText = reportTitle;
        titleEl.style.textAlign = 'center';
        wrapper.appendChild(titleEl);
        wrapper.appendChild(clonedTable);
        // PDF options
        const opt = {
            margin: 10,
            filename: `${reportType}_${startDate}_to_${endDate}.pdf`,
            image: {type: 'jpeg', quality: 0.98},
            html2canvas: {scale: 2},
            jsPDF: {unit: 'mm', format: 'a4', orientation: 'portrait'}
        };
        // Generate PDF
        html2pdf().set(opt).from(wrapper).save();
    });
}


document.addEventListener('DOMContentLoaded', function() {
    const nights = document.getElementById('nights');
    const price = document.getElementById('pricePerNight');
    const total = document.getElementById('totalAmount');

    function updateTotal() {
        const n = parseFloat(nights.value || 0);
        const p = parseFloat(price.value || 0);
        total.value = (n * p).toFixed(2);
    }

    nights.addEventListener('input', updateTotal);
    price.addEventListener('input', updateTotal);
});

