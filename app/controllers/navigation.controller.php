<?php

//static_pages
$app->get("/sobre_nosotros/acerca", function () use ($app) {
  $app->render('acerca_nosotros.html.twig');
});

$app->get("/sobre_nosotros/derechos_humanos", function () use ($app) {
  $app->render('derechos_humanos.html.twig');
});

$app->get("/sobre_nosotros/contacto", function () use ($app) {
  $app->render('ubicacion_contacto.html.twig');
});

// acciones urgentes
$app->get("/comunicacion/acciones", function () use ($app) {
  $acciones = R::find('accion', 'ORDER BY fecha DESC');
  $data = array('acciones' => $acciones);
  $app->render('acciones_urgentes.html.twig', $data);
});

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

$app->get('/comunicacion/acciones/delete/:id', function ($id) use ($app) {
  $accion = R::load('accion', $id);
  R::trash($accion);
  $app->redirect('/comunicacion/acciones');
});

$app->get('/comunicacion/acciones/edit/:id', function ($id) use ($app) {
  $accion = R::load('accion', $id);
  $data = array('accion' => $accion);
  $app->render('accion_edit.html.twig', $data);
});

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

// comunicados
$app->get("/comunicacion/comunicados", function () use ($app) {
  $comunicados = R::find('comunicado', 'ORDER BY fecha DESC');
  $data = array('comunicados' => $comunicados);
  $app->render('comunicados.html.twig', $data);
});

$app->get('/comunicacion/comunicados/:id', function ($id) use ($app) {
  $comunicado = R::load('comunicado', $id);
  $imagenes = R::find('imagen', 'comunicado_id = :comunicadoId', array(':comunicadoId' => $comunicado->id));
  $data = array('comunicado' => $comunicado, 'imagenes' => $imagenes);
  $app->render('articulo.html.twig', $data);
});

$app->get('/comunicacion/comunicados/edit/:id', function ($id) use ($app) {
  $comunicado = R::load('comunicado', $id);
  $data = array('comunicado' => $comunicado);
  $app->render('articulo_edit.html.twig', $data);
});

