{if isset($vuelos) }
    {foreach from=$vuelos  item=vuelo}
    <tr>
      <td>{$vuelo.CODIGO_VUELO}</td>
      <td>{$vuelo.NOMBRE_AEROLINEA}</td>
      <td>{$vuelo.CIUDAD_ORIGEN}</td>
      <td>{$vuelo.CIUDAD_DESTINO }</td>
      <td>{$vuelo.FECHA_SALIDA}</td>
      <td>{$vuelo.PRECIO}</td>
    </tr>
    {/foreach}
{/if}
