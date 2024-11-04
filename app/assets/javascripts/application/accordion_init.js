$(function () {

  var $head = $('.js-accordion__head');
  var $body = $('.js-accordion__body');

  $('.accordion__item').first().addClass('active');
  $body.first().slideDown();

  $head.on('click', toggleBody);

  function toggleBody() {

    if (!$(this).closest('.accordion__item').hasClass('active')) {
      $('.accordion__item').removeClass('active');
      var $current = $(this).next()
      $current.closest('.accordion__item').addClass('active');
      $body.not($current).slideUp();
      $current.slideToggle();
    }

  }

});
