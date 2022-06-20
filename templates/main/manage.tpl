<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <base href="{$smarty.server.HTTP_HOST}">
    <link rel="stylesheet" href="/assets/css/style.css">
    <title>manage</title>
    <style>
    </style>
</head>

<body>

    <main class="container">
        <div class="my-5 position-relative">
            <div class="position-absolute translate-middle">
                <a class="navbar-brand" href="/">
                    <i class="fa-solid fa-house fa-3x"></i>
                </a>
            </div>
            <div class="row g-2">
            <div class="col-2 p-2">
                <ul class="nav nav-flex flex-column border border-2 rounded ps-2" id="m">
                    <li class="nav-item"><a class="nav-link disabled my-0" role="button">utilisateurs</a></li>
                    <li class="nav-item"><a class="nav-link" role="button">candidatures</a></li>
                    <li class="nav-item"><a class="nav-link" role="button">roles</a></li>
                    <li class="nav-item"><a class="nav-link" role="button">localites</a></li>
                    <li class="nav-item"><a class="nav-link" role="button">secteur d'activite</a></li>
                </ul>
            </div>
                {********** el *********}
                <div class="col-10 px-3 border shadow-sm">
                {********** utilisateur *********}
                    <div class="el" id="users">
                        <div class="d-flex justify-content-between m-3">
                        {********* search *************}
                            <div class="border border-primary rounded" style="height:40px">
                                <input type="text" class="form-control" name="q" placeholder="rechercher..." id="btnUserSearch" value=""/>
                            </div>
                        <ul class="nav nav-tabs justify-content-center" id="userTab">
                            <li class="nav-item"><a class="nav-link active" role="button">tous</a>
                            <li class="nav-item"><a class="nav-link" role="button">admin</a>
                            <li class="nav-item"><a class="nav-link" role="button">pilote</a>
                            <li class="nav-item"><a class="nav-link" role="button">delegué</a>
                            <li class="nav-item"><a class="nav-link" role="button">étudiant</a>
                        </ul>
                        </div>
                        <div>
                        <table class="table" id="UsersTable">
                        <thead>
                          <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nom</th>
                            <th scope="col">Prenom</th>
                            <th scope="col">Statut</th>
                            <th scope="col">Classe</th>
                            <th scope="col">centre</th>
                          </tr>
                        </thead>
                        <tbody>
                        {$i = 1}
                        {foreach $users as $u}
                          <tr class="utype-{$u->idStatus} userall" id="entreprise-item-{$u->id}">
                            <th scope="row">{$i++}</th>
                            <td>{$u->nom}</td>
                            <td>{$u->prenom}</td>
                            <td>{$u->status}</td>
                            <td>{$u->niveau}e {$u->filiere}</td>
                            <td class="bg-secondary text-white" style="max-width:10px;text-overflow: ellipsis;">{$u->centre}</td>
                            {************** manage *************************}
                            <td class="text-center">
                            <div class="dropdown">
                            <a href="#" role="button" id="dropdownMenuEditor" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-solid fa-ellipsis-vertical"></i>
                            </a>

                            <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="dropdownMenuEditor">
                                <li><a class="dropdown-item" href="/users/edit/{$u->id}" style="text-decoration: none!important"><i
                                            class="fa-solid fa-pen-to-square"></i> Modifier</a></li>
                                <li>
                                    <button class="dropdown-item" data-bs-toggle="modal"
                                        data-bs-target="#deleteModal{$u->id}"><i class="fa-solid fa-trash"></i>
                                        Supprimer</button>
                                </li>
                            </ul>
                        </div>
                            </td>
                          </tr>
                        {/foreach}
                        </tbody>
                      </table>
                        </div>
                    </div>
                    {************** Candidature ************}
                    <div class="el d-none" id="apply">
                    
                    <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Candidat</th>
                        <th scope="col">Offre</th>
                        <th scope="col">Cv</th>
                        <th scope="col">Lm</th>
                        <th scope="col" class="text-center border-danger"></th>
                      </tr>
                    </thead>
                    <tbody>
                    {$i = 1}
                    {foreach $candidatures as $c}
                      <tr class="utype-{$u->idStatus}">
                        <th scope="row">{$i++}</th>
                        <td>{$c->cprenom} {$c->cnom}</td>
                        <td>{$c->offre}</td>
                        <td><a href="/main/manage#" role="button" id="cvItem{$c->id}">{$c->cvTitre}<a></td>
                        <td>lettre de m</td>
                        <td class="text-center">accepter - refuser</td>
                      </tr>
                    {/foreach}
                    </tbody>
                    </table>
                    </div>
                    {******************************}
                    <div class="el d-none" id="role">
                        <ul>
                        </ul>
                    </div>
                    {************** localites ****************************}
                    <div class="el d-none" id="localite">
                        <form method="post" id="createLoc">
                            <div class="row g-2 p-3">
                                <div class="col-4">
                                    <input type="text" class="form-control" name="loc_nom" placeholder="nom de la localité"/>
                                </div>
                                <div class="col-3">
                                    <input type="text" class="form-control" name="loc_cp" placeholder="code postal"/>
                                </div>
                                <div class="col-3">
                                    <input type="submit" class="btn btn-primary" value="ajouter" name="loc_add"/>
                                </div>
                            </div>
                        </form>
                        <table class="table table-bordered">
                        <thead>
                          <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nom</th>
                            <th scope="col">code postal</th>
                          </tr>
                        </thead>
                        <tbody id="locItem">
                        {$il = 1}
                        {foreach $localites as $l}
                          <tr id="loc-item-{$l->id}">
                            <th scope="row">{$il++}</th>
                            <td>{$l->nom}</td>
                            <td>{$l->cp}</td>
                            <td style="width: 60px;">
                            <form action="/main/deloc/{$l->id}" class="DeleteLoc" method="post">
                                <input type="hidden" name="localite" value="{$l->id}"/>
                                <button style="width:50px;border:none;outline:none;color:red;background:transparent;"><i class="fa-solid fa-trash-can"></i></button>
                            </form>
                            </td>
                          </tr>
                          {$idloc = $l->id}
                        {/foreach}
                        </tbody>
                      </table>
                    </div>
                    {***********************************************}
                    {*********Secteur d'activite******************}
                    <div class="el d-none" id="secteur">
                    <form method="post" class="createSectManage">
                    <div class="row g-2 p-3">
                        <div class="col-6">
                            <input type="text" class="form-control" name="sec_nom" placeholder="nom de l'activité"/>
                        </div>
                        <div class="col-3">
                            <input type="submit" class="btn btn-primary" value="ajouter" name="sec_add"/>
                        </div>
                    </div>
                    </form>
                <table class="table table-bordered">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nom</th>
                  </tr>
                </thead>
                <tbody id="sectItem">
                {$is = 1}
                {foreach $secteurs as $s}
                  <tr>
                    <th scope="row">{$is++}</th>
                    <td>{$s->nom}</td>
                    <td style="width: 60px;">
                    <form action="/main/delsec/{$s->id}" class="DeleteLoc" method="post">
                        <input type="hidden" name="localite" value="{$s->id}"/>
                        <button style="width:50px;border:none;outline:none;color:red;background:transparent;"><i class="fa-solid fa-trash-can"></i></button>
                    </form>
                    </td>
                  </tr>
                {/foreach}
                </tbody>
              </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
        integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="/assets/js/main.js"></script>
    <script>
        var nbl = {$il++};
        var lstid = {$idloc++};
        var nbs = {$is++};
        function h(btn, el){
            $(btn).click(function(){
                $('.el').addClass('d-none');
                $(el).removeClass('d-none');
                $("#m li a").removeClass('disabled');
                $(btn).addClass('disabled');
            });
        }
        h("#m li:nth-child(1) a","#users");
        h("#m li:nth-child(2) a","#apply");
        h("#m li:nth-child(3) a","#role");
        h("#m li:nth-child(4) a","#localite");
        h("#m li:nth-child(5) a","#secteur");

        function uhide(btn, el){
            $(btn).click(function(){
                var rows = $('table.someclass tr');
                $('.userall').hide();
                $(el).show();
                $('#userTab li a').removeClass('active');
                $(btn).addClass('active');
            });
        }
        uhide("#userTab li:nth-child(1) a", ".userall");
        uhide("#userTab li:nth-child(2) a", ".utype-1");
        uhide("#userTab li:nth-child(3) a", ".utype-2");
        uhide("#userTab li:nth-child(4) a", ".utype-3");
        uhide("#userTab li:nth-child(5) a", ".utype-4");

        /******************ajax ****************************/
         //___________ localite/ add ________
         $("#localite #createLoc").submit(function(e){
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
         $.ajax({
           url : form_url,
           type: form_method,
           data: form_data,

         }).done(function(response){ 
          $("#locItem").append(`<tr id="loc-item-{'${++lstid}'}">
                <th scope="row">{'${nbl++}'}</th>
                <td>{'${form_data[\'loc_nom\']}'}</td>
                <td>{'${form_data[\'loc_cp\']}'}</td>
                <td>
                <button style="width:50px;border:none;outline:none;color:red;background:transparent;"
                onClick="$(\'#loc-item-{'${lstid}'}\').fadeOut(\'slow\');"><i class="fa-solid fa-trash-can"></i></button>
                </td>
            </tr>`
            );
         });
       });
        //___________ secteur/ add ________
         $("#secteur .createSectManage").submit(function(e){
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
         $.ajax({
           url : form_url,
           type: form_method,
           data: form_data,

         }).done(function(response){ 
          $(`#sectItem`).append(`
            <tr>
                <th scope="row">{'${nbs++}'}</th>
                <td>{'${form_data[\'sec_nom\']}'}</td>
                <td>supprimer</td>
            </tr>
          `);
         });
       });
       function cvopen(c, i){
            $(c).click(function(){
            window.open(`/main/cv/{'${i}'}`, 'cv','menubar:no,location:no,width:500,height:300');
            })
       }
       /************* danger ************/
       {foreach $candidatures as $c}
            cvopen("#cvItem{$c->id}",{$c->id});
        {/foreach}
    </script>
    {foreach $users as $u}
    {** modal suppression ***}
            <div class="modal fade" id="deleteModal{$u->id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="text-center p-2 text-muted">
                                Voulez-vous supprimer l'utilisateur
                                <span class="badge bg-info">{$u->prenom}</span>
                                <div class="alert text-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                                        class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img"
                                        aria-label="Warning:">
                                        <path
                                            d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                                    </svg>
                                    Toutes les données de l'utilisateur seront supprimer
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                {********** formulaire de suppression *****}
                                <form method="post" action="/users/delete" class="DeleteFormEntreprise" id="delete-{$u->id}">
                                    <input type="hidden" name="user" value="{$u->id}" />
                                    <button class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">Confirmer</button>
                                </form>
                                <button class="btn btn-danger" data-bs-dismiss="modal" aria-label="Close">Annuler</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/foreach}
</body>

</html>