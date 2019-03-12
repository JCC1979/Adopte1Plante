import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Entrez le nom d'une plante", "Nous la trouverons pour vous !"],
    typeSpeed: 70,
    loop: true,
    showCursor: false,
    attr: "placeholder"
  });
};

export { loadDynamicBannerText };