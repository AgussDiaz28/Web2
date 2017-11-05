<div class="row">
  <div class="container-fluid text-center" >
    <div class="col-sm-4">
      <select class="form-control" id="CCiudades" name="">
        <option value="">Ciudad Destino</option>form-control
        {if !empty($ciudades) }
          {foreach from=$ciudades item=ciudad}
            <option value="{$ciudad.ID_CIUDAD}">{$ciudad.NOMBRE_CIUDAD}</option>
          {/foreach}
        {/if}
      </select>
    </div>
    <div class="col-sm-4">
      <select class="form-control" id="CAerolineas"name="">
        <option value="">Aerolineas</option>
        {if !empty($Aerolineas) }
            {foreach from=$Aerolineas item=Aerolinea}
              <option value="{$Aerolinea.ID_AEROLINEA}">{$Aerolinea.NOMBRE_AEROLINEA}</option>
            {/foreach}
        {/if}
      </select>
    </div>
    <div class="col-sm-1">

    </div>
    <div class="col-sm-3">
      <!-- <div class='input-group date ' id='datetimepicker1'> IMPLEMENTACION A FUTURO
         <input type='text' class="form-control" />
         <span class="input-group-addon">
             <span class="glyphicon glyphicon-calendar"></span>
         </span>
      </div> -->
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
            {if !empty($Admin)}
                {if $Admin ==s true}
            <th class="admin">Editar/Eliminar</th>
                {/if}
            {/if}
          </tr>
        </thead>
        <tbody id="tvuelos">
          {if !empty($vuelos) }
              {foreach from=$vuelos  item=vuelo}
              <tr>
                <td class="rdata" value="{$vuelo.CODIGO_VUELO}">{$vuelo.CODIGO_VUELO}</td>
                <td class="rdata" value="{$vuelo.ID_AEROLINEA}">{$vuelo.NOMBRE_AEROLINEA}</td>
                <td class="rdata" value="{$vuelo.ID_ORIGEN}">{$vuelo.CIUDAD_ORIGEN}</td>
                <td class="rdata" value="{$vuelo.ID_DESTINO}">{$vuelo.CIUDAD_DESTINO }</td>
                <td class="rdata" value="{$vuelo.FECHA_SALIDA}">{$vuelo.FECHA_SALIDA}</td>
                <td class="rdata" value="{$vuelo.PRECIO}">{$vuelo.PRECIO}</td>
                {if !empty($Admin)}
                    {if $Admin == true}
                    <td class="admin"><span class="glyphicon glyphicon-edit editRow" id="{$vuelo.ID_VUELO}"> &nbsp  </span><span class="glyphicon glyphicon-trash deleteRow" id="{$vuelo.ID_VUELO}">  </span></td>
                    {/if}
                {/if}
              </tr>
              {/foreach}
          {/if}
        </tbody>
    </table>
  </div>
</div>
<hr>
{if !empty($Admin)}
  {if $Admin == true}
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

  </div>
</div>
{/if}
{/if}
