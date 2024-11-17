<?php
    
require_once 'libs/router.php';
require_once 'app/controlador/controlador.php';  

$router = new Router();
              
$router->addRoute('bolsos'      ,   'GET',     'BolsoApiController',   'ObtenerTodos');
$router->addRoute('bolsos/:id'  ,   'GET',     'BolsoApiController',   'ObtenerBolso');
$router->addRoute('bolsos'  ,       'POST',    'BolsoApiController',   'CrearBolso');
 
$router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);