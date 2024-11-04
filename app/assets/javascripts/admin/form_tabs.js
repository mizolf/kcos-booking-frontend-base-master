function initTabs(active_tab_index=0){
  if($(".form__alert--error").length){
    active_tab_index = $(".form__alert--error").first().closest('.js_part').index('.js_part');
  }
  $(".js_part").hide();
  $(".js_part:eq("+active_tab_index+")").show();
  $(".btn--tabs:eq("+active_tab_index+")").addClass("is-active");
  $(".js_tabs").on("click", function(){
    $(".js_part").hide();
    $(".js_part:eq("+$(this).index()+")").show();
    $(".btn--tabs").removeClass("is-active");
    $(this).addClass("is-active");
    $("#tab").val($(this).index('.js_tabs'));
  })

  $('.js_part').each(function(){
    if($(this).find(".form__alert--error").length){
      $('.js_tabs:eq(' + $(this).index('.js_part') + ')').addClass("with-errors");
    }
  })

}