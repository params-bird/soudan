
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


$(function(){
  $('#what-soudan').on('click', function(){
      var targetTop = $('.what-soudan').offset().top;
      $('html,body').animate({
        scrollTop: targetTop
      }, 500);
      return false;
  });
});

$(function(){
  $('#service-title').on('click', function(){
      var targetTop = $('.what-soudan').offset().top;
      $('html,body').animate({
          scrollTop: targetTop
      }, 500);
      return false;
  });
});

$(function(){
  $('.footer-nav__header').on('click', function(){
      var targetTop = $('.mobile-body__main__top-page').offset().top;
      $('html,body').animate({
          scrollTop: targetTop
      }, 300);
      return false;
  });
});


$(function(){
  $('.footer-nav__header').on('click', function(){
      var targetTop = $('.mobile-body__main__top-page').offset().top;
      $('html,body').animate({
          scrollTop: targetTop
      }, 300);
      return false;
  });
});


$(function () {
  $('message-page__topic-title').click(function () {
      $('form').toggle();
  });
});
