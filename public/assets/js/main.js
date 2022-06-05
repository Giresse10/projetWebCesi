$(window).on("load", function(event) {
    $("#loader-start").fadeOut("slow");
  });

$(
    ()=>{
        $('#createEntrepriseForm').hide();
        $('#createOffreForm').hide();
        //afficher masquer formulaire de creation
        $('#btnCreateUser').click(()=>{
          $('#btnCreateUser').addClass('disabled border text-center').fadeIn('slow');
          $('#btnCreateOffre').removeClass('disabled border text-center');
          $('#btnCreateEntreprise').removeClass('disabled border text-center');
          $('#createUserForm').show('slow');
          $('#createEntrepriseForm').hide();
          $('#createOffreForm').hide();
        })
        $('#btnCreateEntreprise').click(()=>{
          $('#btnCreateEntreprise').addClass('disabled border text-center').fadeIn('slow');
          $('#btnCreateUser').removeClass('disabled border text-center');
          $('#btnCreateOffre').removeClass('disabled border text-center');
          $('#createUserForm').hide();
          $('#createEntrepriseForm').show('slow');
          $('#createOffreForm').hide();
        })
        $('#btnCreateOffre').click(()=>{
          $('#btnCreateOffre').addClass('disabled border text-center').fadeIn('slow');
          $('#btnCreateUser').removeClass('disabled border text-center');
          $('#btnCreateEntreprise').removeClass('disabled border text-center');
          $('#createUserForm').hide();
          $('#createEntrepriseForm').hide();
          $('#createOffreForm').show('slow');
        })
        //________________________________________
    }
)