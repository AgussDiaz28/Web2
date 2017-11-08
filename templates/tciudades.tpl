{if !empty($ciudades) }
  {foreach from=$ciudades item=ciudad}
  <tr>
      <td value="{$ciudad.ID_CIUDAD}" class="ciudad">{$ciudad.NOMBRE_CIUDAD}</td>
      <td class="admin"><span class="glyphicon glyphicon-edit editCityRow" id="{$ciudad.ID_CIUDAD}"></span><span class="glyphicon glyphicon-trash deleteCityRow" id="{$ciudad.ID_CIUDAD}">  </span></td>
  </tr>
  {/foreach}
{/if}
