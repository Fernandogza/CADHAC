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

$app->get("/noticias/acciones_urgentes", function () use ($app) {
  $app->render('acciones_urgentes.html.twig');
});

$app->get("/noticias/comunicados", function () use ($app) {
  $app->render('comunicados.html.twig');
});

$app->get("/noticias/comunicados/1", function () use ($app) {
  $app->render('articulo.html.twig');
});

$app->get("/noticias/publicaciones", function () use ($app) {
  $app->render('publicaciones.html.twig');
});

$app->get("/desaparecidos", function () use ($app) {
  $app->render('desaparecidos.html.twig');
});

$app->get("/media", function () use ($app) {
  $app->render('media.html.twig');
});

$app->get("/donativos", function () use ($app) {
  $app->render('donativos.html.twig');
});



?>
