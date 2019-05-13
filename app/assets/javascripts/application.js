//= require jquery
//= require rails-ujs
//= require popper
//= require bootstrap-sprockets
//= require_tree .


$(function(){
  setTimeout(function() {
    $('.alert').fadeOut('slow');
  },3000);
});

$(function(){
  setTimeout(function() {
    $('.notice').fadeOut('slow');
  },3000);
});

$(function(){
  setTimeout(function() {
    $('.success').fadeOut('slow');
  },3000);
});
