const hidden_form = () => {

  const select_form = document.querySelector('.form-control');

  select_form.addEventListener("change", (event) => {
    const plant_form = document.getElementById('form_create_plant');
    const pot_form = document.getElementById('form_create_pot');
    const categ_id = event.currentTarget.value;

    const val = select_form.options[select_form.selectedIndex].innerText;

    if ( val === "plant") {
      plant_form.classList.remove("hidden");
      pot_form.classList.add("hidden");
    } else {
      pot_form.classList.remove("hidden"); 
      plant_form.classList.add("hidden"); 
    }

  });
};

export { hidden_form };