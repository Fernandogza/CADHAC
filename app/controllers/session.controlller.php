<?php

//GET routes

// Lougout route
$app->get("/logout", function () use ($app) {
  $env = $app->environment();
  unset($_SESSION['user']);
  $app->view()->setData('user', null);
  $app->redirect("/login");
});

// Login route
$app->get("/login", function () use ($app) {

  if(isset($_SESSION['user'])){
    $app->redirect("/");
  }
  $env = $app->environment();

  $flash = $app->view()->getData('flash');

  $error = '';
  if (isset($flash['danger'])) {
     $error = $flash['danger'];
  }

  $urlRedirect = $env['rootUri'];

  if ($app->request()->get('r') && $app->request()->get('r') != '/logout' && $app->request()->get('r') != '/login') {
     $_SESSION['urlRedirect'] = $app->request()->get('r');
  }

  if (isset($_SESSION['urlRedirect'])) {
     $urlRedirect = $_SESSION['urlRedirect'];
  }

  $email_value = $email_error = $password_error = '';

  if (isset($flash['email'])) {
    $email_value = $flash['email'];
  }

  if (isset($flash['errors']['email'])) {
     $email_error = $flash['errors']['email'];
  }

  if (isset($flash['errors']['password'])) {
     $password_error = $flash['errors']['password'];
  }

  $app->render('login_admin.html.twig',
    array(
      'error' => $error,
      'email_value' => $email_value,
      'email_error' => $email_error,
      'password_error' => $password_error,
      'urlRedirect' => $urlRedirect
    )
  );
});



//POST routes

// Login route
$app->post("/admin/login", function () use ($app) {
  $env = $app->environment();
  $post = (object)$app->request()->post();
  $user    =   $post->username;
  $password   = md5($post->password);

  $errors = array();

  /*
  * Logica de login
  */
  if ($user != "CADHAC") {
    $errors['password'] = "Email o password incorrecto.";
  }

  if (count($errors) > 0) {
      $app->flash('errors', $errors);
      $app->redirect('/login');
  }

  $_SESSION['user'] = $user;
  $_SESSION['role'] = "admin";

  if (isset($_SESSION['urlRedirect'])) {
       $tmp = $_SESSION['urlRedirect'];
       unset($_SESSION['urlRedirect']);
       $app->redirect($env['rootUri'].substr($tmp,1));
  }

  $app->redirect('/');
});

?>
