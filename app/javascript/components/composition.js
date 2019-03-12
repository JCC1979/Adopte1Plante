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

    //mise a jour des ids des pots
    elementPot1.dataset.potId = elementPot1.dataset.potIdS;
    elementPot2.dataset.potId = elementPot2.dataset.potIdS;
    elementPot3.dataset.potId = elementPot3.dataset.potIdS;

    // mise a jour des prix des pots
    elementPot1Price.innerHTML = `${ elementPot1.dataset.priceS } €`;
    elementPot2Price.innerHTML = `${ elementPot2.dataset.priceS } €`;
    elementPot3Price.innerHTML = `${ elementPot3.dataset.priceS } €`;

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
    updateComposition();
  });

  //taille M
  elementSizeM.addEventListener("click", (event) => {

    //mise a jour des ids des pots
    elementPot1.dataset.potId = elementPot1.dataset.potIdM;
    elementPot2.dataset.potId = elementPot2.dataset.potIdM;
    elementPot3.dataset.potId = elementPot3.dataset.potIdM;

    // mise a jour des prix des pots
    elementPot1Price.innerHTML = `${ elementPot1.dataset.priceM } €`;
    elementPot2Price.innerHTML = `${ elementPot2.dataset.priceM } €`;
    elementPot3Price.innerHTML = `${ elementPot3.dataset.priceM } €`;

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
    updateComposition();
  });

  //taille L
  elementSizeL.addEventListener("click", (event) => {

    //mise a jour des ids des pots
    elementPot1.dataset.potId = elementPot1.dataset.potIdL;
    elementPot2.dataset.potId = elementPot2.dataset.potIdL;
    elementPot3.dataset.potId = elementPot3.dataset.potIdL;

    // mise a jour des prix des pots
    elementPot1Price.innerHTML = `${ elementPot1.dataset.priceL } €`;
    elementPot2Price.innerHTML = `${ elementPot2.dataset.priceL } €`;
    elementPot3Price.innerHTML = `${ elementPot3.dataset.priceL } €`;
    
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
    updateComposition();
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
    
    enablebtn();
    updatePrice();
    updateComposition();
  });

  elementPot2.addEventListener("click", (event) => {
    
    elementPot1.classList.remove("card-pot-active");
    elementPot2.classList.add("card-pot-active");
    elementPot3.classList.remove("card-pot-active");
    
    enablebtn();
    updatePrice();
    updateComposition();
  });

  elementPot3.addEventListener("click", (event) => {
    elementPot1.classList.remove("card-pot-active");
    elementPot2.classList.remove("card-pot-active");
    elementPot3.classList.add("card-pot-active");

    enablebtn();
    updatePrice();
    updateComposition();
  });

};

const updatePrice = () => {
  //element de la case total du prix
  const elementPrice = document.getElementById("price-compo");
  const sizeActive = document.querySelector(".card-main-size-active");
  let price = parseInt(sizeActive.dataset.price);
    if (document.querySelector(".card-pot-active")) {
      const elementPotActive = document.querySelector(".card-pot-active");
      price += parseInt(elementPotActive.dataset.price);
    } 
    elementPrice.innerText = `${ price } €`;
}

const updateComposition = () => {
  //recuperation de id de la plante
  const sizeActive = document.querySelector(".card-main-size-active");
  const formPlantId = document.getElementById("plantId");
  formPlantId.value = sizeActive.dataset.plantId;

  //recuperation de id du pot si actif
  if (document.querySelector(".card-pot-active")) {
    const elementPotActive = document.querySelector(".card-pot-active");
    const formPotId = document.getElementById("potId");
    formPotId.value = elementPotActive.dataset.potId;
  } 
}

const enablebtn = () => {
  const submitbtn = document.getElementById("price-submit");
  const textbtn = document.getElementById("text-submit");
  submitbtn.removeAttribute("disabled");
  textbtn.innerHTML="";
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