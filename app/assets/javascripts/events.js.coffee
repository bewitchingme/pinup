# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#events").infinitescroll
    navSelector: ".prev" # selector for the paged navigation (it will be hidden)
    nextSelector: ".next" # selector for the NEXT link (to page 2)
    itemSelector: ".event" # selector for all items you'll retrieve