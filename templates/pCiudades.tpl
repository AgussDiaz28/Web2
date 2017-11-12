<div class="row">

  <div class="col-sm-6">
    {if $Admin == TRUE}
      <div class="row">
          <div class="col-sm-10">
              <input type="text" class="form-control" placeholder="Nombre de la Ciudad" id="NCiudad">
          </div>
          <div class="col-sm-2">
              <button type="button" id="ACiudad" class="btn btn-default">Agregar Ciudad</button>
          </div>
      </div>
      <hr>
    {/if}
      <div class="row">
        <div id="listaImagenes">

        </div>
      </div>
  </div>

  <div class="col-sm-6">
    <label>Nuestros Destinos</label>
      <table class="table table-striped table-responsive">
        <thead>
          <tr>
            <td>Ciudad</td>
              {if $Admin == TRUE}
              <td>Acciones</td>
              {/if}
          </tr>
        </thead>
        <tbody id="tciudades">
          {include file="tciudades.tpl"}
        </tbody>
      </table>
      <div class="row uploadForm">
        <form class="" action="uploadImage" method="post" enctype="multipart/form-data">
            <input type="file" name="imagenes[]"  multiple>
            <input type="hidden" id="hiddenInput" name="id_ciudad" value="">
            <button class="btn btn-default" type="submit" name="button" id="uploadButton" > Subir</button>
        </form>
      </div>
    </div>
</div>
