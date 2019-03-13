
const scrolldown = () => {

$(function() {
  $('#resultSearch').click (function() {
    $('html, body').animate({scrollTop: $('section.ok').offset().top }, 'slow');
    return false;
  });
});
};

export {scrolldown};