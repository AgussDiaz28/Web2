
<div class="col-sm-6">
    <div class="row">
        <div class="col-sm-10">
            <input type="text" class="form-control" placeholder="Nombre de la Aerolinea" id="NAerolinea">
            <input type="text" class="form-control" placeholder="Pais de Aerolinea" id="PAerolinea">
            <input type="text" class="form-control" placeholder="Cantidad de Aviones" id="CAerolinea">
            <hr>
            <button type="button" id="AAerolinea" class="btn btn-default">Agregar Aerolinea</button>
        </div>
    </div>
    <hr>
    <div class="row" id="comentariosHolder">
      <div class="detailBox" style="width: inherit;margin: 7%;">
    <div class="titleBox">
      <label id="AerolineaLabel"> Comentarios De la Aerolinea </label>
    </div>
    <div class="actionBox" style="padding-top: 0px;">
      <div class="commentList">

      </div>
        <form class="form-inline" role="form">
            <div class="form-group">
                <input class="form-control" type="text" id="NComentario" placeholder="Agrega Tu Comentario" />
                <button class="btn btn-default" id="ANComentario">Agregar</button>
            </div>
        </form>
    </div>
</div>
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
        <tbody id="tAerolinea">
          {if !empty($Aerolineas) }
            {foreach from=$Aerolineas item=Aerolinea}
            <tr>
                <td>{$Aerolinea.NOMBRE_AEROLINEA}</td>
                <td>{$Aerolinea.PAIS_ORIGEN}</td>
                <td>{$Aerolinea.CANT_AVIONES}</td>
              <td class="admin"><span class="glyphicon glyphicon-edit editAerolienaRow" id="{$Aerolinea.ID_AEROLINEA}"> &nbsp  </span><span class="glyphicon glyphicon-trash deleteAerolineaRow" id="{$Aerolinea.ID_AEROLINEA}"> &nbsp</span> <span class="glyphicon glyphicon-comment comentAerolinea" id="{$Aerolinea.ID_AEROLINEA}"> &nbsp</span></td>
            </tr>
            {/foreach}
          {/if}
        </tbody>
      </table>
  </div>
</div>
