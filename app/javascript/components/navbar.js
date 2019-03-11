import $ from 'jquery';

const scrolling = () => {

  $(window).scroll(function(){
  $('nav').toggleClass('navbar-bg-scrolled', $(this).scrollTop() > 50);

});
}

export {scrolling};