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
    const url = `/${moduleName}/${moduleName}_list`;
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


$(document).ready(function() {
    $.ajax({
        url: '/dashboard/fragment',
        method: 'GET',
        success: function(data) {
            $('#content').html(data);
        },
        error: function(xhr, status, error) {
            $('#content').html('<div class="alert alert-danger">Failed to load dashboard.</div>');
        }
    });
});


function loadRoleContent(url) {
    $("#loader").show();  // Show loader
    $("#content").hide();

    $.ajax({
        url: url,
        type: "GET",
        success: function(data) {
            $("#content").html(data);  // Inject HTML
        },
        error: function() {
            $("#content").html("<p>Error loading content.</p>");
        },
        complete: function() {
            $("#loader").hide();     // Hide loader
            $("#content").show();
        }
    });
}
