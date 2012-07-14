$ ->
  $('.content').hide()
  $('nav li > ul').hide()
      
  $('nav > ul > li').hoverIntent 
    over: ->
      $('ul', @).slideToggle(400)
    out: ->
      $('ul', @).slideToggle(400)
  
  $('a[href="#"]').click (event) ->
    event.preventDefault()
    
  $('.items').isotope
    itemSelector : '.item',
    layoutMode : 'fitRows'
  
  $('.filters a').click ->
    $('.filters li.selected').removeClass('selected')
    $(@).parent().addClass('selected')
    selector = $(this).attr('data-filter')
    $('.items:visible').isotope filter: selector
    $('.items a').unbind('click')
    $('a[rel="prettyPhoto[\'gallery\']"]').removeAttr('rel')
    $('.items li:not(.isotope-hidden)', $(@).parents('.content')).find('a').attr('rel', 'prettyPhoto[\'gallery\']').prettyPhoto
      gallery_markup: ''
      social_tools: ''
      deeplinking: false
      
  ###
  $('.items li:not(".isotope-hidden") a img').hoverIntent
    over: ->
      $('<h4 class="card"></h4>').text($(@).attr('alt')).appendTo($(@).parent())\
      .attr('style', $(@).parents('li.isotope-item').attr('style'))
      console.log 'over' + $(@).attr('src')
    out: ->
      $(@).siblings().remove()
      console.log 'out'
  ###
    
  $.backstretch("images/logo.png", {}, ->
                                          Path.listen()
                                          ###
                                          console.log $('#backstretch').width()/2
                                          console.log $('nav').width()
                                          console.log $('nav').offset().left
                                          console.log $('nav').offset().left + $('nav').width()
                                          
                                          $('<div />')
                                          .appendTo('body')
                                          .css('position', 'absolute')
                                          .css('width', '30px')
                                          .css('height', '21.1333px')
                                          .css('background', 'red')
                                          .css('left', '0px')
                                          .css('bottom', '8%')
                                          .css('-moz-transform', 'skewX(-45deg)')
                                          .css('-webkit-transform', 'skewX(-45deg)')
                                          .css('-o-transform', 'skewX(-45deg)')
                                          .css('-ms-transform', 'skewX(-45deg)')
                                          .css('transform', 'skewX(-45deg)')
                                          ###
                                          )