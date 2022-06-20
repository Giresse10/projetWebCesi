
{extends file="../base.tpl"}
{block name="style"}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q==" crossorigin="anonymous"
  referrerpolicy="no-referrer" />
{/block}
{block name="title"}
    modifier l'offre
{/block}
{block name="content"}
    <div class="mx-auto border rounded shadow p-4 mt-3" style="max-width:800px;">
        <form method="post">
            <div class="row g-3">
                {**** nom ***}
                <div class="col-md-12 col-lg-8 position-relative">
                    <button class="btn position-absolute top-0 end-0 btnTogglerposition-relative translate-middle btnToggler1" type="button">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </button>
                    <input type="text" name="nom" class="form-control" value="{$entreprise->nom}" disabled />
                </div>
                {** secteur **}
                <div class="col-12 position-relative">
                <label for="entrepriseSecteur" class="form-label">Secteur d'activité</label>
                <button class="btn position-absolute top-50 end-0 btnToggler2 translate-middle" type="button">
                <i class="fa-solid fa-pen-to-square"></i>
                     </button>
                <select class="form-select" aria-label="Default select example" id="entrepriseSecteur" name="secteur" disabled>
                    {foreach $secteurs as $s}
                    <option value="{$s->id}"
                    {if $s->id eq $entreprise->idSecteur}selected{/if} >{$s->nom}</option>
                    {/foreach}
                </select>
            </div>
                {**** localites ***}
                <div class="col-12 position-relative">
                        <label for="entrepriseLoc" class="form-label">localité(s) </label>
                        <button class="btn position-absolute top-50 end-0 btnToggler4 translate-middle" type="button">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </button>
                        <select class="selectpicker w-100" aria-label="Default select example" id="entrepriseLoc" name="localites" multiple>
                            {foreach $localites as $l}
                            <option value="{$l->id}"
                                {foreach $entreprise->lstLocalites as $lst}
                                    {if $lst->id eq $l->id}
                                        selected
                                    {/if}
                                {/foreach}
                            >{$l->nom} - {$l->cp}</option>
                            {/foreach}
                        </select>
                    </div>
            </div>
            <input class="btn btn-primary my-3" type="submit" value="Enregistrer" name="edit"/>
        </form>
    </div>
{/block}

{block name="script"}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        function edit(sel){
            $(sel).click(()=>{
                event.preventDefault();
                $(`{'${sel}'}+[name]`).prop("disabled", false);
                $(this).next().prop("disabled", false) ;
            });
        }
       edit('.btnToggler1');edit('.btnToggler2')
       edit('.btnToggler4');
</script>
{/block}

