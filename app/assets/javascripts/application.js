// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
 csrf_param = "authenticity_token";
          csrf_token = "yT2PHzeXra+a8K9QpDIH77xr1ZG8tt7mVnICjswIXV4=";

          // Always send the authenticity_token with ajax
          $(document).ajaxSend(function(event, request, settings) {
            if ( settings.type == 'post' ) {
              settings.data = (settings.data ? settings.data + "&" : "")
                + encodeURIComponent( csrf_param ) + "=" + encodeURIComponent( csrf_token );
            }
          });


        $(document).ready(function(){
          $('.ajaxful-rating a').click(function(){
            $.ajax({
              type: $(this).attr('data-method'),
              url: $(this).attr('href'),
              data: {
                      stars: $(this).attr('data-stars'),
                      dimension: $(this).attr('data-dimension'),
                      size: $(this).attr('data-size'),
                      show_user_rating: $(this).attr('data-show_user_rating')
                    },
              success: function(response){
                  $('#' + "ajaxful_rating_no-small_fortune_" + response.id + ' .show-value').css('width', response.width + '%');
              }
            });
            return false;
          });

        });