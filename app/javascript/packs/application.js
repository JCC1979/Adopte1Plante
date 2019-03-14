
// text pour la banner
import { loadDynamicBannerText } from '../components/banner';
if (document.getElementById("banner-typed-text")) {
  loadDynamicBannerText();
}

// interaction pour changement de pot et de tail sur les compostions
import { changeSML, changePot, changeImg } from '../components/composition';
if (document.getElementById("sizeS")) {
  changeSML(); changeImg();
}

if (document.getElementById("pot1")) {
  changePot();
}

// hover sur la card home //
import { hover } from '../components/cards';
if (document.getElementsByClassName('.card')) {
  hover();
}

// select2
import { initSelect2 } from '../plugins/init_select2';
initSelect2();

import { scrolling } from '../components/navbar';

// Pour afficher la navbar non transparente sur autres pages que la home
if (document.querySelector('.banner-home')) {
  scrolling();
}
else {
  document.querySelectorAll('.nav-link').forEach((element) => {
  element.classList.add('nav-link-scrolled');
  const nav = document.querySelector('nav')
  nav.classList.add('navbar-bg-scrolled');
  const img = document.querySelector('.img-navbar')
  img.src = '/assets/logowhite-ba41c5e521ef86596c859330277f86f2cd114fd0760c7a079d06a2aca5640760.png';

  });
};

import { plus } from '../components/voirplus';
if (document.getElementById("voirplus")) {
  plus();
}


import { scrolldown } from '../components/scroll';
if (document.querySelector('#voirplus')) {
  scrolldown();
}

import { searchplant } from '../plugins/plantsearch';
if (document.getElementById("term")) {
  searchplant();
}
