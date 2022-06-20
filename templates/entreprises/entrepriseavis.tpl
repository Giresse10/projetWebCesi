{if isset($smarty.session.user)}
{extends file="../base.tpl"}
{block name="title"}
    avis sur les entreprises
{/block}

{block name="content"}
    <h3 class="text-center text-muted">Avis sur les entreprises</h3>
    <div class="row row-cols-1 row-cols-lg-5 mt-2 justify-content-center p-2">
        {foreach $avis as $a}
            <div class="col m-1 border shadow entreprise-items rounded p-0" id="entreprise-item-{$a->id}">
                <div class="mx-auto text-center">
                {********** nom *******}
                <span class="fs-6">{$a->user}</span>
                <span class="mx-1"><i class="fa-solid fa-greater-than"></i></span>
                <span class="fw-bold">{$a->entreprise}</span>
                </div>
                <p class="note text-secondary text-center">
                        {for $i=1 to $a->note}
                        <i class="fa-solid  fa-star text-dark" style="margin-right:-5px;"></i>
                        {/for}{for $i=$a->note+1 to 5}
                        <i class="fa-solid  fa-star" style="margin-right:-5px;"></i>
                        {/for}
                </p>
                {if isset($a->commentaire)&&$a->commentaire!=''}
                <div class="note border  text-white bg-secondary m-0 rounded text-center w-100">
                        {$a->commentaire}
                </div>
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