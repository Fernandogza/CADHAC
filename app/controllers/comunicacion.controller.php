<?php

// Comunicacion Controller

// GET
// Routes
// Comunicados route
$app->get("/comunicacion/comunicados", function () use ($app) {
  $total = R::count('comunicado');
  $limit = 6;
  $pages = ceil($total / $limit);
  $page = 1;
  $comunicados = R::find('comunicado', 'ORDER BY fecha DESC LIMIT ?, ?', array((($page-1)*$limit),$limit));
  $data = array('comunicados' => $comunicados, 'pages' => $pages, 'current' => $page);
  $app->render('comunicados.html.twig', $data);
});

// Comunicados pagination
$app->get("/comunicacion/comunicados/page/:num", function ($num) use ($app) {
  $total = R::count('comunicado');
  $limit = 6;
  $pages = ceil($total / $limit);
  $page = $num;
  $comunicados = R::find('comunicado', 'ORDER BY fecha DESC LIMIT ?, ?', array((($page-1)*$limit),$limit));
  $data = array('comunicados' => $comunicados, 'pages' => $pages, 'current' => $page);
  $app->render('comunicados.html.twig', $data);
});

// Articulo route
$app->get('/comunicacion/comunicados/:id', function ($id) use ($app) {
  $comunicado = R::load('comunicado', $id);
  $imagenes = R::find('imagen', 'comunicado_id = :comunicadoId', array(':comunicadoId' => $comunicado->id));
  $data = array('comunicado' => $comunicado, 'imagenes' => $imagenes);
  $app->render('articulo.html.twig', $data);
});

// Eventos route
$app->get("/comunicacion/eventos", function() use ($app) {
  $eventos = R::find('evento', 'ORDER BY fecha DESC');
  $imagenes = array();
  foreach ($eventos as $evento) {
    $imagen = R::findOne('album', 'evento_id = :eventoId', array(':eventoId' => $evento->id));
    if ($imagen) {
      array_push($imagenes, $imagen->imagen);
    } else {
      array_push($imagenes, "default");
    }
  }
  $data = array('eventos' => $eventos, 'imagenes' => $imagenes);
  $app->render('eventos.html.twig', $data);
});

// Album route
$app->get("/comunicacion/eventos/:id", function($id) use ($app) {
  $evento = R::load('evento', $id);
  $imagenes = R::find('album', 'evento_id = :eventoId', array(':eventoId' => $evento->id));
  $data = array('evento' => $evento, 'imagenes' => $imagenes);
  $app->render('album.html.twig', $data);
});

// Acciones route
$app->get("/comunicacion/acciones", function () use ($app) {
  $acciones = R::find('accion', 'ORDER BY fecha DESC');
  $data = array('acciones' => $acciones);
  $app->render('acciones_urgentes.html.twig', $data);
});

// Videos route
$app->get("/comunicacion/videos", function () use ($app) {
  $app->render('videos.html.twig');
});

// Publicaciones route
$app->get("/comunicacion/publicaciones", function () use ($app) {
  $publicaciones = R::find('publicacion');
  $data = array('publicaciones' => $publicaciones);
  $app->render('publicaciones.html.twig', $data);
});

// Deletes
// Articulo delete
$app->get("/comunicacion/comunicados/delete/:id", function ($id) use ($app) {
  $comunicado = R::load('comunicado', $id);
  R::trash($comunicado);
  $app->redirect('/comunicacion/comunicados');
});

// Acciones delete
$app->get('/comunicacion/acciones/delete/:id', function ($id) use ($app) {
  $accion = R::load('accion', $id);
  R::trash($accion);
  $app->redirect('/comunicacion/acciones');
});

// Album delete
$app->get('/comunicacion/eventos/:eventoId/delete/:id', function($eventoId, $id) use ($app) {
  $album = R::load('album', $id);
  R::trash($album);
  $app->redirect('/comunicacion/eventos/'.$eventoId);
});

