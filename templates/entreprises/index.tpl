{extends file="../base.tpl"} 
{block name="title"}
offre
{/block}
{block name="content"}
hello offreds
{foreach $lstEnt as $e}
    {var_dump($e)}
{/foreach}
{/block}