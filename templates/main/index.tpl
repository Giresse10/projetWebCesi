{if isset($smarty.session.user)}

    {include file="main/main.tpl"}

{else}
    {include file="main/login.tpl"}
{/if}