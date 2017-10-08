
  <div class="col-sm-6">
      <div class="col-sm-8">
          <input type="text" class="form-control" placeholder="Nombre de la Aerolinea" id="NAerolinea">
          <input type="text" class="form-control" placeholder="Pais de Aerolinea" id="PAerolinea">
          <input type="text" class="form-control" placeholder="Cantidad de Aviones" id="CAerolinea">
      </div>
      <div class="col-sm-2">
          <button type="button" id="AAerolinea" class="btn btn-default">Agregar Aerolinea</button>
      </div>
  </div>


<div class="row">

  <div class="col-sm-6">
    <label>Aerolienas de Viaje</label>
      <table class="table table-striped .table-responsive">
        <thead>
          <tr>
            <th>Aerolinea</th>
            <th>Pais de Origen</th>
            <th>Cantidad de Aviones</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {if !empty($Aerolineas) }
            {foreach from=$Aerolineas item=Aerolinea}
            <tr>
                <td>{$Aerolinea.NOMBRE_AEROLINEA}</td>
                <td>{$Aerolinea.PAIS_ORIGEN}</td>
                <td>{$Aerolinea.CANT_AVIONES}</td>
                <td class="admin"><span class="glyphicon glyphicon-edit editAerolienaRow" id="{$Aerolinea.ID_AEROLINEA}"> &nbsp  </span><span class="glyphicon glyphicon-trash deleteAerolineaRow" id="{$Aerolinea.ID_AEROLINEA}">  </span></td>
            </tr>
            {/foreach}
          {/if}
        </tbody>
      </table>
  </div>
</div>
