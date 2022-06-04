$(window).on("load", function(event) {
    $("#loader-start").fadeOut("slow");
  });

$(
    ()=>{
        $('.dropdown').hover(function(){ 
            $('.dropdown-toggle', this).trigger('click'); 
          });
    }
)