// Evento delete
$app->get('/comunicacion/eventos/delete/:id', function ($id) use ($app) {
  $evento = R::load('evento', $id);
  R::trash($evento);
  $app->redirect('/comunicacion/eventos');
});

// Publicaciones delete
$app->get("/comunicacion/publicaciones/delete/:id", function ($id) use ($app) {
  $publicacion = R::load('publicacion', $id);
  R::trash($publicacion);
  $app->redirect('/comunicacion/publicaciones');
});

// Edits
// Articulo edit
$app->get('/comunicacion/comunicados/edit/:id', function ($id) use ($app) {
  $comunicado = R::load('comunicado', $id);
  $data = array('comunicado' => $comunicado);
  $app->render('articulo_edit.html.twig', $data);
});

// Acciones edit
$app->get('/comunicacion/acciones/edit/:id', function ($id) use ($app) {
  $accion = R::load('accion', $id);
  $data = array('accion' => $accion);
  $app->render('accion_edit.html.twig', $data);
});

// Evento edit
$app->get('/comunicacion/eventos/edit/:id', function ($id) use ($app) {
  $evento = R::load('evento', $id);
  $data = array('evento' => $evento);
  $app->render('evento_edit.html.twig', $data);
});

// Publicaciones edit
$app->get("/comunicacion/publicaciones/edit/:id", function ($id) use ($app) {
  $publicacion = R::load('publicacion', $id);
  $data = array('publicacion' => $publicacion);
  $app->render('publicacion_edit.html.twig', $data);
});


// POST
// News
// Arituclo new
$app->post("/comunicacion/comunicados/new", function() use ($app) {
  $post = (object)$app->request()->post();
  $comunicado = R::dispense("comunicado");

  $pieces = preg_split("/\r\n|\n|\r/", $post->texto);
  $newText = $pieces[0];
  for ($i = 1; $i < count($pieces); $i++) {
    $newText .= '^'.$pieces[$i];
  }

  $comunicado->titulo = $post->titulo;
  $date = str_replace(',', '', $post->fecha);
  $comunicado->fecha = date("Y-m-d", strtotime($date));
  $comunicado->texto = $newText;
  $comunicado->imagen = 'default.jpg';

  R::store($comunicado);
  if(isset($_FILES['image'])){
    $errors= array();
    $target_dir = "web/comunicados/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
    if(empty($errors)==true) {
      if(move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        rename ($target_file, $target_dir.$comunicado->id.'.'.$imageFileType);
        $comunicado->imagen = $comunicado->id.'.'.$imageFileType;
      }
    }
  }
  R::store($comunicado);

  for($key = 0; $key < count($_FILES["files"]["tmp_name"]); $key++) {
    $target_dir = "web/comunicados/imagenes/";
    $target_file = $target_dir . basename($_FILES["files"]["name"][$key]);
    $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
    $imagen = R::dispense("imagen");
    $imagen->comunicado_id = $comunicado->id;
    if(empty($errors)==true) {
      if(move_uploaded_file($_FILES["files"]["tmp_name"][$key], $target_file)) {
        rename ($target_file, $target_dir.$comunicado->id.'-'.$key.'.'.$imageFileType);
        $imagen->imagen = $comunicado->id.'-'.$key.'.'.$imageFileType;
        R::store($imagen);
      }
    }
  }

  $app->redirect('/comunicacion/comunicados/'.$comunicado->id);
});

// Acciones new
$app->post('/comunicacion/acciones/new', function () use ($app) {
  $post = (object)$app->request()->post();
  $accion = R::dispense("accion");
  $accion->titulo = $post->titulo;
  $date = str_replace(',', '', $post->fecha);
  $accion->fecha = date("Y-m-d", strtotime($date));
  $accion->texto = $post->texto;

  R::store($accion);
  $app->redirect('/comunicacion/acciones');
});

