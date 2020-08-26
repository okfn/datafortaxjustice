$(document).ready(function() {

  //grid
  var $container = $('.members .orgs');
  // init
  $container.packery({
    itemSelector: '.member',
    gutter: 0,
   "columnWidth": 1,
   "rowHeight": 1
  });


  //smooth scroll
  smoothScroll.init({
      updateURL: false,
  });


  //external links
  $('a[rel="external"]')
      .click( function() {
      window.open( $(this).attr('href') );
      return false;
  });
});
