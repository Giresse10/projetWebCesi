{extends file="../base.tpl"}
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
                        <select class="form-select" aria-label="Default select example" id="entrepriseLoc" name="entreprise_localite">
                            <option selected>localité(s)</option>
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
                                <label for="usersNom" class="form-label">Titre</label>
                                <input type="text" class="form-control" id="usersNom" name="offre_titre">
                            </div>
                            <div class="col-12">
                                <label for="OffreDescription" class="form-label">Description</label>
                                <textarea type="text" class="form-control" id="OffreDescription" name="offre_description"></textarea>
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