// ALbum new
$app->post('/comunicacion/eventos/:id/album/new', function ($id) use ($app) {
  $post = (object)$app->request()->post();

  for($key = 0; $key < count($_FILES["files"]["tmp_name"]); $key++) {
    $target_dir = "web/media/";
    $target_file = $target_dir . basename($_FILES["files"]["name"][$key]);
    $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
    if(empty($errors)==true) {
      if(move_uploaded_file($_FILES["files"]["tmp_name"][$key], $target_file)) {
        $album = R::dispense("album");
        $album->evento_id = $id;
        R::store($album);
        rename ($target_file, $target_dir.$id.'-'.$album->id.'.'.$imageFileType);
        $album->imagen = $id.'-'.$album->id.'.'.$imageFileType;
        R::store($album);
      }
    }
  }
  $app->redirect('/comunicacion/eventos/'.$id);
});

// Eventos new
$app->post('/comunicacion/eventos/new', function () use ($app) {
  $post = (object)$app->request()->post();
  $evento = R::dispense("evento");
  $evento->nombre = $post->nombre;
  $date = str_replace(',', '', $post->fecha);
  $evento->fecha = date("Y-m-d", strtotime($date));
  $evento->descripcion = $post->descripcion;

  R::store($evento);
  $app->redirect('/comunicacion/eventos');
});

// Publicaciones new
$app->post("/comunicacion/publicaciones/new", function() use ($app) {
  $post = (object)$app->request()->post();
  $publicacion = R::dispense("publicacion");

  $publicacion->titulo = $post->titulo;
  $publicacion->descripcion = $post->descripcion;
  $publicacion->ingles = '';
  $publicacion->espanol = '';
  $normalizeChars = array(
      'Š'=>'S', 'š'=>'s', 'Ð'=>'Dj','Ž'=>'Z', 'ž'=>'z', 'À'=>'A', 'Á'=>'A', 'Â'=>'A', 'Ã'=>'A', 'Ä'=>'A',
      'Å'=>'A', 'Æ'=>'A', 'Ç'=>'C', 'È'=>'E', 'É'=>'E', 'Ê'=>'E', 'Ë'=>'E', 'Ì'=>'I', 'Í'=>'I', 'Î'=>'I',
      'Ï'=>'I', 'Ñ'=>'N', 'Ń'=>'N', 'Ò'=>'O', 'Ó'=>'O', 'Ô'=>'O', 'Õ'=>'O', 'Ö'=>'O', 'Ø'=>'O', 'Ù'=>'U', 'Ú'=>'U',
      'Û'=>'U', 'Ü'=>'U', 'Ý'=>'Y', 'Þ'=>'B', 'ß'=>'Ss','à'=>'a', 'á'=>'a', 'â'=>'a', 'ã'=>'a', 'ä'=>'a',
      'å'=>'a', 'æ'=>'a', 'ç'=>'c', 'è'=>'e', 'é'=>'e', 'ê'=>'e', 'ë'=>'e', 'ì'=>'i', 'í'=>'i', 'î'=>'i',
      'ï'=>'i', 'ð'=>'o', 'ñ'=>'n', 'ń'=>'n', 'ò'=>'o', 'ó'=>'o', 'ô'=>'o', 'õ'=>'o', 'ö'=>'o', 'ø'=>'o', 'ù'=>'u',
      'ú'=>'u', 'û'=>'u', 'ü'=>'u', 'ý'=>'y', 'ý'=>'y', 'þ'=>'b', 'ÿ'=>'y', 'ƒ'=>'f',
      'ă'=>'a', 'î'=>'i', 'â'=>'a', 'ș'=>'s', 'ț'=>'t', 'Ă'=>'A', 'Î'=>'I', 'Â'=>'A', 'Ș'=>'S', 'Ț'=>'T',
  );
  if(isset($_FILES['ingles'])){
    $errors= array();
    $target_dir = "web/publicaciones/";
    $target_file = $target_dir . basename($_FILES["ingles"]["name"]);
    $fileType = pathinfo($target_file,PATHINFO_EXTENSION);
    if(empty($errors)==true){
      if(move_uploaded_file($_FILES["ingles"]["tmp_name"], $target_file)) {
        $titulo = strtr($publicacion->titulo, $normalizeChars);
        rename ($target_file, $target_dir.$titulo.'_ingles'.'.'.$fileType);
        $publicacion->ingles = $titulo.'_ingles'.'.'.$fileType;
      }
    }
  }
  if(isset($_FILES['espanol'])){
    $errors= array();
    $target_dir = "web/publicaciones/";
    $target_file = $target_dir . basename($_FILES["espanol"]["name"]);
    $fileType = pathinfo($target_file,PATHINFO_EXTENSION);
    if(empty($errors)==true){
      if(move_uploaded_file($_FILES["espanol"]["tmp_name"], $target_file)) {
        $titulo = strtr($publicacion->titulo, $normalizeChars);
        rename ($target_file, $target_dir.$titulo.'_espanol'.'.'.$fileType);
        $publicacion->espanol = $titulo.'_espanol'.'.'.$fileType;
      }
    }
  }

  R::store($publicacion);
  $app->redirect('/comunicacion/publicaciones');
});

