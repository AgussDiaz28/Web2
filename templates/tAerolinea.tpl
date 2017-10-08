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
