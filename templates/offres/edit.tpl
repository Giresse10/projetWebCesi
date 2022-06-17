{extends file="../base.tpl"}
{block name="title"}
    modifier l'offre
{/block}
{block name="content"}
    <div class="mx-auto border rounded shadow p-4 mt-3" style="max-width:800px;">
        <form method="post">
            <div class="row g-3">
                {**** titre ***}
                <div class="col-md-12 col-lg-8 position-relative">
                    <button class="btn position-absolute top-0 end-0 btnToggler1 translate-middle" type="button">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </button>
                    <input type="text" name="titre" class="form-control" value="{$offre->titre}" disabled />
                </div>
                {**** description ****}
                <div class="col-12 position-relative">
                    <button class="btn position-absolute top-0 end-0 btnToggler2" type="button">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </button>
                    <textarea name="description" class="form-control" disabled>{$offre->description}</textarea>
                </div>
                {********** competences **********}
                <div class="col-12 position-relative">
                <div class="ui-widget">
                    <label for="tagsComp">Competences </label>
                    <button class="btn position-absolute top-0 end-0 btnToggler7" type="button">
                        <i class="fa-solid fa-pen-to-square"></i>
                     </button>
                    <input id="tagsComp" type="text" class="form-control" name="comp" disabled
                        value="{if !empty($offre->competences)}{foreach $offre->competences as $c}{$c->nom}, {/foreach}{/if}"
                    />
                </div>
                </div>
                {*** nombre de place ***}
                <div class="col-md-3 col-sm-12 position-relative">
                    <label for="nbPlaces">Place(s)</label>
                    <button class="btn position-absolute top-0 end-0 btnToggler3" type="button">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </button>
                    <input type="number" name="nbplaces" class="form-control" value="{$offre->nbPlaces}" disabled
                        id="nbPlaces" />
                </div>
                {*** a partir ***}
                <div class="col-md-3 col-sm-12 position-relative">
                    <label for="aPartir">debut</label>
                    <button class="btn position-absolute top-0 end-0 btnToggler4" type="button">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </button>
                    <input type="date" name="date" class="form-control" value="{$offre->date}" disabled id="aPartir" />
                </div>
                {*** duree ***}
                <div class="col-md-3 col-sm-12 position-relative">
                    <label for="Duree">durée</label>
                    <button class="btn position-absolute top-0 end-0 btnToggler5" type="button">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </button>
                    <input type="number" name="duree" class="form-control" value="{$offre->duree}" disabled id="Duree" />
                </div>
                {*** base de remuneration ***}
                <div class="col-md-3 col-sm-12 position-relative">
                    <label for="baseDR">remunération</label>
                    <button class="btn position-absolute top-0 end-0 btnToggler6" type="button">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </button>
                    <input type="number" name="base" class="form-control" value="{$offre->baseDeRemuneration}" disabled id="baseDR" />
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

       $( function() {
var availableTags = [
{foreach $competences as $c}
 "{$c->nom}",
{/foreach}
    
];
function split( val ) {
  return val.split( /,\s*/ );
}
function extractLast( term ) {
  return split( term ).pop();
}

$( "#tagsComp" )
  // don't navigate away from the field on tab when selecting an item
  .on( "keydown", function( event ) {
    if ( event.keyCode === $.ui.keyCode.TAB &&
        $( this ).autocomplete( "instance" ).menu.active ) {
      event.preventDefault();
    }
  })
  .autocomplete({
    minLength: 0,
    source: function( request, response ) {
      // delegate back to autocomplete, but extract the last term
      response( $.ui.autocomplete.filter(
        availableTags, extractLast( request.term ) ) );
    },
    focus: function() {
      // prevent value inserted on focus
      return false;
    },
    select: function( event, ui ) {
      var terms = split( this.value );
      // remove the current input
      terms.pop();
      // add the selected item
      terms.push( ui.item.value );
      // add placeholder to get the comma-and-space at the end
      terms.push( "" );
      this.value = terms.join( ", " );
      return false;
    }
  });
} );
       </script>
{/block}

{block name="style"}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
{/block}