{if !empty($usuarios) }
  {foreach from=$usuarios item=usser}
  <tr>
      <td value="{$usser.ID_USUARIO}" class="usuario">{$usser.USERNAME}</td>
      <td>{$usser.EMAIL}</td>
      <td>
        <div class="checkbox">
          <label>
            {if $usser.ADMIN == 1}
              <input type="checkbox" class="permisoAdmin" id="{$usser.ID_USUARIO}" checked>
            {else}
              <input type="checkbox" class="permisoAdmin" id="{$usser.ID_USUARIO}">
            {/if}
          </label>
        </div>
      </td>
      <td class="admin"><span class="glyphicon glyphicon-trash deleteUsserRow" id="{$usser.ID_USUARIO}"></span></td>
  </tr>
  {/foreach}
{/if}
