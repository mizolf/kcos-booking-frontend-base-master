function imagesPreview(input, placeToInsertImagePreview, modelName, nestedModelName, fieldName) {

    if (input.files) {
        var filesAmount = input.files.length;

        for (i = 0; i < filesAmount; i++) {
            var reader = new FileReader();
            reader.onload = function(event) {
                let index = new Date().getTime();
                let hiddenField = $('<input>');
                let deleteCheckbox = $('<input>');
                hiddenField.attr({
                  type: 'hidden',
                  name: ''+modelName+'['+nestedModelName+'_attributes]['+index+']['+fieldName+']',
                  value: event.target.result
                });
                deleteCheckbox.attr({
                  type: 'checkbox',
                  name: ''+modelName+'['+nestedModelName+'_attributes]['+index+'][_destroy]',
                  class: 'img-'+index,
                  value: true,
                  style: 'display: none;'
                });
                hiddenField.appendTo(placeToInsertImagePreview);
                deleteCheckbox.appendTo(placeToInsertImagePreview);
                $($.parseHTML('<img>')).attr({
                  src: event.target.result,
                  id: 'img-'+index,
                  onclick: 'toggleChk(this)'
                }).height(200).appendTo(placeToInsertImagePreview);
            }

            reader.readAsDataURL(input.files[i]);
        }
      }
    }
function toggleChk(image){

  $(image).toggleClass("delete_image");

  if($(image).hasClass("delete_image")){
    $("input[class="+image.id+"]").prop('checked', true);
  }
  else{
    $("input[class="+image.id+"]").prop('checked', false);
  }

}

  // And you need this in your form

  // <%= file_field_tag :file, :multiple => true, id: "image_multi" %>

  // <div class="gallery">
  //   <%= form.fields_for :post_images do |ff| %>
  //     <% unless ff.object.new_record? %>
  //       <%= ff.check_box :_destroy, value: true, class: "img-#{ff.object.id}", style: "display: none;"  %>
  //       <%= image_tag ff.object.file_url, id: "img-#{ff.object.id}", onclick: "toggleChk(this)", height: 200 %>
  //     <% end %>
  //   <% end %>
  // </div>

  // <script>
  //     $('#image_multi').on('change', function() {
  //         imagesPreview(this, 'div.gallery', 'post', 'post_images', 'file');
  //     });
  // </script>
