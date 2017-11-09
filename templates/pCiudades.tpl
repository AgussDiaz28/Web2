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

  <div class="col-sm-4">
    <label>Nuestros Destinos</label>
      <table class="table table-striped .table-responsive">
        <thead>
          <tr>
            <td>Ciudad</td>
              {if $Admin == TRUE}
              <td>Acciones</td>
              {/if}
          </tr>
        </thead>
        <tbody id="tciudades">
          {if !empty($ciudades) }
            {foreach from=$ciudades item=ciudad}
            <tr>
                <td value="{$ciudad.ID_CIUDAD}" class="ciudad col-sm-4">{$ciudad.NOMBRE_CIUDAD}</td>
                  <td class="admin col-sm-2">
                    {if $Admin == TRUE}
                      <div class="col-sm-3">
                        <span class="glyphicon glyphicon-edit editCityRow" id="{$ciudad.ID_CIUDAD}"></span>
                      </div>
                      <div class="col-sm-3">
                        <span class="glyphicon glyphicon-trash deleteCityRow" id="{$ciudad.ID_CIUDAD}"></span>
                      </div>
                    {/if}
                      <div class="col-sm-3">
                        <span class="glyphicon glyphicon-cloud-upload uploadImage" id="{$ciudad.ID_CIUDAD}"></span>
                      </div>
                      <div class="col-sm-3">
                        <span class="glyphicon glyphicon-picture viewPhotos" id="{$ciudad.ID_CIUDAD}"></span>
                      </div>
                  </td>
            </tr>
            {/foreach}
          {/if}
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
</div>
