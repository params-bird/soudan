// = require jquery
// = require rails-ujs
// = require_tree .
//= require popper
//= require bootstrap-sprockets

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
