const changeSML = () => {
  //element image
  const elementImg = document.getElementById("card-main-image");

  //elements de selection de la taille
  const elementSizeS = document.getElementById("sizeS");
  const elementSizeM = document.getElementById("sizeM");
  const elementSizeL = document.getElementById("sizeL");

  //elements pots
  const elementPot1 = document.getElementById("pot1");
  const elementPot2 = document.getElementById("pot2");
  const elementPot3 = document.getElementById("pot3");

  //elements prix des pots
  const elementPot1Price = document.querySelector("#pot1 .card-pot-price");
  const elementPot2Price = document.querySelector("#pot2 .card-pot-price");
  const elementPot3Price = document.querySelector("#pot3 .card-pot-price");

  // taille S
  elementSizeS.addEventListener("click", (event) => {

    // mise a jour des prix des pots
    elementPot1Price.innerHTML = `${ elementPot1.dataset.priceS / 100} €`;
    elementPot2Price.innerHTML = `${ elementPot2.dataset.priceS / 100} €`;
    elementPot3Price.innerHTML = `${ elementPot3.dataset.priceS / 100} €`;

    elementPot1.dataset.price = elementPot1.dataset.priceS;
    elementPot2.dataset.price = elementPot2.dataset.priceS;
    elementPot3.dataset.price = elementPot3.dataset.priceS;

    //mise a jour de l'image
    elementImg.style.backgroundImage = 'url(/images/composition/planteS.jpg)';

    //mise a jour de la selection de la taille
    elementSizeS.classList.add("card-main-size-active");
    elementSizeM.classList.remove("card-main-size-active");
    elementSizeL.classList.remove("card-main-size-active");
    updatePrice();
  });

  //taille M
  elementSizeM.addEventListener("click", (event) => {

    // mise a jour des prix des pots
    elementPot1Price.innerHTML = `${ elementPot1.dataset.priceM / 100} €`;
    elementPot2Price.innerHTML = `${ elementPot2.dataset.priceM / 100} €`;
    elementPot3Price.innerHTML = `${ elementPot3.dataset.priceM / 100} €`;

    elementPot1.dataset.price = elementPot1.dataset.priceM;
    elementPot2.dataset.price = elementPot2.dataset.priceM;
    elementPot3.dataset.price = elementPot3.dataset.priceM;

    //mise a jour de l'image
    elementImg.style.backgroundImage = 'url(/images/composition/planteM.jpg)';

    //mise a jour de la selection de la taille
    elementSizeS.classList.remove("card-main-size-active");
    elementSizeM.classList.add("card-main-size-active");
    elementSizeL.classList.remove("card-main-size-active");
    updatePrice();
  });

  //taille L
  elementSizeL.addEventListener("click", (event) => {

    // mise a jour des prix des pots
    elementPot1Price.innerHTML = `${ elementPot1.dataset.priceL / 100} €`;
    elementPot2Price.innerHTML = `${ elementPot2.dataset.priceL / 100} €`;
    elementPot3Price.innerHTML = `${ elementPot3.dataset.priceL / 100} €`;
    
    elementPot1.dataset.price = elementPot1.dataset.priceL
    elementPot2.dataset.price = elementPot2.dataset.priceL
    elementPot3.dataset.price = elementPot3.dataset.priceL

    //mise a jour de l'image
    elementImg.style.backgroundImage = 'url(/images/composition/planteL.jpg)';

    //mise a jour de la selection de la taille
    elementSizeS.classList.remove("card-main-size-active");
    elementSizeM.classList.remove("card-main-size-active");
    elementSizeL.classList.add("card-main-size-active");
    updatePrice();
  });

};

const changePot= () => {
  //element des pots
  const elementPot1 = document.getElementById("pot1");
  const elementPot2 = document.getElementById("pot2");
  const elementPot3 = document.getElementById("pot3");
  elementPot1.addEventListener("click", (event) => {
    elementPot1.classList.add("card-pot-active");
    elementPot2.classList.remove("card-pot-active");
    elementPot3.classList.remove("card-pot-active");
    
    updatePrice();
  });

  elementPot2.addEventListener("click", (event) => {
    elementPot1.classList.remove("card-pot-active");
    elementPot2.classList.add("card-pot-active");
    elementPot3.classList.remove("card-pot-active");
    
    
    updatePrice();
  });

  elementPot3.addEventListener("click", (event) => {
    elementPot1.classList.remove("card-pot-active");
    elementPot2.classList.remove("card-pot-active");
    elementPot3.classList.add("card-pot-active");

    updatePrice();
  });

};

const updatePrice = () => {
  //element de la case total du prix
  const elementPrice = document.getElementById("price-compo");
  const sizeActive = document.querySelector(".card-main-size-active")
  let price = parseInt(sizeActive.dataset.price);
    if (document.querySelector(".card-pot-active")) {
      const elementPotActive = document.querySelector(".card-pot-active");
      price += parseInt(elementPotActive.dataset.price);
    } 
    elementPrice.innerText = `${ price / 100} €`;
}

const changeImg = () => {
  console.log("toto")
  // const elementImg = document.getElementById("card-main-image");
  // const elementSizeS = document.getElementById("sizeS");
  // elementSizeS.addEventListener("click", (event) => {
  //   elementImg.style.backgroundImage = 'url(/images/composition/planteS.jpg)';
  // });
};


export { changeSML, changePot, changeImg };