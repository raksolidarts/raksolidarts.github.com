hide = ->
  $('.content').hide()
  
show = (selector) ->
  $(selector).fadeIn('slow').find('.filters a').eq(0).click()
  if selector.indexOf('portfolio') >= 0 \
  and selector.indexOf('music') < 0 
    op = 0.2 
  else 
    op = 1.0
  $('#backstretch').css('opacity', op)

map = (path) ->
  [contents...] = path.split '/'
  contents.splice(0, 1) if contents[0] is '#'
  Path.map(path)
    .enter(hide)
    .to ->
      show('.content.' + contents.join('.'))
  
paths = [
    '#/home',
    '#/about',
    '#/portfolio/brand-identity',
    '#/portfolio/illustration',
    '#/portfolio/photography',
    '#/portfolio/music'
  ]

map path for path in paths

Path.root('#/home')