# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $(document).ready ->
#   $('.event').each ->
#     cover_url = $(this).data('cover-url')
#     $("a div[class*='col-']", this).first().css('background-image', 'url("' + cover_url + '")')

$(document).ready ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_posts_url = $('.pagination .next a').attr('href')
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').html('<img src="/assets/loading.gif" alt="Loading..." title="Loading..." />')
        $.getScript more_posts_url
      return
    return