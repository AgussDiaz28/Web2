
<div class="row">
    <div class="col-sm-6">
        <label for="departamentos"> Seleccione el departamento a buscar </label>
        <select class="form-control" id="Departamentos"name="">
            <option value="">Departamentos</option>
            {if !empty($departamentos) }
                {foreach from=$departamentos item=departamento}
                    <option value="{$departamento.id_dpto}">{$departamento.descripcion}</option>
                {/foreach}
            {/if}
        </select>
    </div>
    <div class="col-sm-6">
        <label for="daterange"> Seleccione fecha para ver disponibilidad </label>
        <input type="text" name="daterange" style="background: #fff; cursor: pointer; padding: 5px 10px; border:
            1px solid #ccc; width: 100%"  />

    </div>
</div>

<div class="tooltip">Calendar
    <span class="tooltiptext">Tooltip text</span>
</div>

<br>
<div class="row">


    <div class="col-sm-12">
        <div id="full-year-calendar"></div>
    </div>

</div>





