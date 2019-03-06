import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Choose your best artits!","take the best!", "Change your party with R'n'B Artist!", "You choose, he sings!"],
    typeSpeed: 60,
    loop: true,
    showCursor: false,
    attr: "placeholder"
  });
};

export { loadDynamicBannerText };