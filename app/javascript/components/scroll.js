
const scrolldown = () => {


  var clicks = 0 ;
  $('#voirplus').click(function(event) {
      // Preventing default action of the event
      event.preventDefault();
      // Getting the height of the document
      if (clicks == 0){
        var n = $(document).height();
        $('html, body').animate({ scrollTop: 450 }, 2000);
    } else if (clicks == 1) {
        var n = $(document).height();
        $('html, body').animate({ scrollTop: 800 }, 2000);
    } else if (clicks == 2) {
      var n = $(document).height();
        $('html, body').animate({ scrollTop: 1200 }, 2000);
    } else {
      var n = $(document).height();
      $('html, body').animate({ scrollTop: 1600 }, 2000);
    }
    ++clicks;

});
};

export {scrolldown};