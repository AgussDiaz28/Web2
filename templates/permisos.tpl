<div class="row">
  <div class="col-md-6 col-md-offset-3">
    <label>Panel de Control</label>
    <table class="table table-striped .table-responsive">
      <thead>
        <tr>
          <td>Usuario</td>
          <td>E-Mail</td>
          <td>Permisos Admin</td>
        </tr>
      </thead>
      <tbody id="tpermisos">
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
      </tbody>
    </table>
  </div>
</div>
