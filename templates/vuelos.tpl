<div class="row">
  <div class="container-fluid text-center" >
    <div class="col-sm-4">
      <label>Ciudad Destino</label>
      <select class="" id="CCiudades" name="">
        {if isset($ciudades) }
          {foreach from=$ciudades item=ciudad}
            <option value="{$ciudad.ID_CIUDAD}">{$ciudad.NOMBRE_CIUDAD}</option>
          {/foreach}
        {/if}
      </select>
    </div>
    <div class="col-sm-4">
      <label>Aerolinea</label>
      <select class="" id="CAerolineas"name="">
        <option></option>
        {if isset($Aerolineas) }
            {foreach from=$Aerolineas item=Aerolinea}
              <option value="{$Aerolinea.ID_AEROLINEA}">{$Aerolinea.NOMBRE_AEROLINEA}</option>
            {/foreach}
        {/if}
      </select>
    </div>
    <div class="col-sm-2">
        <!--label>Fecha</label-->
         <input class="form-control" id="date" name="date" placeholder="MM/DD/YYYY" type="text"/>
    </div>
    <div class="col-sm-1">
         <button type="button" id="BVuelo" class="btn btn-default">Buscar Vuelo</button>
    </div>
    <div class="col-sm-1">

    </div>
  </div>
</div>
<div class="row">
  <div class="col-sm-12">
    <table class="table table-striped .table-responsive">
        <thead>
          <tr>
            <th>Codigo Vuelo</th>
            <th>Aerolinea</th>
            <th>Origen</th>
            <th>Destino</th>
            <th>Fecha de Salida</th>
            <th>Precio</th>
          </tr>
        </thead>
        <tbody id="tvuelos">
          {if isset($vuelos) }
              {foreach from=$vuelos  item=vuelo}
              <tr>
                <td>{$vuelo.CODIGO_VUELO}</td>
                <td>{$vuelo.NOMBRE_AEROLINEA}</td>
                <td>{$vuelo.CIUDAD_ORIGEN}</td>
                <td>{$vuelo.CIUDAD_DESTINO }</td>
                <td>{$vuelo.FECHA_SALIDA}</td>
                <td>{$vuelo.PRECIO}</td>
              </tr>
              {/foreach}
          {/if}
        </tbody>
    </table>


  </div>
</div>
