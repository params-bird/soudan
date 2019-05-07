
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

// First we get the viewport height and we multiple it by 1% to get a value for a vh unit
let vh = window.innerHeight * 0.01;
// Then we set the value in the --vh custom property to the root of the document
document.documentElement.style.setProperty('--vh', `${vh}px`);

// We listen to the resize event
window.addEventListener('resize', () => {
  // We execute the same script as before
  let vh = window.innerHeight * 0.01;
  document.documentElement.style.setProperty('--vh', `${vh}px`);
});
