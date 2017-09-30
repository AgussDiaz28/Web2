
  <div class="col-sm-6">
      <div class="col-sm-8">
          <input type="text" class="form-control" placeholder="Nombre de la Aerolinea" id="NAerolinea">
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
