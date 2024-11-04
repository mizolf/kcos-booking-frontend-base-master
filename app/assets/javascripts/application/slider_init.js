$( document ).ready(function() {

  $current = 0;
  showSlides();

  $('.dot').on('click', function() {
    clearTimeout($timer);
    $current = $('.dot').index(this);
    showSlides();
  });

  function showSlides() {
    $('.slider__content').fadeOut(300).removeClass('active');
    $('.dot').removeClass('active');

    $('.slider__content').eq($current).fadeIn(300).addClass('active');
    $('.dot').eq($current).addClass('active');

    $slides = $('.slider .slider__content');
    $current++;
    if ($current == $slides.length) {$current = 0};

    $timer = setTimeout(showSlides, 5000);
  }


});
