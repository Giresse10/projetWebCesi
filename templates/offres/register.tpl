{extends file="../base.tpl"} 
{block name="title"}
creation d'offre de stage
{/block}
{block name="content"}
{if $f}
    <div class="rounded border border-info rounded shadow mx-auto p-4">
        {$f}
    </div>
{/if}
{/block}