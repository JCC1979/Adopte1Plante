const changeSML = () => {
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
    elementPot1Price.innerHTML = `${ parseInt(elementPot1.dataset.priceS) } €`;
    elementPot2Price.innerHTML = `${ parseInt(elementPot2.dataset.priceS) } €`;
    elementPot3Price.innerHTML = `${ parseInt(elementPot3.dataset.priceS) } €`;

    elementPot1.dataset.price = elementPot1.dataset.priceS;
    elementPot2.dataset.price = elementPot2.dataset.priceS;
    elementPot3.dataset.price = elementPot3.dataset.priceS;

    //mise a jour des l'image
    elementPot1.dataset.photo = elementPot1.dataset.photoS;
    elementPot2.dataset.photo = elementPot2.dataset.photoS;
    elementPot3.dataset.photo = elementPot3.dataset.photoS;

    //mise a jour de la selection de la taille
    elementSizeS.classList.add("card-main-size-active");
    elementSizeM.classList.remove("card-main-size-active");
    elementSizeL.classList.remove("card-main-size-active");
    changeImg();
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
    elementPot1Price.innerHTML = `${ parseInt(elementPot1.dataset.priceM) } €`;
    elementPot2Price.innerHTML = `${ parseInt(elementPot2.dataset.priceM) } €`;
    elementPot3Price.innerHTML = `${ parseInt(elementPot3.dataset.priceM) } €`;

    elementPot1.dataset.price = elementPot1.dataset.priceM;
    elementPot2.dataset.price = elementPot2.dataset.priceM;
    elementPot3.dataset.price = elementPot3.dataset.priceM;

    //mise a jour des l'image
    elementPot1.dataset.photo = elementPot1.dataset.photoM;
    elementPot2.dataset.photo = elementPot2.dataset.photoM;
    elementPot3.dataset.photo = elementPot3.dataset.photoM;

    //mise a jour de la selection de la taille
    elementSizeS.classList.remove("card-main-size-active");
    elementSizeM.classList.add("card-main-size-active");
    elementSizeL.classList.remove("card-main-size-active");
    changeImg();
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
    elementPot1Price.innerHTML = `${ parseInt(elementPot1.dataset.priceL) } €`;
    elementPot2Price.innerHTML = `${ parseInt(elementPot2.dataset.priceL) } €`;
    elementPot3Price.innerHTML = `${ parseInt(elementPot3.dataset.priceL) } €`;
    
    elementPot1.dataset.price = elementPot1.dataset.priceL
    elementPot2.dataset.price = elementPot2.dataset.priceL
    elementPot3.dataset.price = elementPot3.dataset.priceL

    //mise a jour des l'images
    elementPot1.dataset.photo = elementPot1.dataset.photoL;
    elementPot2.dataset.photo = elementPot2.dataset.photoL;
    elementPot3.dataset.photo = elementPot3.dataset.photoL;

    //mise a jour de la selection de la taille
    elementSizeS.classList.remove("card-main-size-active");
    elementSizeM.classList.remove("card-main-size-active");
    elementSizeL.classList.add("card-main-size-active");
    changeImg();
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
    changeImg();
    updatePrice();
    updateComposition();
  });

  elementPot2.addEventListener("click", (event) => {
    
    elementPot1.classList.remove("card-pot-active");
    elementPot2.classList.add("card-pot-active");
    elementPot3.classList.remove("card-pot-active");
    
    enablebtn();
    changeImg();
    updatePrice();
    updateComposition();
  });

  elementPot3.addEventListener("click", (event) => {
    elementPot1.classList.remove("card-pot-active");
    elementPot2.classList.remove("card-pot-active");
    elementPot3.classList.add("card-pot-active");

    enablebtn();
    changeImg();
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

const changeImg = () => {
  //element image
  const elementImg = document.getElementById("card-main-image");

  //recuperation de id du pot si actif
  if (document.querySelector(".card-pot-active")) {
    const elementPotActive = document.querySelector(".card-pot-active");
    const photo = elementPotActive.dataset.photo;
    elementImg.style.backgroundImage = `url(${ photo })`;
  } else {
    const sizeActive = document.querySelector(".card-main-size-active");
    const photo = sizeActive.dataset.plantPhoto;
    elementImg.style.backgroundImage = `url(${ photo })`;
  } 
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

export { changeSML, changePot, changeImg };