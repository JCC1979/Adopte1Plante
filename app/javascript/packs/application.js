
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

// formulaire interactif sur creation de products//
import { hidden_form } from '../components/formproduct';

if (document.getElementById('form_create_plant')) {
  hidden_form();
}
if (document.getElementById('form_create_pot')) {
  hidden_form();
}