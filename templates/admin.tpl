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
      <div class="col-sm-8">
          <input type="text" class="form-control" placeholder="Nombre de la Aerolinea" id="NAerolinea">
      </div>
      <div class="col-sm-2">
          <button type="button" id="AAerolinea" class="btn btn-default">Agregar Aerolinea</button>
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
        <tbody id="tvuelos">
        <tr>
            <td><input id="CVuelo"></td>
            <td><select class="" name="" id="SNAerolinea">
              {if !empty($Aerolineas) }
                  {foreach from=$Aerolineas item=Aerolinea}
                    <option value="{$Aerolinea.ID_AEROLINEA}">{$Aerolinea.NOMBRE_AEROLINEA}</option>
                  {/foreach}
              {/if}
            <td><select class="" name="" id="SCOrigen">
              {if !empty($ciudades) }
                {foreach from=$ciudades item=ciudad}
                  <option value="{$ciudad.ID_CIUDAD}">{$ciudad.NOMBRE_CIUDAD}</option>
                {/foreach}
              {/if}
            </select></td>
            <td><select class="" name="" id="SCDestino">
              {if !empty($ciudades) }
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
<hr>
<div class="row">
  <div class="col-sm-6">
    <label>Nuestros Destinos</label>
      <table class="table table-striped .table-responsive">
        <thead>
          <tr>
            <td>Ciudad</td>
            <td>Acciones</td>
          </tr>
        </thead>
        <tbody>
          {if !empty($ciudades) }
            {foreach from=$ciudades item=ciudad}
            <tr>
                <td value="{$ciudad.ID_CIUDAD}">{$ciudad.NOMBRE_CIUDAD}</td>
                <td class="admin"><span class="glyphicon glyphicon-edit editCityRow" id="{$ciudad.ID_CIUDAD}"> &nbsp  </span><span class="glyphicon glyphicon-trash deleteCityRow" id="{$ciudad.ID_CIUDAD}">  </span></td>
            </tr>
            {/foreach}
          {/if}
        </tbody>
      </table>
  </div>
  <div class="col-sm-6">
    <label>Aerolienas de Viaje</label>
      <table class="table table-striped .table-responsive">
        <thead>
          <tr>
            <td>Aerolinea</td>
            <td>Acciones</td>
          </tr>
        </thead>
        <tbody>
          {if !empty($Aerolineas) }
            {foreach from=$Aerolineas item=Aerolinea}
            <tr>
                <td value="{$ciudad.ID_CIUDAD}">{$Aerolinea.NOMBRE_AEROLINEA}</td>
                <td class="admin"><span class="glyphicon glyphicon-edit editAerolienaRow" id="{$Aerolinea.ID_AEROLINEA}"> &nbsp  </span><span class="glyphicon glyphicon-trash deleteAerolineaRow" id="{$Aerolinea.ID_AEROLINEA}">  </span></td>
            </tr>

            {/foreach}
          {/if}
        </tbody>
      </table>
  </div>
</div>



  </div>
</div>
