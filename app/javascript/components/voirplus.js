const plus = () => {
  const bouton = document.getElementById("voirplus")
  bouton.addEventListener("click", (event) => {
    const div = document.getElementById("resultSearch")
    div.insertAdjacentHTML('afterend',div.innerHTML)
  });

};

export {plus};