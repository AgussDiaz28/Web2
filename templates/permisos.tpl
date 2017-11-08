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
          {foreach from=$usuarios item=usser}
          <tr>
              <td value="{$usser.ID_USUARIO}" class="usuario">{$usser.USERNAME}</td>
              <td>{$usser.EMAIL}</td>
              <td>
                <div class="checkbox">
                  <label>
                    {if $usser.ADMIN == 1}
                      <input type="checkbox" class="permiso" checked>
                    {else}
                      <input type="checkbox" class="permiso">
                    {/if}
                  </label>
                </div>
              </td>
              <td class="admin"><span class="glyphicon glyphicon-trash deleteUsserRow" id="{$usser.ID_USUARIO}"></span></td>
          </tr>
          {/foreach}
        {/if}
      </tbody>
    </table>
  </div>
</div>
