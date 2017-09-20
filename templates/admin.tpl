<div class="row">
  <div class="col-sm-6">
      <div class="col-sm-8">
          <input type="text" class="form-control" placeholder="Nombre de la Ciudad" id="NCiudad">
      </div>
      <div class="col-sm-2">
          <button type="button" id="ACiudad" class="btn btn-default">Agregar Ciudades</button>
      </div>
  </div>
  <div class="col-sm-6">
      <div class="col-sm-8">
          <input type="text" class="form-control" placeholder="Nombre de la Aerolinea" id="NAerolinea">
      </div>
      <div class="col-sm-2">
          <button type="button" id="AAerolinea" class="btn btn-default">Agregar Aerolineas</button>
      </div>
  </div>


</div>
<hr>
<div class="row">
  <div class="col-sm-12">
    <table class="table table-striped .table-responsive">
        <thead>
          <tr>
            <th>Codigo Vuelo</th>
            <th>Aerolinea</th>
            <th>Origen</th>
            <th>Destino</th>
            <th>Fecha</th>
            <th>Precio</th>
            <th>Comfirmar Nuevo Vuelo</th>
          </tr>
        </thead>
        <tbody>
        <tr>
            <td><input id="CVuelo"></td>
            <td><select class="" name="" id="SNAerolinea">
              {if isset($Aerolineas) }
                  {foreach from=$Aerolineas item=Aerolinea}
                    <option value="{$Aerolinea.ID_AEROLINEA}">{$Aerolinea.NOMBRE_AEROLINEA}</option>
                  {/foreach}
              {/if}
            <td><select class="" name="" id="SCOrigen">
              {if isset($ciudades) }
                {foreach from=$ciudades item=ciudad}
                  <option value="{$ciudad.ID_CIUDAD}">{$ciudad.NOMBRE_CIUDAD}</option>
                {/foreach}
              {/if}
            </select></td>
            <td><select class="" name="" id="SCDestino">
              {if isset($ciudades) }
                {foreach from=$ciudades item=ciudad}
                  <option value="{$ciudad.ID_CIUDAD}">{$ciudad.NOMBRE_CIUDAD}</option>
                {/foreach}
              {/if}
            </select></td>
            <td><input id="FSV"></td>
            <td><input id="PVuelo"></td>
            <td><span class="glyphicon glyphicon-check" id="AVuelo"></span></td>
        </tr>
        </tbody>
    </table>


  </div>
</div>
