
const scrolldown = () => {
  const MonTableau = ["section.4","section.8","section.12","section.16","section.20","section.24","section.28"];
  let i = 0
  $(function() {
    $('#voirplus').click (function() {
      console.log("ok michel")
      $('html, body').animate({scrollTop: $(MonTableau[i]).offset().top }, 'slow');
      i++;
      return false;
    });
  });
};

export {scrolldown};