// Edits
// Articulos edit
$app->post('/comunicacion/comunicados/edit/:id', function ($id) use ($app) {
  $comunicado = R::load('comunicado', $id);
  $post = (object)$app->request()->post();

  $pieces = preg_split("/\r\n|\n|\r/", $post->texto);
  $newText = $pieces[0];
  for ($i = 1; $i < count($pieces); $i++) {
    $newText .= '^'.$pieces[$i];
  }

  $comunicado->titulo = $post->titulo;
  $date = str_replace(',', '', $post->fecha);
  $comunicado->fecha = date("Y-m-d", strtotime($date));
  $comunicado->texto = $newText;

  if(isset($_FILES['image'])){
    $errors= array();
    $target_dir = "web/comunicados/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
    if(empty($errors)==true) {
      if(move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        rename ($target_file, $target_dir.$comunicado->id.'.'.$imageFileType);
        $comunicado->imagen = $comunicado->id.'.'.$imageFileType;
      }
    }
  }
  R::store($comunicado);

  for($key = 0; $key < count($_FILES["files"]["tmp_name"]); $key++) {
    $target_dir = "web/comunicados/imagenes/";
    $target_file = $target_dir . basename($_FILES["files"]["name"][$key]);
    $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
    $imagen = R::dispense("imagen");
    $imagen->comunicado_id = $comunicado->id;
    if(empty($errors)==true) {
      if(move_uploaded_file($_FILES["files"]["tmp_name"][$key], $target_file)) {
        rename ($target_file, $target_dir.$comunicado->id.'-'.$key.'.'.$imageFileType);
        $imagen->imagen = $comunicado->id.'-'.$key.'.'.$imageFileType;
        R::store($imagen);
      }
    }
  }

  $app->redirect('/comunicacion/comunicados/'.$comunicado->id);
});

// Acciones edit
$app->post('/comunicacion/acciones/edit/:id', function ($id) use ($app) {
  $accion = R::load('accion', $id);
  $post = (object)$app->request()->post();

  $accion->titulo = $post->titulo;
  $date = str_replace(',', '', $post->fecha);
  $accion->fecha = date("Y-m-d", strtotime($date));
  $accion->texto = $post->texto;

  R::store($accion);
  $app->redirect('/comunicacion/acciones');
});

// Eventos edit
$app->post('/comunicacion/eventos/edit/:id', function ($id) use ($app) {
  $evento = R::load('evento', $id);
  $post = (object)$app->request()->post();

  $evento->nombre = $post->nombre;
  $date = str_replace(',', '', $post->fecha);
  $evento->fecha = date("Y-m-d", strtotime($date));
  $evento->descripcion = $post->descripcion;

  R::store($evento);
  $app->redirect('/comunicacion/eventos');
});

