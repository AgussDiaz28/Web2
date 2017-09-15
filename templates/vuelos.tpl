<div class="row">
  <div class="col-sm-4">
    <label>Ciudad</label>
    <select class="" name="">    </select>
  </div>
  <div class="col-sm-4">
    <label>Aerolinea</label>
    <select class="" name="">    </select>
  </div>
  <div class="col-sm-4">
    <label>Fecha</label>
    <select class="" name="">    </select>
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
          {if isset($foo) }
              {foreach from=$vuelo key=index item=imagen}
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
