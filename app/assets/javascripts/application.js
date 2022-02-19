// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//user_show


document.addEventListener("turbolinks:load", function() {
  $(function(){
    $('#card-back').hide();
    $('.btn-open').on('click',()=>{
      $('#card-back').show('slow');
    });
  
    $('.btn-close').on('click',()=>{
      $('#card-back').hide('slow');
    });
  });
  
  $(function(){
     $('.scroll-button').click(function(){
      $(this).toggleClass('scroll-on');
    });
    $('.scroll-button').click(function(){
    scrollPage()
    });
  });
});