$app->post("/comunicacion/comunicados/new", function() use ($app) {
  $post = (object)$app->request()->post();
  $comunicado = R::dispense("comunicado");

  $pieces = preg_split("/\r\n|\n|\r/", $post->texto);
  $newText = $pieces[0];
  for ($i = 1; $i < count($pieces); $i++) {
    $newText .= '^'.$pieces[$i];
  }
  // // print_r($post);
  // print_r($_FILES['image']);
  //   print_r($_FILES['image']['error']);
  // print_r($_FILES['files']);
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

$app->get("/comunicacion/comunicados/delete/:id", function ($id) use ($app) {
  $comunicado = R::load('comunicado', $id);
  R::trash($comunicado);
  $app->redirect('/comunicacion/comunicados');
});

$app->get("/comunicacion/publicaciones", function () use ($app) {
  $publicaciones = R::find('publicacion');
  $data = array('publicaciones' => $publicaciones);
  $app->render('publicaciones.html.twig', $data);
});

$app->post("/comunicacion/publicaciones/new", function() use ($app) {
  $post = (object)$app->request()->post();
  $publicacion = R::dispense("publicacion");

  $publicacion->titulo = $post->titulo;
  $publicacion->descripcion = $post->descripcion;
  $publicacion->ingles = '';
  $publicacion->espanol = '';

  if(isset($_FILES['ingles'])){
    $errors= array();
    $target_dir = "web/publicaciones/";
    $target_file = $target_dir . basename($_FILES["ingles"]["name"]);
    $fileType = pathinfo($target_file,PATHINFO_EXTENSION);
    if(empty($errors)==true){
      if(move_uploaded_file($_FILES["ingles"]["tmp_name"], $target_file)) {
        rename ($target_file, $target_dir.$publicacion->titulo.'_ingles'.'.'.$fileType);
        $publicacion->ingles = $publicacion->titulo.'_ingles'.'.'.$fileType;
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
        rename ($target_file, $target_dir.$publicacion->titulo.'_espanol'.'.'.$fileType);
        $publicacion->espanol = $publicacion->titulo.'_espanol'.'.'.$fileType;
      }
    }
  }

  R::store($publicacion);
  $app->redirect('/comunicacion/publicaciones');
});

$app->get("/comunicacion/publicaciones/delete/:id", function ($id) use ($app) {
  $publicacion = R::load('publicacion', $id);
  R::trash($publicacion);
  $app->redirect('/comunicacion/publicaciones');
});

$app->get("/desaparecidos", function () use ($app) {
  $desaparecidos = R::find('desaparecido', 'ORDER BY fecha DESC');
  $data = array('desaparecidos' => $desaparecidos);
  $app->render('desaparecidos.html.twig', $data);
});

$app->get('/desaparecidos/delete/:id', function ($id) use ($app) {
  $desaparecido = R::load('desaparecido', $id);
  R::trash($desaparecido);
  $app->redirect('/desaparecidos');
});

$app->get('/desaparecidos/edit/:id', function ($id) use ($app) {
  $desaparecido = R::load('desaparecido', $id);
  $data = array('desaparecido' => $desaparecido);
  $app->render('desaparecidos_edit.html.twig', $data);
});

$app->post('/desaparecidos/edit/:id', function ($id) use ($app) {
  $desaparecido = R::load('desaparecido', $id);
  $post = (object)$app->request()->post();
  $desaparecido->nombre = $post->nombre;
  $desaparecido->lugar = $post->lugar;
  $desaparecido->descripcion = $post->descripcion;
  $desaparecido->estado_civil = $post->estado_civil;
  $desaparecido->ocupacion = $post->ocupacion;
  if($post->edad)
    $desaparecido->edad = $post->edad;
  if($post->talla)
    $desaparecido->talla = $post->talla;
  $desaparecido->tez = $post->tez;
  $desaparecido->ojos = $post->ojos;
  $desaparecido->otras_senias = $post->otras_senias;
  $date = str_replace(',', '', $post->fecha);
  $desaparecido->fecha = date("Y-m-d", strtotime($date));

  if(isset($_FILES['image'])){
    $errors= array();
    $target_dir = "web/desaparecidos/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
    if($file_size > 2097152){
       $errors[]='File size must be less than 2 MB';
		}
    if(empty($errors)==true){
      if(move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        rename ($target_file, $target_dir.$desaparecido->id.'.'.$imageFileType);
        $desaparecido->imagen = $desaparecido->id.'.'.$imageFileType;
      }
    }
  }
  R::store($desaparecido);

  $app->redirect('/desaparecidos');
});

$app->post("/desaparecidos/new", function () use ($app) {
  $post = (object)$app->request()->post();
  $desaparecido = R::dispense("desaparecido");

  $id = $desaparecido->id;
  $desaparecido->nombre = $post->nombre;
  $desaparecido->imagen = "avatar.jpg";
  $desaparecido->lugar = $post->lugar;
  $desaparecido->descripcion = $post->descripcion;
  $desaparecido->estado_civil = $post->estado_civil;
  $desaparecido->ocupacion = $post->ocupacion;
  if($post->edad)
    $desaparecido->edad = $post->edad;
  if($post->talla)
    $desaparecido->talla = $post->talla;
  $desaparecido->tez = $post->tez;
  $desaparecido->ojos = $post->ojos;
  $desaparecido->otras_senias = $post->otras_senias;
  $date = str_replace(',', '', $post->fecha);
  $desaparecido->fecha = date("Y-m-d", strtotime($date));

  R::store($desaparecido);
  if(isset($_FILES['image'])){
    $errors= array();
    $target_dir = "web/desaparecidos/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
    if($file_size > 2097152){
       $errors[]='File size must be less than 2 MB';
		}
    if(empty($errors)==true){
      if(move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        rename ($target_file, $target_dir.$desaparecido->id.'.'.$imageFileType);
        $desaparecido->imagen = $desaparecido->id.'.'.$imageFileType;
      }
    }
  }
  R::store($desaparecido);

  $app->redirect('/desaparecidos');
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
