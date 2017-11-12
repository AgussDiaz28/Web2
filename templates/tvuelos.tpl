{if !empty($vuelos) }
    {foreach from=$vuelos  item=vuelo}
    <tr>
      <td class="rdata" value="{$vuelo.CODIGO_VUELO}">{$vuelo.CODIGO_VUELO}</td>
      <td class="rdata" value="{$vuelo.ID_AEROLINEA}">{$vuelo.NOMBRE_AEROLINEA}</td>
      <td class="rdata" value="{$vuelo.ID_ORIGEN}">{$vuelo.CIUDAD_ORIGEN}</td>
      <td class="rdata" value="{$vuelo.ID_DESTINO}">{$vuelo.CIUDAD_DESTINO }</td>
      <td class="rdata" value="{$vuelo.FECHA_SALIDA}">{$vuelo.FECHA_SALIDA}</td>
      <td class="rdata" value="{$vuelo.PRECIO}">{$vuelo.PRECIO}</td>
      {if !empty($Admin)}
          {if $Admin == TRUE}
          <td class="admin"><span class="glyphicon glyphicon-edit editRow" id="{$vuelo.ID_VUELO}"> &nbsp;  </span><span class="glyphicon glyphicon-trash deleteRow" id="{$vuelo.ID_VUELO}">  </span></td>
          {/if}
      {/if}
    </tr>
    {/foreach}
{/if}
