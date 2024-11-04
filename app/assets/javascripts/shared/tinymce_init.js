function load_tiny (locale) {
   tinyMCE.init({
     selector: "textarea.tinymce",
     language: locale,
     theme: "modern",
     file_picker_types: 'file image media',
     extended_valid_elements: "script[*]",
     relative_urls: false,
     toolbar: ["attachment | styleselect | link unlink | image media | codesample | twitter_url instagram | table | undo redo","bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | forecolor backcolor | fullscreen preview"],
     plugins: "codesample,table,fullscreen,image,uploadimage,link,preview,autolink,advlist,lists,charmap,hr,anchor,pagebreak,searchreplace,wordcount,visualblocks,visualchars,code,insertdatetime,media,nonbreaking,save,contextmenu,directionality,paste,textcolor,colorpicker,textpattern",
     height: "1000",
     setup: function (editor) {
      editor.addButton('twitter_url', {
        text:false,
        icon: true,
        tooltip: 'Embed Twitter post',
        image: "<%= asset_url 'icons/nav/twitter.svg' %>",
        onclick: function () {
          editor.windowManager.open({
            title: 'Twitter Embed',
            body: [
              {
                type: 'textbox',
                size: 40,
                height: '100px',
                name: 'twitter',
                label: 'twitter URL'
              }
            ],
            onsubmit: function(e) {
                var tweetEmbedCode = e.data.twitter;
                $.ajax({
                  url: "https://publish.twitter.com/oembed?url="+tweetEmbedCode,
                  dataType: "jsonp",
                  async: false,
                  success: function(data){
                    console.log(data);
                    tinyMCE.activeEditor.insertContent(data.html);
                  },
                  error: function (jqXHR, exception) {
                    var msg = '';
                    if (jqXHR.status === 0) {
                      msg = 'Not connect.\n Verify Network.';
                    } else if (jqXHR.status == 404) {
                      msg = 'Requested page not found. [404]';
                    } else if (jqXHR.status == 500) {
                      msg = 'Internal Server Error [500].';
                    } else if (exception === 'parsererror') {
                      msg = 'Requested JSON parse failed.';
                    } else if (exception === 'timeout') {
                      msg = 'Time out error.';
                    } else if (exception === 'abort') {
                      msg = 'Ajax request aborted.';
                    } else {
                      msg = 'Uncaught Error.\n' + jqXHR.responseText;
                    }
                    alert(msg);
                  },
              });
            }
          });
        }
      });
      editor.addButton('instagram', {
        text:false,
        icon: true,
        tooltip: 'Embed Instagram post',
        image: "<%= asset_url 'icons/nav/instagram.svg' %>",
        onclick: function() {
          editor.windowManager.open({
              title: 'Instagram Embed',
               body: [
                {
                  type: 'textbox',
                  //minHeight: '800px',
                  multiline: true,
                  name: 'instagram',
                  label: 'Embed code'
                }
              ],
              onSubmit: function(e) {
                  var embedCode = e.data.instagram;
                  var script = embedCode.match(/<script.*<\/script>/)[0];
                  var scriptSrc = script.match(/".*\.js/)[0].split("\"")[1];
                  var sc = document.createElement("script");
                  sc.setAttribute("src", scriptSrc);
                  sc.setAttribute("type", "text/javascript");

                  var iframe = document.getElementById(editor.id + "_ifr");
                  var iframeHead = iframe.contentWindow.document.getElementsByTagName('head')[0];

                  tinyMCE.activeEditor.insertContent(embedCode);
                  iframeHead.appendChild(sc);
              }
          });
        }
      });
    }
   });
  tinymce.editors = [];
}

function load_limited_tiny(locale) {
  tinyMCE.remove();
   tinyMCE.init({
     selector: "textarea.limited-tinymce",
     language: locale,
     relative_urls: false,
     menubar: false,
     resize: false,
     toolbar: " undo redo | bold italic", 
     height: "200",
   });
  tinymce.editors = [];
}

function initConsentTiny(locale) {
  tinyMCE.remove();
   tinyMCE.init({
     selector: "textarea.consent-tinymce",
     language: locale,
     relative_urls: false,
     menubar: false,
     resize: false,
     plugins: 'link',
     toolbar: " undo redo | link unlink ", 
     height: "200",
   });
  tinymce.editors = [];
}

/* To initialize:
  load_tiny ("<%= I18n.locale %>");
*/