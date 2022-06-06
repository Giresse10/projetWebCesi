{extends file="../base.tpl"} 
{block name="title"}
offre
{/block}
{block name="content"}
<div class="mt-2">
{foreach $offres as $f}
<div class="rounded shadow-sm p-3 my-1 border offre-item" style="max-width:500px;" role="button">
    {********** titre de l'offre *******}
    <div class="d-flex justify-content-between">
        <h3>{$f->titre}</h3>
        {if false}
            <form method="post" action="/favoris/register">
            <input type="hidden" name="user" value="{$smarty.session.user.id}">
            <input type="hidden" name="offre" value="{$f->id}" />
            <input type="hidden" name="event" value="unlike" />
            <button class="btn border-0"><i class="fa-solid fa-heart"></i></button>
            </form>
        {else}
            <form method="post" action="/favoris/register">
            <input type="hidden" name="user" value="{$smarty.session.user.id}">
            <input type="hidden" name="offre" value="{$f->id}" />
            <input type="hidden" name="event" value="like" />
            <button class="btn border-0"><i class="fa-regular fa-heart"></i></button>
            </form>
        {/if}
    </div>
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
        <span class="text-muted">{$f->date|date_format:"%D"}</span>
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
        <span class="text-muted">{$f->createdAt|date_format:"%D"}</span>
        </div>
    </div>
</div>
{/foreach}
</div>
{var_dump($offres)}
{var_dump($smarty.session.user)}
{/block}