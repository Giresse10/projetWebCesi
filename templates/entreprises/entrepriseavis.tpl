{if isset($smarty.session.user)}
{extends file="../base.tpl"}
{block name="title"}
    avis sur les entreprises
{/block}

{block name="content"}
    <div class="row row-cols-1 row-cols-lg-5 mt-2 justify-content-center p-2">
        {foreach $avis as $a}
            <div class="col m-1 px-2 border shadow entreprise-items rounded hover" id="entreprise-item-{$a->id}">
                {********** nom *******}
                <span class="fs-6">{$a->user}</span>
                <span class="mx-2"><i class="fa-solid fa-greater-than"></i></span>
                <span class="fw-bold">{$a->entreprise}</span>
                <p class="note text-secondary text-center">
                        {for $i=1 to $a->note}
                        <i class="fa-solid  fa-star text-dark" style="margin-right:-5px;"></i>
                        {/for}{for $i=$a->note+1 to 5}
                        <i class="fa-solid  fa-star" style="margin-right:-5px;"></i>
                        {/for}
                </p>
                {if isset($a->commentaire)&&$a->commentaire!=''}
                <p class="note border text-light text-center">
                        {$a->commentaire}
                </p>
                {/if}

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