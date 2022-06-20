{if isset($smarty.session.user)}
{extends file="../base.tpl"} 
{block name="title"}
wishlist
{/block}
{block name="content"}
    <h3 class=" mt-3 text-muted text-center">Mes Candidatures </h3>
    <div class="mt-3 row row-cols-lg-3 row-cols-1 px-2">
    {foreach $offres as $f}
        {if $f->is_apply}
    <div class="rounded shadow-sm p-3 my-1 border offre-items col mx-2" style="max-width:500px;background-color: rgba(100, 100, 255, 0.1)" role="button" id="unLiked-{$f->id}-field">
        {********** titre de l'offre *******}
        <div class="d-flex justify-content-between">
            <h3>{$f->titre}</h3>
            {********** apply *****************************}
            <span class="text-success"><i class="fa-solid fa-check-double"></i></span>     
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
                <span class="text-primary">Envoyé le :</span>
                <span class="text-muted">{$f->createdAt|date_format:"%d/%m/%Y"}</span>
                </div>
            </div>
        </div>
    </div>
    {/if}
    {/foreach}
</div>
<ul class="nav nav-flex flex-column mx-auto">
    <li class="nav-item text-center"><a href="/offres-de-stage" class="nav-link">Liste des Offres de stage</a></li>
    <li class="nav-item text-center"><a href="/entreprises" class="nav-link">Mes Candidatures</a></li>
    <li class="nav-item text-center"><a href="users/profil" class="nav-link">Mon profil</a></li>
</ul>
{/block}
{else}
    {block name="content"}
        <div class="mx-auto my-3 text-center">
            <h3 class="text-muted">Ooops veillez vous connecter</h3>
            <a href="/">page de connexion</a>
        </div>
{/block}
{/if}