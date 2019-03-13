const plus = () => {
  const bouton = document.getElementById("voirplus")
  const wrapper = document.getElementById("resultSearch")
  const maxclick = wrapper.dataset.maxClick
  let clic = 0
  const xht = wrapper.style.height
  bouton.addEventListener("click", (event) => {
    const x = document.getElementById("resultSearch").style.height
    console.log(x)
    const newht = (parseInt(xht.replace(/vw/,""))+parseInt(x.replace(/vw/,""))-3)+"vw"
    console.log(newht)
    if (maxclick > clic) {
      document.getElementById("resultSearch").style.height = newht ;
      clic = clic + 1 ;
    };
  });

};

export {plus};