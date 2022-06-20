{extends file="../base.tpl"} 
{block name="title"}
notification
{/block}
{block name="content"}
<div class="rounded shadow border mx-auto w-50 my-2 px-2">
    <p class="text-muted text-center border-bottom mx-1">notifications</p>
    {foreach $apply as $a}{if $a->hasChecked eq 1}
        <div class="alert alert-success text-center">
        <i class="fa-solid fa-square-envelope"></i>
        votre candidature sur l'offre<span class="badge fs-6"> {$a->offre}</span> a été consulté.
        </div>
    {/if}{/foreach}
</div>
{/block}