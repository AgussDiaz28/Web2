{if !empty($usuarios) }
  {foreach from=$usuarios item=user}
  <tr>
      <td value="{$user.ID_USUARIO}" class="usuario">{$user.USERNAME}</td>
      <td>{$user.EMAIL}</td>
      <td>
        <div class="checkbox">
          <label>
            {if $user.ADMIN == 1}
              <input type="checkbox" class="permisoAdmin" id="{$user.ID_USUARIO}" checked>
            {else}
              <input type="checkbox" class="permisoAdmin" id="{$user.ID_USUARIO}">
            {/if}
          </label>
        </div>
      </td>
      <td class="admin"><span class="glyphicon glyphicon-trash deleteuserRow" id="{$user.ID_USUARIO}"></span></td>
  </tr>
  {/foreach}
{/if}
