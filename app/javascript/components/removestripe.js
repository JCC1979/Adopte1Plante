const removestripe = () => {

  $(document).ready(function(){
    $(".stripe-button-el span").remove();
        $("button.stripe-button-el").removeAttr('style').css({
            "display":"inline-block",
            "width":"15%",
            "padding":" 2px 5px",
            "background":"#27B02C",
            "color":"white",
            "border-radius": "0px",
            "font-size":"1.3em" }).html("Payer");
    });
  }

    export { removestripe }; 