// Publicaciones edit
$app->post("/comunicacion/publicaciones/edit/:id", function ($id) use ($app) {
  $publicacion = R::load('publicacion', $id);
  $post = (object)$app->request()->post();
  $normalizeChars = array(
      'Š'=>'S', 'š'=>'s', 'Ð'=>'Dj','Ž'=>'Z', 'ž'=>'z', 'À'=>'A', 'Á'=>'A', 'Â'=>'A', 'Ã'=>'A', 'Ä'=>'A',
      'Å'=>'A', 'Æ'=>'A', 'Ç'=>'C', 'È'=>'E', 'É'=>'E', 'Ê'=>'E', 'Ë'=>'E', 'Ì'=>'I', 'Í'=>'I', 'Î'=>'I',
      'Ï'=>'I', 'Ñ'=>'N', 'Ń'=>'N', 'Ò'=>'O', 'Ó'=>'O', 'Ô'=>'O', 'Õ'=>'O', 'Ö'=>'O', 'Ø'=>'O', 'Ù'=>'U', 'Ú'=>'U',
      'Û'=>'U', 'Ü'=>'U', 'Ý'=>'Y', 'Þ'=>'B', 'ß'=>'Ss','à'=>'a', 'á'=>'a', 'â'=>'a', 'ã'=>'a', 'ä'=>'a',
      'å'=>'a', 'æ'=>'a', 'ç'=>'c', 'è'=>'e', 'é'=>'e', 'ê'=>'e', 'ë'=>'e', 'ì'=>'i', 'í'=>'i', 'î'=>'i',
      'ï'=>'i', 'ð'=>'o', 'ñ'=>'n', 'ń'=>'n', 'ò'=>'o', 'ó'=>'o', 'ô'=>'o', 'õ'=>'o', 'ö'=>'o', 'ø'=>'o', 'ù'=>'u',
      'ú'=>'u', 'û'=>'u', 'ü'=>'u', 'ý'=>'y', 'ý'=>'y', 'þ'=>'b', 'ÿ'=>'y', 'ƒ'=>'f',
      'ă'=>'a', 'î'=>'i', 'â'=>'a', 'ș'=>'s', 'ț'=>'t', 'Ă'=>'A', 'Î'=>'I', 'Â'=>'A', 'Ș'=>'S', 'Ț'=>'T',
  );
  $publicacion->titulo = $post->titulo;
  $publicacion->descripcion = $post->descripcion;

  if(isset($_FILES['ingles'])){
    $errors= array();
    $target_dir = "web/publicaciones/";
    $target_file = $target_dir . basename($_FILES["ingles"]["name"]);
    $fileType = pathinfo($target_file,PATHINFO_EXTENSION);
    if(empty($errors)==true){
      if(move_uploaded_file($_FILES["ingles"]["tmp_name"], $target_file)) {
        $titulo = strtr($publicacion->titulo, $normalizeChars);
        rename ($target_file, $target_dir.$titulo.'_ingles'.'.'.$fileType);
        $publicacion->ingles = $titulo.'_ingles'.'.'.$fileType;
      }
    }
  }
  if(isset($_FILES['espanol'])){
    $errors= array();
    $target_dir = "web/publicaciones/";
    $target_file = $target_dir . basename($_FILES["espanol"]["name"]);
    $fileType = pathinfo($target_file,PATHINFO_EXTENSION);
    if(empty($errors)==true){
      if(move_uploaded_file($_FILES["espanol"]["tmp_name"], $target_file)) {
        $titulo = strtr($publicacion->titulo, $normalizeChars);
        rename ($target_file, $target_dir.$titulo.'_espanol'.'.'.$fileType);
        $publicacion->espanol = $titulo.'_espanol'.'.'.$fileType;
      }
    }
  }

  R::store($publicacion);
  $app->redirect('/comunicacion/publicaciones');
});

?>
