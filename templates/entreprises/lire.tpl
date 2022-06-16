{extends file="../base.tpl"}
{block name="title"}
    avis sur les entreprises
{/block}

{block name="content"}
    <div class="col m-3 p-3 rounded border bg-light" id="entreprise-item-{$entreprise->id}">
    <div class="d-flex justify-content-between">
    {********** titre de l'offre *******}
            <div>
                <h3>{$entreprise->nom}</h3>
                <p class="m-0">
                <span class="text-primary">Secteur d'activites: </span><span
                class="text-muted">{$entreprise->secteur}</span>
                </p>
                <p class="m-0">
                <span class="text-primary">localité(s):</span> 
                {foreach $localites as $l}
                <span class="text-muted">{$l->nom}, </span>
                {/foreach}
                </p>
                <p class="m-0">
                    <span class="text-primary">Nombre de stagiaire(s) : </span><span
                        class="text-muted">{$entreprise->nbStagiaires}</span>
                </p>
            </div>
            {if true}
                <div>
                    <div class="dropdown">
                        <a href="#" role="button" id="dropdownMenuEditor" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-ellipsis-vertical"></i>
                        </a>

                        <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="dropdownMenuEditor">
                            <li><a class="dropdown-item" href="/entreprises/edit/{$entreprise->id}"
                                    style="text-decoration: none!important"><i class="fa-solid fa-pen-to-square"></i>
                                    Modifier</a></li>
                            <li>
                                <button class="dropdown-item" data-bs-toggle="modal"
                                    data-bs-target="#deleteModal{$entreprise->id}"><i class="fa-solid fa-trash"></i>
                                    Supprimer</button>
                            </li>
                        </ul>
                    </div>

                    
                </div>
            {else}
                ok
            {/if}
            <div class="position-relative" id="evalGroup">
                <input type="button" class="btn btn-warning text-light" value="evaluer" id="btnEvaluer" />
                <div id="evalField" class="d-none p-3 mt-1 shadow rounded position-absolute end-0 bg-light" style="width:200px">
                    <form action="/entreprises/evaluer" id="rateForm" method="post">
                        <p role="button" class="mx-auto text-center my-1" style="color:rgba(100, 100, 100, 0.5);">
                            <i class="fa-solid fa-star me-1 fs-5" id="note-1"></i>
                            <i class="fa-solid fa-star me-1 fs-5" id="note-2"></i>
                            <i class="fa-solid fa-star me-1 fs-5" id="note-3"></i>
                            <i class="fa-solid fa-star me-1 fs-5" id="note-4"></i>
                            <i class="fa-solid fa-star me-1 fs-5" id="note-5"></i>
                        </p>
                        <input type="hidden" name="eval_entreprise" value="{$entreprise->id}"/>
                        <input type="hidden" name="avis_note" id="eval-hide"/>
                        <textarea name="avis_text" class="form-control mb-1"></textarea>
                        <input type="submit" value="envoyer" class="btn btn-primary w-100"/>
                    </form>
                </div>
            </div>
        </div>
        <div>
        {if !empty($moyenne)}
            <span>{$moyenne->mean}</span>
            <span class="note text-secondary">
                {for $i=1 to $moyenne->rd}
                <i class="fa-solid  fa-star text-dark" style="margin-right:-5px;"></i>
                {/for}{for $i=$moyenne->rd+1 to 5}
                <i class="fa-solid  fa-star" style="margin-right:-5px;"></i>
                {/for}
            </span>
            <span>({$moyenne->nb})</span>
            {else}
            <span class="text-info">"Aucun avis!"</span>
            {/if}
    </div>
    <br>
    {***********************tabs ***************************}
    <nav>
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Offres proposée(s)</button>
        <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Avis reçu</button>
    </div>
    </nav>
    <div class="tab-content bg-white" id="nav-tabContent">
    {**********offres ************}
    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
    <div class="row row-cols-lg-2 p-1 g-2 mt-2 justify-content-center">
    {if !empty($offres)}{foreach $offres as $f}
    <div class="rounded shadow-sm p-3 my-1 border offre-items col mx-1" style="max-width:500px"
        role="button" id="offre-item-{$f->id}">
        {********** titre de l'offre *******}
        <div class="d-flex justify-content-between">
            <h3>{$f->titre}</h3>
        </div>
        <div onclick="javascript:window.location.href='/offres-de-stage/lire/{$f->id}'">
            {************** Locatité ***************************}
            <div class="localite">
                <span>{$f->localite}</span>
                <span>({$f->cp})</span>
            </div>
            {************** date de prise de poste ****************}
            <div class="d-flex flex-column">
                <div>
                    <span class="text-dark fw-bolder">A partir du :</span>
                    <span class="text-muted">{$f->date|date_format:"%d/%m/%Y"}</span>
                </div>
                <div>
                    <span class="text-dark fw-bolder">Durée :</span>
                    <span class="text-muted">{$f->duree} mois</span>
                </div>
            </div>
            {************** date de publication ****************}
            <div class="d-flex justify-content-between">
                <div class="fs-6">
                    <span class="text-primary">Publié le :</span>
                    <span class="text-muted">{$f->createdAt|date_format:"%d/%m/%Y"}</span>
                </div>
            </div>
        </div>
    </div>
{/foreach}{/if}
    </div>
    </div>
    {*******************avis ****************}
    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
    
    </div>
    </div>
    {*******************************************************}
</div>
    {var_dump($entreprise)}
    {var_dump($localites)}
    {var_dump($avis)}
    {var_dump($offres)}
{/block}

{block name="script"}
    <script>
        $("#btnEvaluer").click(function() {
            $("#evalField").toggleClass('d-none');
        });
        /*************************Forme d'avis ( star )************************/
        $("#note-1").click(function() {
            $("#note-2, #note-3, #note-4, #note-5").css("color", "rgba(100, 100, 100, 0.5)");
            $("#note-1").css("color", "var(--bs-dark)");
            $("#eval-hide").val(1);
        });
        $("#note-2").click(function() {
            $("#note-3, #note-4, #note-5").css("color", "rgba(100, 100, 100, 0.5)");
            $("#note-1, #note-2").css("color", "var(--bs-dark)");
            $("#eval-hide").val(2);
        });
        $("#note-3").click(function() {
            $("#note-4, #note-5").css("color", "rgba(100, 100, 100, 0.5)");
            $("#note-1, #note-2, #note-3").css("color", "var(--bs-dark)");
            $("#eval-hide").val(3);
        });
        $("#note-4").click(function() {
            $("#note-5").css("color", "rgba(100, 100, 100, 0.5)");
            $("#note-1, #note-2, #note-3, #note-4").css("color", "var(--bs-dark)");
            $("#eval-hide").val(4);
        });
        $("#note-5").click(function() {
            $("#note-1, #note-2, #note-3, #note-4, #note-5").css("color", "var(--bs-dark)");
            $("#eval-hide").val(5);
        });
        /*************************************************/
         //___________ ajax/ rate ________
         $("#rateForm").submit(function(e){
         e.preventDefault(); //empêcher une action par défaut
         var form_url = $(this).attr("action"); //récupérer l'URL du formulaire
         var form_method = $(this).attr("method"); //récupérer la méthode GET/POST du formulaire
         form_data={};
         $(this).find('[name]').each(function(index, value) {
         var that=$(this),
         name=that.attr('name'),
         value=that.val();
         form_data[name]=value;
         });
         $.ajax({
           url : form_url,
           type: form_method,
           data: form_data,

         }).done(function(response){ 
          $("#evalGroup").hide('slow');
         });
       });
    </script>
{/block}