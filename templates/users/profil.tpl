{extends file="../base.tpl"} 

{block name="title"}
Profil
{/block}

{block name="content"}
<div class="rounder border p-2 mt-5 w-75 mx-auto">
    <div class="d-flex justify-content-between">
        {**************************************************}
        <div class="rounded-circle">
            <i class="fa fa-user fa-5x"></i>
        </div>
        {**************************************************}
        <ul class="nav flex-column">
        {***************** whish listes *****************}
            <li class="nav-item"><a href="" class="nav-link">Mes candidatures</a></li>
            <li class="nav-item"><a href="" class="nav-link">Mes favoris</a></li>
            <li class="nav-item"><a href="" class="nav-link">Mes avis</a></li>
        </ul>
        {**************************************************}
    </div>
    {******************* Information ***********************}
    <hr class="border-primary border-3 opacity-75">
    <div>
        nom : {$user->nom}
        prenom : {$user->prenom}
        email : {$user->email}
        email externe : {$user->emailPerso}
        pseudo : {$user->pseudo}
        formation : CPI A2 INFORMATIQUE
        cv
    </div>
</div>
{var_dump($user)}
{/block}