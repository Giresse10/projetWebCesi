{extends file="../base.tpl"} 
{block name="title"}
lire
{/block}
{block name="content"}
hello lire{$smarty.server.HTTP_HOST}
{/block}