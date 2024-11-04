$(function(){
  $(".copy_to_clipboard").on("click", function(e){
    copyToClipboard($(this));
  })

  function copyToClipboard(button) {
    var element = $(button).closest("code").find("xmp");
    var $temp = $("<textarea>");
    $("body").append($temp);
    $temp.val($(element).html()).select();
    document.execCommand("copy");
    $temp.remove();
    popupMessage("Copied To Clipboard!");
  }

  function popupMessage(message){
    $("#popup-message").text(message).fadeIn(300);
    $("#popup-message").delay(1000).fadeOut(1000);
  }
})

