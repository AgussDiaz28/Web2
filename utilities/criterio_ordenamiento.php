<?php
  function criterio_ordenamiento($a, $b) {
    if ($a['PRECIO'] == $b['PRECIO']) {
        return 0;
    }
    return ($a['PRECIO'] < $b['PRECIO']) ? -1 : 1;
  }
 ?>
