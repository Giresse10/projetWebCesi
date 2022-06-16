{extends file="../base.tpl"}
{block name="title"}
    offre
{/block}
{block name="content"}
    <div class="mt-3 row row-cols-lg-3 row-cols-1 justify-content-center p-2">
        {foreach $offres as $f}
            <div class="rounded shadow-sm p-3 my-1 border offre-items col mx-1" style="max-width:500px;{if $f->is_apply}background-color: rgba(100, 100, 255, 0.1){/if}"
                role="button" id="offre-item-{$f->id}">
                {********** titre de l'offre *******}
                <div class="d-flex justify-content-between">
                    <h3>{$f->titre}</h3>
                    {********** whishlist *****************************}
                    {if $f->is_apply}
                    <span class="text-success"><i class="fa-solid fa-check-double"></i></span>
                    {else if $f->is_wishlist}
                        <form method="post" action="/wish-list/like" class="likedForm" id="unLiked-{$f->id}">
                            <input type="hidden" name="user" value="{$smarty.session.user.id}">
                            <input type="hidden" name="offre" value="{$f->id}" />
                            <input type="hidden" name="event" value="unlike" />
                            <button class="btn border-0 followStatus"><i class="fa-solid fa-heart"></i></button>
                        </form>
                    {else}
                        <form method="post" action="/wish-list/like" class="likedForm" id="liked-{$f->id}">
                            <input type="hidden" name="user" value="{$smarty.session.user.id}">
                            <input type="hidden" name="offre" value="{$f->id}" />
                            <input type="hidden" name="event" value="like" />
                            <button class="btn border-0 followStatus"><i class="fa-regular fa-heart"></i></button>
                        </form>
                    {/if}
                    {if true}
                        <div>
                            <div class="dropdown">
                                <a href="#" role="button" id="dropdownMenuEditor" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa-solid fa-ellipsis-vertical"></i>
                                </a>

                                <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="dropdownMenuEditor">
                                    <li><a class="dropdown-item" href="/offres-de-stage/edit/{$f->id}"><i
                                                class="fa-solid fa-pen-to-square"></i> Modifier</a></li>
                                    <li>
                                        <button class="dropdown-item" data-bs-toggle="modal"
                                            data-bs-target="#deleteModal{$f->id}"><i class="fa-solid fa-trash"></i>
                                            Supprimer</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    {/if}
                </div>
                <div onclick="javascript:window.location.href='/offres-de-stage/lire/{$f->id}'">
                    {****  entreprise ***************}
                    <div class="entreprise">
                        <span class="fw-bold">{$f->entreprise}</span>
                        <span class="note text-secondary">
                            <i class="fa-solid  fa-star text-dark" style="margin-right:-5px;"></i>
                            <i class="fa-solid  fa-star text-dark" style="margin-right:-5px;"></i>
                            <i class="fa-solid  fa-star text-dark" style="margin-right:-5px;"></i>
                            <i class="fa-solid  fa-star" style="margin-right:-5px;"></i>
                            <i class="fa-solid  fa-star" style="margin-right:-5px;"></i>
                        </span>
                    </div>
                    {************** Locatité ***************************}
                    <div class="localite">
                        <span>{$f->localite}</span>
                        <span>({$f->cp})</span>
                    </div>
                    {************** date de prise de poste ****************}
                    <div class="d-flex flex-column">
                        <div>
                            <span class="text-dark fw-bolder">A partir du :</span>
                            <span class="text-muted">{$f->date|date_format:"%d/%m/%Y"}</span>
                        </div>
                        <div>
                            <span class="text-dark fw-bolder">Durée :</span>
                            <span class="text-muted">{$f->duree} mois</span>
                        </div>
                    </div>
                    {************** date de publication ****************}
                    <div class="d-flex justify-content-between">
                        <div class="fs-6">
                            <span class="text-primary">Publié le :</span>
                            <span class="text-muted">{$f->createdAt|date_format:"%d/%m/%Y"}</span>
                        </div>
                    </div>
                </div>
            </div>

            {** modal suppression ***}
                        <div class="modal fade" id="deleteModal{$f->id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <div class="text-center p-2 text-muted">
                                            Voulez-vous supprimer l'offre de stage
                                            <span class="badge bg-secondary">{$f->titre}</span>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            {********** formulaire de suppression *****}
                                            <form method="post" action="/offres-de-stage/delete" class="deleteFormOffre"
                                                id="delete-{$f->id}">
                                                <input type="hidden" name="offre" value="{$f->id}" />
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
        {************ Pagination **********************}
        <div class="justify-content-center d-flex mt-auto">
        {if $smarty.get.page*5 <  $nbOffres} 
        <nav aria-label="Page navigation Offre de stagegit" >
            <ul class="pagination">
            <li class="page-item">
                <a class="page-link {if $smarty.get.page eq 0} disabled {/if}" 
                    href="/offres-de-stage/{$smarty.get.page - 1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
                </li>
                {for $nb = 0 to $nbOffres-1 step 5}
                <li class="page-item"><a class="page-link {if $smarty.get.page eq $nb/5} active {/if}" 
                    href="/offres-de-stage/{$nb/5}">{$nb/5+1}</a></li>
                {/for}
                <li class="page-item">
                <a class="page-link {if $smarty.get.page*10 > $nbOffres-1 } disabled {/if}" href="/offres-de-stage/{$smarty.get.page + 1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                </li>
            </ul>
        </nav>
        {else}
        <h2 class="text-muted">Oops! out of range</h2>
        {/if}
        </div>
{/block}