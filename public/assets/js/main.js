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
        });
        //________________________________________
        
        //______________WhishList/Ajax_____________________
        $(".likedForm").submit(function(e){
          e.preventDefault(); //empêcher une action par défaut
          var form_url = $(this).attr("action"); //récupérer l'URL du formulaire
          var form_method = $(this).attr("method"); //récupérer la méthode GET/POST du formulaire
          form_data={};
          $(this).find('[name]').each(function(index, value) {
          var that=$(this),
          name=that.attr('name'),
          value=that.val();
          form_data[name]=value;
          });
          var id = $(this).attr("id");
          $.ajax({
            url : form_url,
            type: form_method,
            data: form_data,

          }).done(function(response){ 
            $(`#${id} .followStatus`).children().toggleClass('fa-solid fa-regular border-3').fadeIn('slow');
          });
        });
        //___________Wishlist/for dismiss________
        $(".likedWishForm").submit(function(e){
          e.preventDefault(); //empêcher une action par défaut
          var form_url = $(this).attr("action"); //récupérer l'URL du formulaire
          var form_method = $(this).attr("method"); //récupérer la méthode GET/POST du formulaire
          form_data={};
          $(this).find('[name]').each(function(index, value) {
          var that=$(this),
          name=that.attr('name'),
          value=that.val();
          form_data[name]=value;
          });
          var id = $(this).attr("id");
          $.ajax({
            url : form_url,
            type: form_method,
            data: form_data,

          }).done(function(response){ 
            $(`#${id}-field`).hide('slow');
          });
        });
        //___________ offresDeStage/ delete ________
        $(".deleteFormOffre").submit(function(e){
          e.preventDefault(); //empêcher une action par défaut
          var form_url = $(this).attr("action"); //récupérer l'URL du formulaire
          var form_method = $(this).attr("method"); //récupérer la méthode GET/POST du formulaire
          form_data={};
          $(this).find('[name]').each(function(index, value) {
          var that=$(this),
          name=that.attr('name'),
          value=that.val();
          form_data[name]=value;
          });
          var id = $(this).attr("id").replace( /^\D+/g, '');
          $.ajax({
            url : form_url,
            type: form_method,
            data: form_data,

          }).done(function(response){ 
           $(`#offre-item-${id}`).hide('slow');
          });
        });
        //___________ entreprise/ delete ________
        $(".DeleteFormEntreprise").submit(function(e){
          e.preventDefault(); //empêcher une action par défaut
          var form_url = $(this).attr("action"); //récupérer l'URL du formulaire
          var form_method = $(this).attr("method"); //récupérer la méthode GET/POST du formulaire
          form_data={};
          $(this).find('[name]').each(function(index, value) {
          var that=$(this),
          name=that.attr('name'),
          value=that.val();
          form_data[name]=value;
          });
          var id = $(this).attr("id").replace( /^\D+/g, '');
          $.ajax({
            url : form_url,
            type: form_method,
            data: form_data,

          }).done(function(response){ 
           $(`#entreprise-item-${id}`).remove();
          });
        });
        //___________ entreprise/ delete ________
        $(".DeleteLoc").submit(function(e){
          e.preventDefault(); //empêcher une action par défaut
          var form_url = $(this).attr("action"); //récupérer l'URL du formulaire
          var form_method = $(this).attr("method"); //récupérer la méthode GET/POST du formulaire
          var id = $(this).find("input[name=localite]").val();
          $.ajax({
            url : form_url,
            type: form_method,

          }).done(function(response){
           $(`#loc-item-${id}`).fadeOut('slow');
          });
        });
    }
)