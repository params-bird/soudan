//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
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
