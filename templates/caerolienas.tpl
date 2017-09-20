  <option></option>
  {if isset($Aerolineas) }
      {foreach from=$Aerolineas item=Aerolinea}
        <option id="{$Aerolinea.ID_AEROLINEA}">{$Aerolinea.NOMBRE_AEROLINEA}</option>
      {/foreach}
  {/if}
