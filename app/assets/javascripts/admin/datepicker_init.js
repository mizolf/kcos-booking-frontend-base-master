//if you wan't to use:
//    init_datepicker();

function init_datepicker() {
    $('.js-datepicker').datepicker({
        prevText: '&#x3C;',
        nextText: '&#x3E;',
        dateFormat: 'dd.mm.yy.',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    });

    $( "#from" ).datepicker({
        prevText: '&#x3C;',
        nextText: '&#x3E;',
        dateFormat: 'dd.mm.yy.',
        defaultDate: "+1w",
        changeMonth: true,
        onClose: function( selectedDate ) {
            $( "#to" ).datepicker( "option", "minDate", selectedDate );
        }
    });
    $( "#to" ).datepicker({
        prevText: '&#x3C;',
        nextText: '&#x3E;',
        dateFormat: 'dd.mm.yy.',
        defaultDate: "+1w",
        changeMonth: true,
        onClose: function( selectedDate ) {
            $( "#from" ).datepicker( "option", "maxDate", selectedDate );
        }
    });
};
