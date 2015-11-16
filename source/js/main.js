$(document).ready(function() {
    smoothScroll.init({
        updateURL: false,
    });

    $('a[rel="external"]')
        .click( function() {
        window.open( $(this).attr('href') );
        return false;
    });
});
