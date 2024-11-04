$(function(){
  var field, field_name, field_value, resource_name, url;

  $(".js_inline_validate .js_validate_me").on('blur', function() {
    field = this;
    resource_name = $(field).closest('form').data('resourceName');
    field_name = this.id.replace(resource_name+'_', '');
    field_value = $(field).val();
    url = $(field).closest('form').data('validateUrl') + '?' + field_name + '=' + field_value;
    return $.ajax(url, {
      type: 'POST',
      dataType: "json",
      success: function(data, textStatus, jqXHR) {
        var field_group;
        field = $("." + 'js_'+resource_name+'_' + data['field_name']);
        field.next('.form__alert').remove();
        if (data['valid']) {
          field.removeClass('has-error');
          field.closest("div").removeClass("field_with_errors");
          return field.addClass('success-block');
        } else {
          field.addClass('has-error');
          field.removeClass('success-block');
          return field.closest("div").append("<span class='form__alert form__alert--error'>" + data['message'] + "</span>");
        }
      }
    });

  });
});