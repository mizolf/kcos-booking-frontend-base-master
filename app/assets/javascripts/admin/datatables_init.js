function init_datatable(props) {
  var lang = props && props.lang || "en";

  // columns that won't have reorder props.aoColumns = aoColumns: [null, null, {'bSortable': false}] (first and second are default the last one is unsortable)
  var aoColumns = props && props.aoColumns || null    

  // table will be orderd by this colum props.orderBy: [2, 'desc' ]
  var orderBy = props && props.orderBy || [0, 'desc']

  $('table.datatable').DataTable({
    "bInfo" : false,
    // stateSave: true,
    lengthChange:  false,
    order: orderBy,
    aoColumns: aoColumns,
    language: setLanguage(lang)
  });
};


function setLanguage(lang){
  if(lang=='hr'){
    return{
      "sEmptyTable":      "Nema podataka u tablici",
      "sInfo":            "Prikazano _START_ do _END_ od _TOTAL_ rezultata",
      "sInfoEmpty":       "Prikazano 0 do 0 od 0 rezultata",
      "sInfoFiltered":    "(filtrirano iz _MAX_ ukupnih rezultata)",
      "sInfoPostFix":     "",
      "sInfoThousands":   ",",
      "sLengthMenu":      "Prikaži _MENU_ rezultata po stranici",
      "sLoadingRecords":  "Dohvaćam...",
      "sProcessing":      "Obrađujem...",
      "searchPlaceholder": "Pretraži", 
      "sSearch":          "",
      "sZeroRecords":     "Ništa nije pronađeno",
      "oPaginate": {
          "sFirst":       "Prva",
          "sPrevious":    "Nazad",
          "sNext":        "Naprijed",
          "sLast":        "Zadnja"
      },
      "oAria": {
          "sSortAscending":  ": aktiviraj za rastući poredak",
          "sSortDescending": ": aktiviraj za padajući poredak"
      }
    }
  }
  else if(lang=='en'){
    return{
      "sEmptyTable":     "No data available in table",
      "sInfo":           "Showing _START_ to _END_ of _TOTAL_ entries",
      "sInfoEmpty":      "Showing 0 to 0 of 0 entries",
      "sInfoFiltered":   "(filtered from _MAX_ total entries)",
      "sInfoPostFix":    "",
      "sInfoThousands":  ",",
      "sLengthMenu":     "Show _MENU_ entries",
      "sLoadingRecords": "Loading...",
      "sProcessing":     "Processing...",
      "searchPlaceholder": "Search", 
      "sSearch":         "",
      "sZeroRecords":    "No matching records found",
      "oPaginate": {
          "sFirst":    "First",
          "sLast":     "Last",
          "sNext":     "Next",
          "sPrevious": "Previous"
      },
      "oAria": {
          "sSortAscending":  ": activate to sort column ascending",
          "sSortDescending": ": activate to sort column descending"
      }
    }
    }
  }
