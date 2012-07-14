(function() {
  var hide, map, path, paths, show, _i, _len,
    __slice = Array.prototype.slice;

  hide = function() {
    return $('.content').hide();
  };

  show = function(selector) {
    var op;
    $(selector).fadeIn('slow').find('.filters a').eq(0).click();
    if (selector.indexOf('portfolio') >= 0 && selector.indexOf('music') < 0) {
      op = 0.2;
    } else {
      op = 1.0;
    }
    return $('#backstretch').css('opacity', op);
  };

  map = function(path) {
    var contents, _ref;
    _ref = path.split('/'), contents = 1 <= _ref.length ? __slice.call(_ref, 0) : [];
    if (contents[0] === '#') contents.splice(0, 1);
    return Path.map(path).enter(hide).to(function() {
      return show('.content.' + contents.join('.'));
    });
  };

  paths = ['#/home', '#/about', '#/portfolio/brand-identity', '#/portfolio/illustration', '#/portfolio/photography', '#/portfolio/music'];

  for (_i = 0, _len = paths.length; _i < _len; _i++) {
    path = paths[_i];
    map(path);
  }

  Path.root('#/home');

}).call(this);
