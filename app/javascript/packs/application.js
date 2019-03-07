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
