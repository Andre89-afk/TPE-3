<?php

class ModeloBolso {
    private $db;

    public function __construct() {
       $this->db = new PDO('mysql:host=localhost;dbname=comple2;charset=utf8', 'root', '');
    }
 
    public function ObtenerBolsos($orderBy = false) {
        $sql = 'SELECT * FROM bolsos';
        if($orderBy) {
            switch($orderBy) {
                case 'nombre':
                    $sql .= ' ORDER BY Nombre';
                    break;
                case 'color':
                    $sql .= ' ORDER BY Color';
                    break;
            }
        }
        $query = $this->db->prepare($sql);
        $query->execute();
    
        $bolsos = $query->fetchAll(PDO::FETCH_OBJ); 
    
        return $bolsos;
    }
 
    public function ObtenerBolso($id) {    
        $query = $this->db->prepare('SELECT * FROM bolsos WHERE id_bolso = ?');
        $query->execute([$id]);   
        $bolso = $query->fetch(PDO::FETCH_OBJ);
        return $bolso;
    }
 
    public function InsertarBolso($nombre, $color, $precio, $categoria) { 
        $query = $this->db->prepare('INSERT INTO bolsos(Nombre, color, precio, id_categoria) VALUES (?, ?, ?, ?)');
        $query->execute([$nombre, $color, $precio, $categoria]);
        $id = $this->db->lastInsertId();
        return $id;
    }

}
