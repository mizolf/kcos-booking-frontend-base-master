// ANCHOR SLIDE TRANSITION


$(function () {

  var $root = $('html, body');
  $('.js-anchor').click(function () {
    $root.animate({
      // scrollTop: $($.attr(this, 'href')).offset().top
      scrollTop: 0
    }, 500);
    return false;
  });

});
