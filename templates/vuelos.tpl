<div class="row">
  <div class="container-fluid text-center" >
    <div class="col-sm-4">
      <select class="form-control" id="CCiudades" name="">
        <option value="">Ciudad Destino</option>form-control
        {if isset($ciudades) }
          {foreach from=$ciudades item=ciudad}
            <option value="{$ciudad.ID_CIUDAD}">{$ciudad.NOMBRE_CIUDAD}</option>
          {/foreach}
        {/if}
      </select>
    </div>
    <div class="col-sm-4">
      <select class="form-control" id="CAerolineas"name="">
        <option value="">Aerolineas</option>
        {if isset($Aerolineas) }
            {foreach from=$Aerolineas item=Aerolinea}
              <option value="{$Aerolinea.ID_AEROLINEA}">{$Aerolinea.NOMBRE_AEROLINEA}</option>
            {/foreach}
        {/if}
      </select>
    </div>
    <div class="col-sm-2">
      <div class='input-group date ' id='datetimepicker1'>
         <input type='text' class="form-control" />
         <span class="input-group-addon">
             <span class="glyphicon glyphicon-calendar"></span>
         </span>
      </div>
    </div>

    <div class="col-sm-1">
         <button type="button" id="BVuelo" class="btn btn-default">Buscar Vuelo</button>
    </div>
    <div class="col-sm-1">

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
            <th>Fecha de Salida</th>
            <th>Precio</th>
            <th class="admin">Editar/Eliminar</th>
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
                <td class="admin"><span class="glyphicon glyphicon-edit editRow" id="{$vuelo.ID_VUELO}"> &nbsp  </span><span class="glyphicon glyphicon-trash deleteRow" id="{$vuelo.ID_VUELO}">  </span></td>
              </tr>
              {/foreach}
          {/if}
        </tbody>
    </table>


  </div>
</div>
