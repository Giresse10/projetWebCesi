{extends file='../base.tpl'}
{block name="title"}annonce{/block}
    {block name="content"}
    <p> annonce <p>
    <article>
        <span style="color:red">{$annonce->titre}</span>
    </article>
{/block}