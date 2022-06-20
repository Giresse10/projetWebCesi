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

        function userSearch() {
            // Declare variables
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("btnUserSearch");
            filter = input.value.toUpperCase();
            table = document.getElementById("UsersTable");
            tr = table.getElementsByTagName("tr");
          
            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
              td = tr[i].getElementsByTagName("td")[1];
              if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                  tr[i].style.display = "";
                } else {
                  tr[i].style.display = "none";
                }
              }
            }
          }

          $('#btnUserSearch').keyup(function(e) {
            userSearch();
          })
    }
)