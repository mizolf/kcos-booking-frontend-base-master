// $(function () {

//   var $head = $('.js-accordion__head');
//   var $body = $('.js-accordion__body');

//   $('.accordion__item').first().addClass('active');
//   $body.first().slideDown();

//   $head.on('click', toggleBody);

//   function toggleBody() {

//     if (!$(this).closest('.accordion__item').hasClass('active')) {
//       $('.accordion__item').removeClass('active');
//       var $current = $(this).next()
//       $current.closest('.accordion__item').addClass('active');
//       $body.not($current).slideUp();
//       $current.slideToggle();
//     }

//   }

// });

$(function () {

  var $head = $('.js-accordion__head');
  var $body = $('.js-accordion__body');

  // Prva stavka je otvorena pri učitavanju stranice
  $('.accordion__item').first().addClass('active');
  $body.first().slideDown();

  $head.on('click', toggleBody);

  function toggleBody() {
    var $item = $(this).closest('.accordion__item'); // Pronađi roditelja (accordion__item)
    var $currentBody = $item.find('.js-accordion__body'); // Pronađi odgovarajući sadržaj

    // Ako je kliknuto pitanje već otvoreno, zatvori ga
    if ($item.hasClass('active')) {
      $currentBody.stop(true, true).slideUp(); // Zatvori sadržaj
      $item.removeClass('active'); // Ukloni 'active' klasu
    } else {
      // Ako nije otvoreno, zatvori sve ostale i otvori trenutno
      $('.accordion__item').removeClass('active'); // Ukloni 'active' sa svih
      $('.js-accordion__body').slideUp(); // Sakrij sve odgovore

      $item.addClass('active'); // Dodaj 'active' trenutnoj stavci
      $currentBody.stop(true, true).slideDown(); // Prikazivanje odgovarajućeg sadržaja
    }
  }

});
