{extends file="../base.tpl"} 
{block name="title"}
creation de {$nom}
{/block}
{block name="content"}
<div class=" p-2 mt-3">
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
<symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
</symbol>
<symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
</symbol>
<symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
  <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</symbol>
</svg>
{if $type eq "entreprise"}
    {if $status}
    <div class="alert alert-success text-center mx-auto" style="max-width:500px;">
     <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
        Creation de l'entreprise 
        <span class="badge bg-primary">{$nom}</span>
        effectué avec succès
    </div>
    {else}
    <div class="alert alert-danger text-center mx-auto" style="max-width:800px;">
    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
        Il semble que l'entreprise
        <span class="badge bg-primary">{$nom}</span>
        existe déjà
        </div>
    {/if}
    <ul class="nav nav-flex flex-column mx-auto">
        <li class="nav-item text-center"><a href="/create" class="nav-link">Retour au menu de creation</a></li>
        <li class="nav-item text-center"><a href="/entreprises" class="nav-link">Liste des entreprise</a></li>
        <li class="nav-item text-center"><a href="/" class="nav-link">Page d'accueil</a></li>
    </ul>
{/if}
{if $type eq "offre"}
    {if $status}
    <div class="card mx-auto shadow" style="max-width:500px;">
        <div class="card-header p-0">
            <div class="alert alert-success m-0">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                Succès
            </div>
        </div>
        <div class="card-body">
             <div class="text-success">L'offre de stage à été enregistrer avec succès</div>
            <div class="border-bottom text-white bg-dark text-center mt-2 mb-1 border-success">Titre </div>
            <span class="text-center">{$titre}</span>
            <div class="border-bottom text-white bg-dark text-center mt-2 mb-1 border-success">Description </div>
            <div class="text-muted">{$description}</div>
        </div>
    </div>
    {else}
        <div class="card mx-auto shadow" style="max-width:500px;">
        <div class="card-header p-0">
            <div class="alert alert-danger m-0">
    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                Erreur de creation
            </div>
        </div>
        <div class="card-body">
             <div class="text-danger">Il semble qu'une offre de stage existe déjà avec les même données </div>
            <div class="border-bottom text-white bg-dark text-center mt-2 mb-1 border-success">Titre </div>
            <span class="text-center">{$titre}</span>
            <div class="border-bottom text-white bg-dark text-center mt-2 mb-1 border-success">Description </div>
            <div class="text-muted">{$description}</div>
        </div>
    </div>
    {/if}
    <ul class="nav nav-flex flex-column mx-auto">
        <li class="nav-item text-center"><a href="/create" class="nav-link">Retour au menu de creation</a></li>
        <li class="nav-item text-center"><a href="/offres-de-stage" class="nav-link">Liste des offres de stage</a></li>
        <li class="nav-item text-center"><a href="/" class="nav-link">Page d'accueil</a></li>
    </ul>
{/if}
{********************************}
{if $type eq "user"}
    {if $status}
    <div class="card mx-auto shadow" style="max-width:500px;">
        <div class="card-header p-0">
            <div class="alert alert-success m-0">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                Succès
            </div>
        </div>
        <div class="card-body">
             <div class="text-success">Nouvel utilisateur enregistré avec succès</div>
            <div class="border-bottom text-white bg-secondary text-center mt-2 mb-1 border-success">Information de l'utilisateur </div>
            <div class="text-primary">status : <span class="text-muted">{$statut->nom}</span></div>
            <div class="text-primary">Prénom : <span class="text-muted">{$prenom}</span></div>
            <div class="text-primary">Nom : <span class="text-muted">{$nom}</span></div>
            <div class="border p-2 bg-dark">
            <div class="text-primary">Identifiant : <span class="text-white user-select-all">{$email}</span></div>
            <div class="text-primary">Mot de passe : <span class="text-white user-select-all">{$password}</span></div>
            </div>
        </div>
    </div>
    {else}
        <div class="card mx-auto shadow" style="max-width:500px;">
        <div class="card-header p-0">
            <div class="alert alert-danger m-0">
    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                Erreur de creation
            </div>
        </div>
        <div class="card-body">
        <div class="border-bottom text-white bg-dark text-center mt-2 mb-1 border-success">Information de l'utilisateur </div>
        <div class="text-primary">status : <span class="text-muted">{$statut->nom}</span></div>
        <div class="text-primary">Prenom : <span class="text-muted">{$prenom}</span></div>
        <div class="text-primary">Nom : <span class="text-muted">{$nom}</span></div>
        </div>
    </div>
    {/if}
    <ul class="nav nav-flex flex-column mx-auto">
        <li class="nav-item text-center"><a href="/create" class="nav-link">Retour au menu de creation</a></li>
        <li class="nav-item text-center"><a href="/users" class="nav-link">Liste des utilisateurs</a></li>
        <li class="nav-item text-center"><a href="/" class="nav-link">Page d'accueil</a></li>
    </ul>
{/if}
{********************************}
</div>
{/block}