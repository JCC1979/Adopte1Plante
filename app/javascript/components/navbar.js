import $ from 'jquery';

const scrolling = () => {

  $(window).scroll(function(){
  $('nav').toggleClass('navbar-bg-scrolled', $(this).scrollTop() > 50);
  $('.nav-link').toggleClass('nav-link-scrolled', $(this).scrollTop() > 50);
  if ($(this).scrollTop() > 50) {
    $('.img-navbar').attr('src','/assets/logowhite.png');
  } else {
    $('.img-navbar').attr('src','/assets/logogrey-259eb35ae39c10fbdd25be84a5dc90fc3d942edd4cea0913c38b4989e81a0340.png');
  }
});
}

export {scrolling};