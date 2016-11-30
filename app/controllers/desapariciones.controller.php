<?php

// Desapariciones Controller

// GET
// Route desaparecidos
$app->get("/desaparecidos", function () use ($app) {
  $desaparecidos = R::find('desaparecido', 'ORDER BY fecha DESC');
  $data = array('desaparecidos' => $desaparecidos);
  $app->render('desaparecidos.html.twig', $data);
});

// Route amores
$app->get("/amores", function () use ($app) {
  $app->render('amores.html.twig');
});

// Delete desaparecido
$app->get('/desaparecidos/delete/:id', function ($id) use ($app) {
  $desaparecido = R::load('desaparecido', $id);
  R::trash($desaparecido);
  $app->redirect('/desaparecidos');
});

// Edit desaparecido
$app->get('/desaparecidos/edit/:id', function ($id) use ($app) {
  $desaparecido = R::load('desaparecido', $id);
  $data = array('desaparecido' => $desaparecido);
  $app->render('desaparecidos_edit.html.twig', $data);
});

// POST
// New desaparecido
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

// Edit desaparecido
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

?>
