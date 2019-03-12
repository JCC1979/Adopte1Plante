
const scrolldown = () => {

$(function() {
  $('.scroll-down, #seeall').click (function() {
    $('html, body').animate({scrollTop: $('section.ok').offset().top }, 'slow');
    return false;
  });
});
};

export {scrolldown};