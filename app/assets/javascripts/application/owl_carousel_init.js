$(function () {

  $('.owl-carousel--basic').owlCarousel({
    loop: true,
    center: true,
    nav: false,
    navText: '',
    dots: false,
    dotsEach: false,
    dotsContainer: false,
    autoplay: true,

    responsive: {

      0: {
        items: 3,
      },

      640: {
        items: 4,
      },

      1024: {
        items: 6,
      }
    }
  });

  $('.owl-carousel--toolkit').owlCarousel({
    loop: true,
    center: true,
    nav: false,
    dots: false,
    dotsEach: false,
    dotsContainer: false,
    autoplay: true,
    items: 1
  });


});
