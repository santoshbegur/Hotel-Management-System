/* =========================================================
   Table Initialization for All Pages
========================================================= */

function initDataTables(moduleName = "") {
    $('.data-table').each(function () {
        // Destroy existing DataTable if already initialized
        if ($.fn.DataTable.isDataTable(this)) {
            $(this).DataTable().destroy();
        }
        // Capitalize first letter of moduleName
        let labelName = moduleName
            ? moduleName.charAt(0).toUpperCase() + moduleName.slice(1)
            : "Records";
        // Initialize DataTable
        $(this).DataTable({
            pageLength: 8,           // 10 records per page
            lengthChange: true,      // show dropdown to select number of records
            lengthMenu: [5, 6, 7, 8, 9, 10, 25, 50, 100], // options in dropdown
            info: true,              // show "Showing x of y entries"
            pagingType: "simple_numbers", // simple pagination
            ordering: true,          // allow column sorting
            searching: true,         // enable global search/filter
            autoWidth: false,        // prevent auto column width
            destroy: true,           // allow re-init
            language: {
                info: "Showing _START_ to _END_ of _TOTAL_ records",
                paginate: {
                    previous: "Prev",
                    next: "Next"
                },
                search: "Filter " + labelName
            },
            columnDefs: [
                {orderable: false, targets: "actions"} // disable sorting for actions column
            ]
        });
        // Style the search input + add placeholder dynamically
        let placeholderText = `Type to search ${labelName}...`;
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
                width: '55px',       // adjust width as needed
                display: 'inline-block',
                marginLeft: '0.5rem',
                border: '1px solid black',
                borderRadius: '6px',
                padding: '2px 4px',
                color: 'black'
            });
        // Style "Show" label
        $('.dataTables_length label').css({
            color: 'black',           // or use theme variable: var(--text-color)
            fontWeight: '500',        // optional: make it a bit bolder
            marginRight: '0.25rem'    // optional spacing between label and dropdown
        });

    });
}