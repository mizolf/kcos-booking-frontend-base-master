$(document).on("change", ".image_file_field", function(e){
  var $input = e.target;
  var $image = $(".img_prev:eq("+$($input).index(".image_file_field")+")");
  if ($input.files && $input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
    console.log($image);
    $image
        .attr('src', e.target.result)
    };
      reader.readAsDataURL($input.files[0]);
    }
  });

   /*<div class="field input__field--text">
      <%= f.label :image, class: "label" %>
      <div class="image_field">
        <img src="<%= f.object.image_url %>" class= "img_prev" alt='Drop File here or click to upload'>
        <%= f.file_field :image, class: "image_file_field" %>
        <%= f.hidden_field :image_cache %>
      </div>
    </div>
  */