const changeSML = () => {
  const elementImg = document.getElementById("card-main-image");
  const elementSizeS = document.getElementById("sizeS");
  const elementSizeM = document.getElementById("sizeM");
  const elementSizeL = document.getElementById("sizeL");
  const elementPrice = document.getElementById("price-compo");

  elementSizeS.addEventListener("click", (event) => {
    let price = parseInt(elementSizeS.dataset.price);
    if (document.querySelector(".card-pot-active")) {
      const elementPotActive = document.querySelector(".card-pot-active");
      price += parseInt(elementPotActive.dataset.priceS);
    } 

    elementImg.style.backgroundImage = 'url(/images/composition/planteS.jpg)';
    elementPrice.innerText = `${ price / 100} €`;
    elementSizeS.classList.add("card-main-size");
    elementSizeM.classList.add("card-main-size-disable");
    elementSizeL.classList.add("card-main-size-disable");
    elementSizeS.classList.remove("card-main-size-disable");
    elementSizeM.classList.remove("card-main-size");
    elementSizeL.classList.remove("card-main-size");
  });

  elementSizeM.addEventListener("click", (event) => {
    let price = parseInt(elementSizeM.dataset.price);
    if (document.querySelector(".card-pot-active")) {
      const elementPotActive = document.querySelector(".card-pot-active");
      price += parseInt(elementPotActive.dataset.priceM);
    } 
    elementImg.style.backgroundImage = 'url(/images/composition/planteM.jpg)';
    elementPrice.innerText = `${ price / 100} €`;
    elementSizeS.classList.add("card-main-size-disable");
    elementSizeM.classList.add("card-main-size");
    elementSizeL.classList.add("card-main-size-disable");
    elementSizeS.classList.remove("card-main-size");
    elementSizeM.classList.remove("card-main-size-disable");
    elementSizeL.classList.remove("card-main-size");
  });

  elementSizeL.addEventListener("click", (event) => {
    let price = parseInt(elementSizeL.dataset.price);
    if (document.querySelector(".card-pot-active")) {
      const elementPotActive = document.querySelector(".card-pot-active");
      price += parseInt(elementPotActive.dataset.priceL);
    } 
    elementImg.style.backgroundImage = 'url(/images/composition/planteL.jpg)';
    elementPrice.innerText = `${ price / 100} €`;
    elementSizeS.classList.add("card-main-size-disable");
    elementSizeM.classList.add("card-main-size-disable");
    elementSizeL.classList.add("card-main-size");
    elementSizeS.classList.remove("card-main-size");
    elementSizeM.classList.remove("card-main-size");
    elementSizeL.classList.remove("card-main-size-disable");
  });

};

const changePot= () => {
  const elementPot1 = document.getElementById("pot1");
  const elementPot2 = document.getElementById("pot2");
  const elementPot3 = document.getElementById("pot3");
  elementPot1.addEventListener("click", (event) => {
    elementPot1.classList.add("card-pot-active");
    elementPot2.classList.remove("card-pot-active");
    elementPot3.classList.remove("card-pot-active");
  });

  elementPot2.addEventListener("click", (event) => {
    elementPot1.classList.remove("card-pot-active");
    elementPot2.classList.add("card-pot-active");
    elementPot3.classList.remove("card-pot-active");
  });

  elementPot3.addEventListener("click", (event) => {
    elementPot1.classList.remove("card-pot-active");
    elementPot2.classList.remove("card-pot-active");
    elementPot3.classList.add("card-pot-active");
  });

};

const changeImg = () => {
  console.log("toto")
  // const elementImg = document.getElementById("card-main-image");
  // const elementSizeS = document.getElementById("sizeS");
  // elementSizeS.addEventListener("click", (event) => {
  //   elementImg.style.backgroundImage = 'url(/images/composition/planteS.jpg)';
  // });
};


export { changeSML, changePot, changeImg };