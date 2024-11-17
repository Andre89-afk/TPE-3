<?php

require_once 'app/modelo/modelo.php';
require_once 'app/vista/vista.php';

class BolsoApiController {
    private $model;
    private $view;

    public function __construct() {
        $this->model = new ModeloBolso();
        $this->view = new JSONView();
    }


    public function ObtenerTodos($req) {
        $orderBy = false;
        $filter = false;

        if(isset($req->query->orderBy)) {
            $orderBy = $req->query->orderBy;
        }

        if(isset($req->query->filterBy)) {
            $filter = $req->query->filterBy; 
        }

        $bolsos = $this->model->ObtenerBolsos($orderBy, $filter);
        
        return $this->view->response($bolsos);
    }

    public function ObtenerBolso($req) {
        $id = $req->params->id;
        $bolso = $this->model->ObtenerBolso($id);

        if (!$bolso) {
            return $this->view->response('Bolso no encontrado', 404);
        }
        return $this->view->response($bolso, 200);
    }

    public function CrearBolso($req) {
        if (empty($req->body->Nombre) || empty($req->body->Color) || empty($req->body->Precio) || empty($req->body->id_categoria)) {
            return $this->view->response('Faltan completar datos', 400);
        }

        $nombre = $req->body->Nombre;       
        $color = $req->body->Color;       
        $precio = $req->body->Precio;
        $categoria = $req->body->id_categoria;

        $id = $this->model->InsertarBolso($nombre, $color, $precio, $categoria);

        if (!$id) {
            return $this->view->response("Error al insertar un bolso", 500);
        }

        $bolso = $this->model->ObtenerBolso($id);
        return $this->view->response($bolso, 201);
    }
}