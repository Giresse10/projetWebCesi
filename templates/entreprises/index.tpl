{extends file="../base.tpl"}
{block name="title"}
    offre
{/block}
{block name="content"}
    <h3 class="text-center text-muted">Liste des entreprises</h3>
    <div class="row row-cols-1 row-cols-lg-5 mt-2 justify-content-center">
        {foreach $lstEnt as $e}
            <div class="col m-2 p-2 border shadow entreprise-items" role="button" id="entreprise-item-{$e->id}">
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
                    <span class="note text-secondary">
                        <i class="fa-solid  fa-star text-dark" style="margin-right:-5px;"></i>
                        <i class="fa-solid  fa-star text-dark" style="margin-right:-5px;"></i>
                        <i class="fa-solid  fa-star text-dark" style="margin-right:-5px;"></i>
                        <i class="fa-solid  fa-star" style="margin-right:-5px;"></i>
                        <i class="fa-solid  fa-star" style="margin-right:-5px;"></i>
                    </span>
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
                                <span class="badge bg-secondary">{$e->nom}</span>
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