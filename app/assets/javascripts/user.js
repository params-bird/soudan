// $('#exampleModal').on('show.bs.modal', function (event) {
//   var button = $(event.relatedTarget) // Button that triggered the modal
//   var recipient = button.data('whatever') // Extract info from data-* attributes
//   // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
//   // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
//   var modal = $(this)
//   modal.find('.modal-title').text('New message to ' + recipient)
//   modal.find('.modal-body input').val(recipient)
// })

// $(function(){
//   setTimeout($('＃notice').fadeOut('slow'), 1000);
// });

$(function(){
  setTimeout(function() {
    $('.alert').fadeOut('slow');
  },5000);
});

$(function(){
  setTimeout(function() {
    $('.notice').fadeOut('slow');
  },5000);
});

$(function(){
  setTimeout(function() {
    $('.success').fadeOut('slow');
  },8000);
});


$(document).ready(function() {
  $('.lightSlider').lightSlider({
      item:4,
      loop:false,
      slideMove:2,
      easing: 'cubic-bezier(0.25, 0, 0.25, 1)',
      speed:600,
      responsive : [
          {
              breakpoint:800,
              settings: {
                  item:3,
                  slideMove:1,
                  slideMargin:6,
                }
          },
          {
              breakpoint:480,
              settings: {
                  item:2,
                  slideMove:1
                }
          }
      ]
  });
});


// メッセージ入力フォーム自動拡大　ーーーーーーーーーーーーーーーー

$(document).ready(function() {
  $('.message-input-area').on('focus',function(){
    $('.message-input-area').height(100);
  }).on('submit', function(){
    $('.message-input-area').height(25);
  });
});


$(document).ready(function() {
  $('.message-input-area').on('focus',function(){
    $('.message-container').height(145);
  }).on('submit', function(){
    $('.message-container').height(70);
  });
});

// ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー


