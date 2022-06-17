{if isset($smarty.session.user)}
{extends file="../base.tpl"}
{block name="title"}
    avis sur les entreprises
{/block}

{block name="content"}
    
{/block}
{else}
    {block name="content"}
        <div class="mx-auto my-3 text-center">
            <h3 class="text-muted">Ooops veillez vous connecter</h3>
            <a href="/">page de connexion</a>
        </div>
{/block}
{/if}