{if !empty($ciudades) }
  {foreach from=$ciudades item=ciudad}
  <tr>
      <td value="{$ciudad.ID_CIUDAD}" class="ciudad col-sm-4">{$ciudad.NOMBRE_CIUDAD}</td>
      <td class="admin col-sm-2">
        {if $Admin == TRUE}
          <div class="col-sm-3">
            <span class="glyphicon glyphicon-edit editCityRow" id="{$ciudad.ID_CIUDAD}"></span>
          </div>
          <div class="col-sm-3">
            <span class="glyphicon glyphicon-trash deleteCityRow" id="{$ciudad.ID_CIUDAD}"></span>
          </div>
        {/if}
          <div class="col-sm-3">
            <span class="glyphicon glyphicon-cloud-upload uploadImage" id="{$ciudad.ID_CIUDAD}"></span>
          </div>
          <div class="col-sm-3">
            <span class="glyphicon glyphicon-picture viewPhotos" id="{$ciudad.ID_CIUDAD}"></span>
          </div>
      </td>
  </tr>
  {/foreach}
{/if}
