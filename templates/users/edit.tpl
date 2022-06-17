{extends file="../base.tpl"}
{block name="title"}
    modifier l'offre
{/block}
{block name="content"}
    <div class="mx-auto border rounded shadow p-4 mt-3" style="max-width:800px;">
        <form method="post">
            <div class="row g-3">
                {**** nom ***}
                <div class="col-md-12 col-lg-5 position-relative">
                    <button class="btn position-absolute top-0 end-0 btnToggler1 translate-middle" type="button">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </button>
                    <input type="text" name="nom" class="form-control" value="{$users->nom}" disabled />
                </div>
                {**** prenom ***}
                <div class="col-md-12 col-lg-5 position-relative">
                    <button class="btn position-absolute top-0 end-0 btnToggler2 translate-middle" type="button">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </button>
                    <input type="text" name="prenom" class="form-control" value="{$users->prenom}" disabled />
                </div>
            </div>
            <input class="btn btn-primary my-3" type="submit" value="Enregistrer" name="edit"/>
        </form>
    </div>
{/block}

{block name="script"}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        function edit(sel){
            $(sel).click(()=>{
                event.preventDefault();
                $(`{'${sel}'}+[name]`).prop("disabled", false);
                console.log($(this).next()) ;
            });
        }
       edit('.btnToggler1');edit('.btnToggler2');edit('.btnToggler3');
       edit('.btnToggler4');edit('.btnToggler5');edit('.btnToggler6');
       edit('.btnToggler7');
       </script>
{/block}

{block name="style"}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
{/block}