<div class="row">
    <div class="col-sm-4">
      <label>Ciudad</label>
      <select class="" name="">
          {if isset($ciudades) }
            {foreach from=$ciudades key=row item=ciudad}
              <option id="{$ciudades[id]}">{$ciudades[Nombre]}/option>
            {/foreach}
          {/if}
      </select>
    </div>
    <div class="col-sm-4">
      <label>Aerolinea</label>
      <select class="" name="">
          {if isset($Aerolineas) }
              {foreach from=$Aerolineas key=column item=aerolinea}
                <option id="{$Aerolineas[id]}">{$Aerolineas[Nombre]}/option>
              {/foreach}
          {/if}
      </select>
    </div>
    <div class="col-sm-4">
      <label>Fecha</label>
         <input class="form-control" id="date" name="date" placeholder="MM/DD/YYYY" type="text"/>
    </div>
</div>
<div class="row">
  <div class="col-sm-12">
    <table class="table table-striped .table-responsive">
        <thead>
          <tr>
            <th>Codigo Vuelo</th>
            <th>Fecha</th>
            <th>Origen</th>
            <th>Destino</th>
            <th>Fecha</th>
            <th>Precio</th>
          </tr>
        </thead>
        <tbody>
          {if isset($vuelo) }
              {foreach from=$vuelos key=index item=vuelo}
                  <td>{$vuelo[Codigo]}</td>
                  <td>{$vuelo[Fecha]}</td>
                  <td>{$vuelo[Origen]}</td>
                  <td>{$vuelo[Destino]}</td>
                  <td>{$vuelo[Fecha]}</td>
                  <td>{$vuelo[Precio]}</td>
              {/foreach}
          {/if}
        </tbody>
    </table>


  </div>
</div>
