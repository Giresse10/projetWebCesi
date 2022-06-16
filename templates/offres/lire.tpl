{extends file="../base.tpl"} 
{block name="title"}
{$offre->titre}
{/block}
{block name="content"}
{if $offre}
    <div class="rounded shadow-sm p-3 my-3 border mx-auto" style="max-width:800px;" id="offre-item-{$offre->id}">
    {********** titre de l'offre *******}
    <div style="background-color: rgba(81, 80, 80, 0.086);margin:-12px -12px 1px -12px;" class="border-bottom p-3 rounded-top">
    <div class="d-flex justify-content-between">
        <h3>{$offre->titre}</h3>
        {************ button postuler *************************}
        {****************** apply *****************************}
        {if $offre->is_apply}
            <span class="text-success"><i class="fa-solid fa-check-double"></i></span>
        {else}
            <a role="button" href="/offres-de-stage/apply/{$offre->id}" class="btn btn-primary">Postuler</a>
        {/if}
        {if true}
            <div>
                <div class="dropdown">
                    <a href="#" role="button" id="dropdownMenuEditor" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-ellipsis-vertical"></i>
                    </a>

                    <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="dropdownMenuEditor">
                        <li><a class="dropdown-item" href="/offres-de-stage/edit/{$offre->id}"><i
                                    class="fa-solid fa-pen-to-square"></i> Modifier</a></li>
                        <li>
                            <button class="dropdown-item" data-bs-toggle="modal"
                                data-bs-target="#deleteModal{$offre->id}"><i class="fa-solid fa-trash"></i>
                                Supprimer</button>
                        </li>
                    </ul>
                </div>
            </div>
        {/if}
    </div>
    <div>
        {****  entreprise ***************}
        <div class="entreprise">
            <span class="fw-bold">{$offre->entreprise}</span>
            <span class="note text-secondary">
            {if !empty($moyenne)}
                <span>{$moyenne->mean}</span>
                <span class="note text-secondary">
                    {for $i=1 to $moyenne->rd}
                    <i class="fa-solid  fa-star text-dark" style="margin-right:-5px;"></i>
                    {/for}{for $i=$moyenne->rd+1 to 5}
                    <i class="fa-solid  fa-star" style="margin-right:-5px;"></i>
                    {/for}
                </span>
                <span>({$moyenne->nb})</span>
                {else}
                <span class="text-info">"Aucun avis!"</span>
                {/if}
            </span>
        </div>
        {************** Locatité ***************************}
        <div class="localite">
            <span>{$offre->localite}</span>
            <span>({$offre->cp})</span>
        </div>
    </div>
        
    </div>
    {************** datescription ****************}
    <div>
        <h3>Description du poste</h3>
        <div>{$offre->description}</div>
    </div>
    {************Detail du poste ***************************}
    <div class="mt-2">
        <span class="fw-bold fs-5">Detail du poste</span>
        {************** date de prise de poste ****************}
        <div class="d-flex flex-column">
            <div>
                <span class="text-dark fw-bolder">Competence(s) :</span>
                <div class="text-muted">
                    {if !empty($offre->competences)}
                    {foreach $offre->competences as $o}
                    <span class="badge bg-info">{$o->nom} </span>
                    {/foreach}
                    {else}
                    <span class="badge text-danger">non renseigné</span>
                    {/if}
                </div>
            </div>
            <div>
                <span class="text-dark fw-bolder">Date de prise du poste :</span>
                <span class="text-muted">{$offre->date|date_format:"%d/%m/%Y"}</span>
            </div>
            <div>
                <span class="text-dark fw-bolder">Durée du stage:</span>
                <span class="text-muted">{$offre->duree} mois</span>
            </div>
            <div>
                <span class="text-dark fw-bolder">Base de Rémuneration:</span>
                <span class="text-muted">{$offre->baseDeRemuneration} &euro;/h</span>
            </div>
        </div>
        {************** date de publication ****************}
        <div class="d-flex justify-content-between">
            <div class="fs-6">
                <span class="text-primary">Date de publication du poste :</span>
                <span class="text-muted">{$offre->createdAt|date_format:"%d/%m/%Y"}</span>
            </div>
        </div>
    </div>
</div>
{*var_dump($offre)*}
{else}
    <h2 class="text-muted mt-5 text-center">Oops! item not found</h2>
    <a class="nav-link text-center" href="/offres-de-stage">Go back to items page </a>
{/if}
{/block}