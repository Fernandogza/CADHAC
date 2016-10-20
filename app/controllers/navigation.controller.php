<?php

$app->get("/sobre_nosotros/acerca", function () use ($app) {
  $app->render('acerca_nosotros.html.twig');
});

$app->get("/sobre_nosotros/derechos_humanos", function () use ($app) {
  $app->render('derechos_humanos.html.twig');
});

$app->get("/sobre_nosotros/contacto", function () use ($app) {
  $app->render('ubicacion_contacto.html.twig');
});

$app->get("/comunicacion/acciones_urgentes", function () use ($app) {
  $app->render('acciones_urgentes.html.twig');
});

$app->get("/comunicacion/comunicados", function () use ($app) {
  $comunicados = R::find('comunicado');
  $data = array('comunicados' => $comunicados);
  $app->render('comunicados.html.twig', $data);
});

$app->get('/comunicacion/comunicados/:id', function ($id) use ($app) {
  $comunicado = R::load('comunicado', $id);
  $data = array('comunicado' => $comunicado);
  $app->render('articulo.html.twig', $data);
});

$app->get("/comunicacion/publicaciones", function () use ($app) {
  $publicaciones = R::find('publicacion');
  $data = array('publicaciones' => $publicaciones);
  $app->render('publicaciones.html.twig', $data);
});

$app->get("/desaparecidos", function () use ($app) {
  $desaparecidos = R::find('desaparecido');
  $data = array('desaparecidos' => $desaparecidos);
  $app->render('desaparecidos.html.twig', $data);
});

$app->get("/amores", function () use ($app) {
  $app->render('amores.html.twig');
});

$app->get("/comunicacion/videos", function () use ($app) {
  $app->render('videos.html.twig');
});

$app->get("/donativos", function () use ($app) {
  $app->render('donativos.html.twig');
});

?>
