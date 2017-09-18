<div class="row">
    <div class="col-sm-4">
      <label>Ciudad Destino</label>
      <select class="" name="">
          {if isset($ciudades) }
            {foreach from=$ciudades item=ciudad}
              <option>{$ciudad.NOMBRE_CIUDAD}</option>
            {/foreach}
          {/if}
      </select>
    </div>
    <div class="col-sm-4">
      <label>Aerolinea</label>
      <select class="" name="">
          {if isset($Aerolineas) }
              {foreach from=$Aerolineas item=Aerolinea}
                <option id="{$Aerolinea.ID_AEROLINEA}">{$Aerolinea.NOMBRE_AEROLINEA}</option>
              {/foreach}
          {/if}
      </select>
    </div>
    <div class="col-sm-4">
         <input class="form-control" id="date" name="date" placeholder="MM/DD/YYYY" type="text"/>
    </div>
</div>
<div class="row">
  <div class="col-sm-12">
    <table class="table table-striped .table-responsive">
        <thead>
          <tr>
            <th>Codigo Vuelo</th>
            <th>Aerolinea</th>
            <th>Destino</th>
            <th>Fecha de Salida</th>
            <th>Precio</th>
          </tr>
        </thead>
        <tbody>
          {if isset($vuelos) }
              {foreach from=$vuelos  item=vuelo}
                  <td>{$vuelo.CODIGO_VUELO}</td>
                  <td>{$vuelo.NOMBRE_AEROLINEA}</td>
                  <td>{$vuelo.NOMBRE_CIUDAD}</td>
                  <td>{$vuelo.FECHA_SALIDA}</td>
                  <td>{$vuelo.PRECIO}</td>
              {/foreach}
          {/if}
        </tbody>
    </table>


  </div>
</div>
