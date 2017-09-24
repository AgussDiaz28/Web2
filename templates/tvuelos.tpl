{if isset($vuelos) }
    {foreach from=$vuelos  item=vuelo}
    <tr>
      <td>{$vuelo.CODIGO_VUELO}</td>
      <td>{$vuelo.NOMBRE_AEROLINEA}</td>
      <td>{$vuelo.CIUDAD_ORIGEN}</td>
      <td>{$vuelo.CIUDAD_DESTINO }</td>
      <td>{$vuelo.FECHA_SALIDA}</td>
      <td>{$vuelo.PRECIO}</td>
      <td class="admin"><span class="glyphicon glyphicon-edit editRow" id="{$vuelo.ID_VUELO}"> &nbsp  </span><span class="glyphicon glyphicon-trash deleteRow" id="{$vuelo.ID_VUELO}">  </span></td>
    </tr>
    {/foreach}
{/if}
