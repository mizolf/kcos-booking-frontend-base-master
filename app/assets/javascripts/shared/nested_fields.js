$(document).on('click', '.remove_fields', function(e){
  e.preventDefault();
  $(this).closest("fieldset").find('input[type=hidden][name$="[_destroy]"]').val(1);
  $(this).closest('fieldset').hide();
});
$(document).on('click', '.add_nested_fields', function(e){
  e.preventDefault();
  var time=new Date().getTime();
  var regexp=new RegExp($(this).data('id'),'g');
  $(this).before($(this).data('fields').replace(regexp,time));
});

/* MULTIPLE IMAGE UPLOAD/PREVIEW */
// Append image
function nestedImageFields(file_field){
  var gallery = $(file_field).closest("fieldset").find(".js_preview_gallery");
  var index = gallery.find(".js_image_wrapper").length;
  if (file_field.files) {
    var filesAmount = file_field.files.length;
    for (i = 0; i < filesAmount; i++) {
      var reader = new FileReader();
      reader.onload = function(event) {
        var regexp = new RegExp($(file_field).data('id'),'g');
        var fields = $(file_field).data('fields').replace(regexp,index);
        index+=1;
        gallery.append(fields);
        gallery.find(".js_image_wrapper:last").find('.js_image_preview').attr("src", event.target.result);
        gallery.find(".js_image_data:last").val(event.target.result);
      };
      image_data = reader.readAsDataURL(file_field.files[i]);
    }
  }
}

// Sorting nested fields
function sortNested(nested){
  $(nested).sortable({
    update: function(e, ui) {
      $(".js_position").each(function( index ){
        $(this).val(index);
      });
    }
  })
}