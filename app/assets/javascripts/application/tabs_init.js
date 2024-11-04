// http://callmenick.com/post/simple-responsive-tabs-javascript-css

$(function () {

  var $tab = $('.js-tabs-btn');
  var $content = $('.js-tabs-content > div');
  var $index = 0;

  $tab.first().addClass('is-active');
  $content.first().addClass('is-active');

  $tab.on('click', toggleTab);

  function toggleTab() {
    $content.removeClass('is-active');
    $tab.removeClass('is-active');
    $index = $tab.index(this);
    console.log($index);
    $content.eq($index).addClass('is-active');
    $tab.eq($index).addClass('is-active');
  }

});
