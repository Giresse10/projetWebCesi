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
                        <a role="button" class="nav-link text-center disabled border border-primary">
                            <i class="fa-solid fa-user me-2"></i>Utilisateur
                        </a>
                    </li>
                    <li class="nav-item">
                        <a role="button" class="nav-link">
                            <i class="fa-solid fa-building me-2"></i>Entreprise
                        </a>
                    </li>
                    <li class="nav-item">
                        <a role="button" class="nav-link">
                            <i class="fa-solid fa-briefcase me-2"></i>Offre de stage
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-md-12 col-lg-10 border rounded shadow">
                {********** formulaire creation utilisateur ***************}
                <div class="p-3">
                    <form action="/users/register" method="post">
                        {********** choix status *****************}
                        {*** nom/prenom ****}
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="usersNom" class="form-label">Nom</label>
                                <input type="text" class="form-control" id="usersNom" name="user_nom">
                            </div>
                            <div class="col-md-6">
                                <label for="usersPrenom" class="form-label">Prenom</label>
                                <input type="text" class="form-control" id="usersPrenom" name="user_prenom">
                            </div>
                            <div class="col-12">
                                <label for="usersEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" id="usersEmail" placeholder="adresse email personnelle" name="user_email">
                            </div>
                            <div class="col-12">
                                <label for="usersCentre" class="form-label">Centre</label>
                                <select class="form-select" aria-label="Default select example" id="usersCentre" name="user_centre">
                                    <option selected>Statut</option>
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
                    {***********************************}
                </div>
            </div>
        </div>
    </div>
{/block}