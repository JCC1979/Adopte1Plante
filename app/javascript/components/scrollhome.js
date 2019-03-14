const scrollhome = () => {

$(function() {
  $('.scroll-down').click (function() {
    $('html, body').animate({scrollTop: $('section.ok').offset().top -100 }, 'slow');
    return false;
  });
});
};

export {scrollhome}; 