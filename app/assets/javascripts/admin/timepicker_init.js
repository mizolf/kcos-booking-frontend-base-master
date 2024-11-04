//if you wan't to use:
//    init_datepicker();

function init_timepicker(options = {}) {
  var defaultOptions = options;

  defaultOptions.timeFormat = "timeFormat" in options ? options.timeFormat : "HH:mm";
  defaultOptions.dynamic = "dynamic" in options ? options.dynamic : false;
  defaultOptions.dropdown = "dropdown" in options ? options.dropdown : true;
  defaultOptions.scrollbar = "scrollbar" in options ? options.scrollbar : true;

  $('input.timepicker').timepicker(defaultOptions)
};
