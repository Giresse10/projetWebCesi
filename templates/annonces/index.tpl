{extends file="../base.tpl"} 
{block name="title"}
annonces
{/block}

{block name="content"}
    <p>aziz - Annonces</p>
    {foreach $annonces as $annonce}
        <article>
            <a href="/annonce/lire/{$annonce->id}">{$annonce->titre}</a>
            <p>
                {$annonce->description}
            </p>
        </article>
    {/foreach}
{/block}