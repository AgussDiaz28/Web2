{if !empty($images) }
    {foreach from=$images item=imagen}
      <div class="col-sm-6">
        <img class="img-thumbnail float-left" src="{$imagen.PATH}">
        {if $Admin == TRUE}
            <button type="button" class="close deleteImg" avalue="{$imagen.ID_CIUDAD}" value="{$imagen.ID_IMAGEN}" >&times;</button>
        {/if}
      </div>
    {/foreach}
{/if}
