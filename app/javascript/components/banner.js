import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Enter a plant name","Or a #plantname", "We will find it for you"],
    typeSpeed: 60,
    loop: true,
    showCursor: false,
    attr: "placeholder"
  });
};

export { loadDynamicBannerText };