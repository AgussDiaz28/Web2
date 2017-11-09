<div class="row">
  {if $Admin == TRUE}
    <div class="col-sm-6">
        <div class="row">
            <div class="col-sm-10">
                <input type="text" class="form-control" placeholder="Nombre de la Ciudad" id="NCiudad">
            </div>
            <div class="col-sm-2">
                <button type="button" id="ACiudad" class="btn btn-default">Agregar Ciudad</button>
            </div>
        </div>
        <hr>
        <div class="row">
          <div class="col-sm-10">
            <div id="myCarousel" class="carousel slide centered" data-ride="carousel">
                <!-- {if !empty($images) }
                  {foreach from=$images item=image} -->
                      <ol class="carousel-indicators">
                         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                         <li data-target="#myCarousel" data-slide-to="1"></li>
                         <li data-target="#myCarousel" data-slide-to="2"></li>
                      </ol>

                      <div class="carousel-inner">
                          <div class="item active" style="max-height: 550px;">
                              <img src="images/ls.jpg" alt="Los Angeles">
                          </div>

                          <div class="item" style="max-height: 550px;">
                              <img src="images/la.jpg" alt="Las Vegas">
                          </div>
                      </div>
                    <!-- {/foreach}
                  {/if} -->
                  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                  </a>
            </div>
          </div>
        </div>
    </div>
{/if}
  <div class="col-sm-6">
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
                <td value="{$ciudad.ID_CIUDAD}" class="ciudad">{$ciudad.NOMBRE_CIUDAD}</td>
                  {if $Admin == TRUE}
                  <td class="admin col-sm-2">
                      <div class="col-sm-3">
                        <span class="glyphicon glyphicon-edit editCityRow" id="{$ciudad.ID_CIUDAD}"></span>
                      </div>
                      <div class="col-sm-3">
                        <span class="glyphicon glyphicon-trash deleteCityRow" id="{$ciudad.ID_CIUDAD}"></span>
                      </div>
                      <div class="col-sm-3">
                        <span class="glyphicon glyphicon-cloud-upload uploadImage" id="{$ciudad.ID_CIUDAD}"></span>
                      </div>
                      <div class="col-sm-3">
                        <span class="glyphicon glyphicon-eye viewPhotos" id="{$ciudad.ID_CIUDAD}"></span>
                      </div>
                  </td>
                  {/if}
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
