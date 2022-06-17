{if isset($smarty.session.user)}
{extends file="../base.tpl"}
{block name="title"}
    offre
{/block}
{block name="content"}
    <h3 class="text-center text-muted">Liste des entreprises</h3>
    <div class="row row-cols-1 row-cols-lg-5 mt-2 justify-content-center p-2">
        {foreach $lstEnt as $e}
            <div class="col m-1 p-2 border shadow entreprise-items" role="button" id="entreprise-item-{$e->id}">
                {********** titre de l'offre *******}
                <div class="d-flex justify-content-between">
                    <h3>{$e->nom}</h3>
                    {if true}
                        <div>
                            <div class="dropdown">
                                <a href="#" role="button" id="dropdownMenuEditor" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa-solid fa-ellipsis-vertical"></i>
                                </a>

                                <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="dropdownMenuEditor">
                                    <li><a class="dropdown-item" href="entreprises/edit/{$e->id}" style="text-decoration: none!important"><i
                                                class="fa-solid fa-pen-to-square"></i> Modifier</a></li>
                                    <li>
                                        <button class="dropdown-item" data-bs-toggle="modal"
                                            data-bs-target="#deleteModal{$e->id}"><i class="fa-solid fa-trash"></i>
                                            Supprimer</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    {/if}
                </div>
                <div onclick="javascript:window.location.href='/entreprises/lire/{$e->id}'">
                {if !empty($e->moyenne)}
                    <span>{$e->moyenne->mean|string_format:"%.3f"}</span>
                    <span class="note text-secondary">
                        {for $i=1 to $e->moyenne->rd}
                        <i class="fa-solid  fa-star text-dark" style="margin-right:-5px;"></i>
                        {/for}{for $i=$e->moyenne->rd+1 to 5}
                        <i class="fa-solid  fa-star" style="margin-right:-5px;"></i>
                        {/for}
                    </span>
                    <span>({$e->moyenne->nb})</span>
                    {else}
                    <span class="text-danger">"Aucun avis!"</span>
                    {/if}
                    <hr class="border-primary" />
                    <p class="m-0">
                        <span class="text-primary">Secteur d'activites: </span><span class="text-muted">{$e->secteur}</span>
            </p>
            <p class="m-0">
                <span class="text-primary">Nombre d'établissement(s) : </span><span
                            class="text-muted">{$e->nb_etablissements}</span>
                    </p>
                    <p class="m-0">
                        <span class="text-primary">Nombre de stagiaire(s) : </span><span
                            class="text-muted">{$e->nbStagiaires}</span>
                    </p>
                </div>
            </div>
            {** modal suppression ***}
            <div class="modal fade" id="deleteModal{$e->id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="text-center p-2 text-muted">
                                Voulez-vous supprimer l'entreprise
                                <span class="badge bg-info">{$e->nom}</span>
                                <div class="alert text-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                                        class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img"
                                        aria-label="Warning:">
                                        <path
                                            d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                                    </svg>
                                    Toutes les offres proposés par cette Entreprise seront egalement supprimées
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                {********** formulaire de suppression *****}
                                <form method="post" action="/entreprises/delete" class="DeleteFormEntreprise" id="delete-{$e->id}">
                                    <input type="hidden" name="entreprise" value="{$e->id}" />
                                    <button class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">Confirmer</button>
                                </form>
                                <button class="btn btn-danger" data-bs-dismiss="modal" aria-label="Close">Annuler</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/foreach}
    </div>
{/block}
{else}
    {block name="content"}
        <div class="mx-auto my-3 text-center">
            <h3 class="text-muted">Ooops veillez vous connecter</h3>
            <a href="/">page de connexion</a>
        </div>
    {/block}
    {/if}