
<div class="col-sm-6">
    {if $Admin == TRUE}
    <div class="row">
        <div class="col-sm-10">
            <input type="text" class="form-control" placeholder="Nombre de la Aerolinea" id="NAerolinea">
            <input type="text" class="form-control" placeholder="Pais de Aerolinea" id="PAerolinea">
            <input type="text" class="form-control" placeholder="Cantidad de Aviones" id="CAerolinea">
            <hr>
            <button type="button" id="AAerolinea" class="btn btn-default">Agregar Aerolinea</button>
        </div>
    </div>
    {/if}
    <hr>
    <div class="row" id="comentariosHolder">
          <div class="titleBox">
              <label id="AerolineaLabel"> Comentarios De la Aerolinea </label>
          </div>
          <div id="commentList">

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
          {include file="tAerolinea.tpl"}
        </tbody>
      </table>
  </div>
</div>
