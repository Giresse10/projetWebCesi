{extends file="../base.tpl"}
{block name="style"}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q==" crossorigin="anonymous"
  referrerpolicy="no-referrer" />
{/block}
{block name="title"}
    creation
{/block}
{block name="content"}
    <div class="mx-auto m-3">
        <div class="row g-3">
            <div class="col-md-12 col-lg-2">
                <ul class="nav flex-lg-column">
                    <li class="nav-item">
                        <a role="button" class="nav-link text-center disabled border border-primary" id="btnCreateUser">
                            <i class="fa-solid fa-user me-2"></i>Utilisateur
                        </a>
                    </li>
                    <li class="nav-item">
                        <a role="button" class="nav-link border-primary" id="btnCreateEntreprise">
                            <i class="fa-solid fa-building me-2"></i>Entreprise
                        </a>
                    </li>
                    <li class="nav-item">
                        <a role="button" class="nav-link border-primary" id="btnCreateOffre">
                            <i class="fa-solid fa-briefcase me-2"></i>Offre de stage
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-md-12 col-lg-10 border rounded shadow">
                {********** formulaire creation utilisateur ***************}
                <div class="p-3" id="createUserForm">
                    <form action="/users/register" method="post">
                        {********** choix status *****************}
                        {*** nom/prenom ****}
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="usersNom" class="form-label">Nom</label>
                                <input type="text" class="form-control" id="usersNom" name="user_nom">
                            </div>
                            <div class="col-md-6">
                                <label for="usersPrenom" class="form-label">Prénom</label>
                                <input type="text" class="form-control" id="usersPrenom" name="user_prenom">
                            </div>
                            <div class="col-12">
                                <label for="usersEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" id="usersEmail" placeholder="adresse email personnelle" name="user_email">
                            </div>
                            <div class="col-12">
                                <label for="usersCentre" class="form-label">Centre</label>
                                <select class="form-select" aria-label="Default select example" id="usersCentre" name="user_centre">
                                    <option selected>Centre</option>
                                    {foreach $centre as $c}
                                    <option value="{$c->id}">{$c->nom}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="usersStatus" class="form-label">Statut</label>
                                <select class="form-select" aria-label="Default select example" id="usersStatus" name="user_status">
                                    <option selected disabled>Statut de l'utilisateur</option>
                                    {foreach $status as $s}
                                        {if $s->id != 1}
                                        <option value="{$s->id}">{$s->nom}</option>
                                        {/if}
                                    {/foreach}
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="usersNiveau" class="form-label">Niveau</label>
                                <select class="form-select" aria-label="Default select example" id="usersNiveau" name="user_niveau">
                                    <option selected disabled>Niveau</option>
                                    <option value="1">1ère Année</option>
                                    <option value="2">2ème Année</option>
                                    <option value="3">3ème Année</option>
                                    <option value="4">4ème Année</option>
                                    <option value="5">5ème Année</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="usersFiliere" class="form-label">Filière</label>
                                <select class="form-select" aria-label="Default select example" id="usersFiliere" name="user_filiere">
                                <option selected disabled>filière</option>
                                {foreach $filiere as $f}
                                    <option value="{$f->id}">{$f->nom}</option>
                                {/foreach}
                                </select>
                            </div>

                            <div class="col-12 d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary px-5">
                                    <i class="fa-solid fa-right-to-bracket"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                {***********************************}
                {*** formulaire creer entreprise ******}
                <div class="p-3" id="createEntrepriseForm">
                    <form action="/entreprises/register" method="post">
                    <div class="row g-3">
                    <div class="col-12">
                        <label for="entrepriseNom" class="form-label">Nom</label>
                        <input type="text" class="form-control" id="entrepriseNom" name="entreprise_nom">
                    </div>
                    <div class="col-12">
                        <label for="entrepriseSecteur" class="form-label">Secteur d'activité</label>
                        <select class="form-select" aria-label="Default select example" id="entrepriseSecteur" name="entreprise_secteur">
                            <option selected>Secteur d'activité</option>
                            {foreach $secteurs as $s}
                            <option value="{$s->id}">{$s->nom}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col-12">
                        <label for="entrepriseLoc" class="form-label">localité(s) </label>
                        <select class="selectpicker" aria-label="Default select example" id="entrepriseLoc" name="entreprise_localite[]" multiple>
                            <option selected disabled>choix de localité(s)</option>
                            {foreach $localites as $l}
                            <option value="{$l->id}">{$l->nom} - {$l->cp}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col-12 d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary px-5">
                                    <i class="fa-solid fa-right-to-bracket"></i>
                                </button>
                            </div>
                </div>
                    </form>
                </div>
                {*************************************}
                {*** formulaire de creation d'offre de stage***}
                <div class="p-3" id="createOffreForm">
                    <form action="/offres-de-stage/register" method="post">
                        {********** choix status *****************}
                        {*** nom/prenom ****}
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="OffreTitre" class="form-label">Titre</label>
                                <input type="text" class="form-control" id="OffreTitre" name="offre_titre">
                            </div>
                            <div class="col-12">
                                <label for="OffreDescription" class="form-label">Description</label>
                                <textarea type="text" class="form-control" id="OffreDescription" name="offre_description"></textarea>
                            </div>
                            {********** competences **********}
                            <div class="col-12">
                            <div class="ui-widget">
                                <label for="tagsComp">Competences </label>
                                <input id="tagsComp" type="text" class="form-control" name="offre_comp">
                            </div>
                            </div>
                            <div class="col-12">
                                <label for="offreEntreprise" class="form-label">Entreprise</label>
                                <select class="form-select" aria-label="Default select example" id="offreEntreprise" name="offre_entreprise">
                                    <option selected>Entreprises</option>
                                    {foreach $entreprises as $e}
                                    <option value="{$e->id}">{$e->nom}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label for="offreDuree" class="form-label">Durée</label>
                                <input type="number" class="form-control" id="offreDuree" name="offre_duree">
                            </div>
                            <div class="col-md-4">
                                <label for="offreDate" class="form-label">A partir du</label>
                                <input type="date" class="form-control" id="offreDate" name="offre_date">
                            </div>
                            <div class="col-md-2">
                                <label for="offrePlaces" class="form-label">Places</label>
                                <input type="number" class="form-control" id="offreBaseDeRemuneration" name="offre_nbPlaces">
                            </div>
                            <div class="col-md-3">
                                <label for="offreBaseDeRemuneration" class="form-label">Remuneration</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="offreBaseDeRemuneration" name="offre_baseDeRemuneration">
                                    <span class="input-group-text">&euro;/heure</span>
                                </div>
                            </div>

                            <div class="col-12 d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary px-5">
                                    <i class="fa-solid fa-right-to-bracket"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
{/block}

{block name="script"}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
$( function() {
var availableTags = [
{foreach $competences as $c}
 "{$c->nom}",
{/foreach}
    
];
function split( val ) {
  return val.split( /,\s*/ );
}
function extractLast( term ) {
  return split( term ).pop();
}

$( "#tagsComp" )
  // don't navigate away from the field on tab when selecting an item
  .on( "keydown", function( event ) {
    if ( event.keyCode === $.ui.keyCode.TAB &&
        $( this ).autocomplete( "instance" ).menu.active ) {
      event.preventDefault();
    }
  })
  .autocomplete({
    minLength: 0,
    source: function( request, response ) {
      // delegate back to autocomplete, but extract the last term
      response( $.ui.autocomplete.filter(
        availableTags, extractLast( request.term ) ) );
    },
    focus: function() {
      // prevent value inserted on focus
      return false;
    },
    select: function( event, ui ) {
      var terms = split( this.value );
      // remove the current input
      terms.pop();
      // add the selected item
      terms.push( ui.item.value );
      // add placeholder to get the comma-and-space at the end
      terms.push( "" );
      this.value = terms.join( ", " );
      return false;
    }
  });
} );
</script>
{/block}