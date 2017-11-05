
  {if !empty($Aerolineas) }
    {foreach from=$Aerolineas item=Aerolinea}
    <tr>
        <td class="rdata">{$Aerolinea.NOMBRE_AEROLINEA}</td>
        <td class="rdata">{$Aerolinea.PAIS_ORIGEN}</td>
        <td class="rdata">{$Aerolinea.CANT_AVIONES}</td>
        <td class="admin"><span class="glyphicon glyphicon-edit editAerolienaRow" id="{$Aerolinea.ID_AEROLINEA}"> &nbsp  </span><span class="glyphicon glyphicon-trash deleteAerolineaRow" id="{$Aerolinea.ID_AEROLINEA}"> &nbsp</span> <span class="glyphicon glyphicon-comment comentAerolinea" id="{$Aerolinea.ID_AEROLINEA}"> &nbsp</span></td>
    </tr>
    {/foreach}
  {/if}
