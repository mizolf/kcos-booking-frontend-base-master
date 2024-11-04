// props is an object:
// {button: {id: "trigger_id", text:["text_after_click", "text_before"]}, container_id: "id_of_the_element_that_toggles"}
function simpleToggle(props) {
  $container = $('#'+props.container_id);
  $button = $("#"+props.button.id);

  $container.hide();

  $button.click(function() {
    $container.toggle( "slow", function() {
      if ($(this).is(':visible')) {
        $button.text(props.button.text[0]);
        $button.removeClass('btn--show');
        $button.addClass('btn--remove');
      } else {
        $button.text(props.button.text[1]);
        $button.removeClass('btn--remove');
        $button.addClass('btn--show');
      };
    });
  });
};
