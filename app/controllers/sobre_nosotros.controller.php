<?php

/*
 * Sobre Nosotros Controller
 * Get routes: Acerca de nosotros, Derechos humanos, Ubicacion y contacto, Donativos
 */

$app->get("/sobre_nosotros/acerca", function () use ($app) {
  $app->render('acerca_nosotros.html.twig');
});

$app->get("/sobre_nosotros/derechos_humanos", function () use ($app) {
  $app->render('derechos_humanos.html.twig');
});

$app->get("/sobre_nosotros/contacto", function () use ($app) {
  $app->render('ubicacion_contacto.html.twig');
});

$app->get("/donativos", function () use ($app) {
  $app->render('donativos.html.twig');
});

?>
