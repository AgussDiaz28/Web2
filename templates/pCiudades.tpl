<div class="row">
  <div class="col-sm-6">
      <div class="col-sm-8">
          <input type="text" class="form-control" placeholder="Nombre de la Ciudad" id="NCiudad">
      </div>
      <div class="col-sm-2">
          <button type="button" id="ACiudad" class="btn btn-default">Agregar Ciudad</button>
      </div>
  </div>

  <div class="col-sm-6">
    <label>Nuestros Destinos</label>
      <table class="table table-striped .table-responsive">
        <thead>
          <tr>
            <td>Ciudad</td>
            <td>Acciones</td>
          </tr>
        </thead>
        <tbody id="tciudades">
          {if !empty($ciudades) }
            {foreach from=$ciudades item=ciudad}
            <tr>
                <td value="{$ciudad.ID_CIUDAD}" class="ciudad">{$ciudad.NOMBRE_CIUDAD}</td>
                {if !empty($Admin)}
                    {if $Admin == TRUE}
                    <td class="admin"><span class="glyphicon glyphicon-edit editCityRow" id="{$ciudad.ID_CIUDAD}"> &nbsp  </span><span class="glyphicon glyphicon-trash deleteCityRow" id="{$ciudad.ID_CIUDAD}"></span></td>
                    {/if}
                {/if}
            </tr>
            {/foreach}
          {/if}
        </tbody>
      </table>
  </div>
</div>
