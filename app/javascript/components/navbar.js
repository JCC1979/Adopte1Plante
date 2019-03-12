import $ from 'jquery';

const scrolling = () => {

  $(window).scroll(function(){
  $('nav').toggleClass('navbar-bg-scrolled', $(this).scrollTop() > 50);
  $('.nav-link').toggleClass('nav-link-scrolled', $(this).scrollTop() > 50);
  if ($(this).scrollTop() > 50) {
    $('.img-navbar').attr('src','/assets/logowhite.png');
  } else {
    $('.img-navbar').attr('src','/assets/logogrey.png');
  }
});
}

export {scrolling};