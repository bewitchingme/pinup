// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap.min
//= require admin-lte
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.turbolinks
//= require jquery.infinitescroll
//= require bootstrap-datepicker
//= require moment
//= require bootstrap-datetimepicker
//= require turbolinks
//= require spin.min
//= require_tree .

$(document).ready(function() {
  // Enable datetimepicker
  $('.datetimepicker').datetimepicker();
  
  $('#ad').css('background-image', 'url("' + $('#ad').data('img-url') + '")');

  // Cal Upload Trigger
  $('#cal-upload-btn').click(function (event) {
    var opts = {
      lines: 15, // The number of lines to draw
      length: 25, // The length of each line
      width: 10, // The line thickness
      radius: 34, // The radius of the inner circle
      corners: 1, // Corner roundness (0..1)
      rotate: 11, // The rotation offset
      direction: 1, // 1: clockwise, -1: counterclockwise
      color: '#000', // #rgb or #rrggbb or array of colors
      speed: 1.2, // Rounds per second
      trail: 90, // Afterglow percentage
      shadow: false, // Whether to render a shadow
      hwaccel: false, // Whether to use hardware acceleration
      className: 'spinner', // The CSS class to assign to the spinner
      zIndex: 2e9, // The z-index (defaults to 2000000000)
      top: '50%', // Top position relative to parent
      left: '50%' // Left position relative to parent
    };
    var target = document.getElementById('spinner');
    var spinner = new Spinner(opts).spin(target);
  });

  // Cal Load Trigger
  $('#google-cal-btn').click(function (event) {
    var opts = {
      lines: 15, // The number of lines to draw
      length: 25, // The length of each line
      width: 10, // The line thickness
      radius: 34, // The radius of the inner circle
      corners: 1, // Corner roundness (0..1)
      rotate: 11, // The rotation offset
      direction: 1, // 1: clockwise, -1: counterclockwise
      color: '#000', // #rgb or #rrggbb or array of colors
      speed: 1.2, // Rounds per second
      trail: 90, // Afterglow percentage
      shadow: false, // Whether to render a shadow
      hwaccel: false, // Whether to use hardware acceleration
      className: 'spinner', // The CSS class to assign to the spinner
      zIndex: 2e9, // The z-index (defaults to 2000000000)
      top: '50%', // Top position relative to parent
      left: '50%' // Left position relative to parent
    };
    var target = document.getElementById('spinner');
    var spinner = new Spinner(opts).spin(target);
  });

  // File Upload Trigger
  $('#file-upload-btn').click(function (event) {
    event.preventDefault();
    $('#file-upload').click();
  });

  // File Upload Text
  $(document).on('change', '#file-upload', function() {
    var input = $(this),
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    $('#file-upload-label').text(label);
  });

  // Ad Upload Trigger
  $('#image-upload-btn').click(function (event) {
    event.preventDefault();
    $('#image-upload').click();
  });

  // Ad Upload Text
  $(document).on('change', '#image-upload', function() {
    var input = $(this),
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    $('#image-upload-label').text(label);
  });

  // Banner Upload Trigger
  $('#ban-upload-btn').click(function (event) {
    event.preventDefault();
    $('#ban-upload').click();
  });

  // Ad Upload Text
  $(document).on('change', '#ban-upload', function() {
    var input = $(this),
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    $('#ban-upload-label').text(label);
  });
});