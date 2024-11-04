$(function () {

  $('.js_burger').on('click', function () {
    $('.body').toggleClass('burger-is-active');
    $('.burger-button').toggleClass('is-active');
    $('.burger-button > .icon--burger').toggleClass('is-active')
    $(".js_nav_user").fadeToggle('fast');
  });
});
