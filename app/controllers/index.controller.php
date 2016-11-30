<?php

//GET route
$app->get('/', function () use ($app) {
  $comunicados = R::find('comunicado', 'ORDER BY fecha DESC');
  $acciones = R::find('accion', 'ORDER BY fecha DESC');
  $eventos = R::find('evento', 'ORDER BY fecha DESC LIMIT 4');
  $imagenes = array();
  foreach ($eventos as $evento) {
    $imagen = R::findOne('album', 'evento_id = :eventoId', array(':eventoId' => $evento->id));
    if ($imagen) {
      array_push($imagenes, $imagen->imagen);
    } else {
      array_push($imagenes, "default");
    }
  }
  $data = array('comunicados' => $comunicados,
                'acciones' => $acciones,
                'eventos' => $eventos,
                'imagenes' => $imagenes);
  $app->render('home.html.twig', $data);
});

?>
