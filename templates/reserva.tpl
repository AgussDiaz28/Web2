
<div class="row">
    <div class="col-sm-3">
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
    <div class="col-sm-3">
        <label for="daterange"> Seleccione mes </label>
            <select class="form-control" id="monthSelector"name="">
                {if !empty($meses) }
                    {foreach from=$meses item=mes}
                        <option value="{$mes.start}/{$mes.end}">{$mes.nombre}</option>
                    {/foreach}
                {/if}
            </select>
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-12">
        <div id="full-year-calendar"> </div>
    </div>

</div>
