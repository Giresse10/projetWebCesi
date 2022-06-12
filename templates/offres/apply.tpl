{extends file="../base.tpl"}
{block name="title"}
    postuler
{/block}
{block name="content"}
    <style>
        #headSearch2{
            display: none;
        }
    </style>
    <div class="mx-auto p-3 rounded border shadow-lg my-4" style="max-width:600px;" id="applyField">
    <h3 class="text-center">Postule à l'offre <span class="badge bg-info">{$offre->titre}</span></h3>
        <form id="applyFormOffre" method="post">
            <input type="hidden" name="postuler_offre" value="{$offre->id}"/>
            {*** CV ***}
            <div class="my-2 border rounded">
                <input type="file" name="postuler_cv" accept="application/pdf" class="form-control" id="postulerCv" required/>
                <embed class="ratio ratio-1x1 d-none" type="application/pdf" id="postulerCvLayout">
            </div><hr>
            {*** lettre de motivation ***}
            <div class="my-2">
                <div class="my-2 lmtoggle rounded border-2 border border-primary">
                    <label for="postulerSans" class="w-100 h-100 p-1 text-center" role="button">
                    Postuler sans lettre de motivation
                    </label>
                    <input type="radio" name="postuler_lm" id="postulerSans" class="d-none" value="1" checked/>
                </div>
                {************ fichier lm **********}
                <div class="my-2">
                <div class="my-2 lmtoggle rounded border-2 border">
                    <label for="postulerFichier" class="w-100 h-100 p-1 text-center" role="button">
                    Choisir un fichier
                    </label>
                    <input type="radio" name="postuler_lm"  class="d-none" value="2" id="postulerFichier"/>
                    <div id="postFicFied" class="d-none">
                        <input type="file" name="postuler_lm_fichier" accept="application/pdf" class="form-control" id="postulerLmFic"/>
                        <embed class="ratio ratio-1x1 d-none" type="application/pdf" id="postulerLmLayout">
                    </div>
                </div>
                {*** rediger ***}
                <div class="my-2 lmtoggle rounded border-2 border">
                    <label for="postulerRediger" class="w-100 h-100 p-1 text-center" role="button">
                        Rediger une lettre de motivation
                    </label>
                    <input type="radio" name="postuler_lm" id="postulerRediger" class="d-none" value="3"/>
                    <textarea name="postuler_lm_rediger" class="d-none form-control" id="postRedFied"></textarea>
                </div>
            </div>
            <button type="submit" class="btn btn-primary mx-auto" formenctype="multipart/form-data">
                <i class="fa-solid fa-paper-plane"></i>Envoyer
            </button>
        </form>
    </div>
    
{/block}
{block name="script"}
<script language="javascript" type="text/javascript">
    /**
    * read file
    */
    function readURL(input, el) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $(el).attr('src', e.target.result);
                $(el).removeClass('d-none');
            }

            reader.readAsDataURL(input.files[0]);
        }
    }
    /**
    * toggle border
    */
    function toggleBorder(radio,level){
        if($(radio).is(':checked')&& $(radio).val()==level){
        $(radio).parent().addClass('border-primary');
        }
        else{
            $(radio).parent().removeClass('border-primary');
        }
    }
    /**
    * show after
    */
    function showAfter(radio, el){
    if($(radio).is(':checked'))
        $(el).removeClass('d-none');
    else
        $(el).addClass('d-none');
    }
//cv
    $("#postulerCv").change(function(){
    readURL(this,'#postulerCvLayout');
    });
    
//lm
    $("#postulerLmFic").change(function(){
    readURL(this,'#postulerLmLayout');
    });

    $('.lmtoggle').click(()=>{
        toggleBorder("#postulerRediger",3);
        toggleBorder("#postulerSans", 1);
        toggleBorder("#postulerFichier", 2);
        showAfter("#postulerRediger", '#postRedFied');
        showAfter("#postulerFichier", '#postFicFied');
    });
//submit
</script>
{/block}