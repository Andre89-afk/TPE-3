<?php

require_once 'libs/request.php';

class Route {
    private $url;
    private $verb;
    private $controller;
    private $method;
    private $params;

    public function __construct($url, $verb, $controller, $method){
        $this->url = $url;
        $this->verb = $verb;
        $this->controller = $controller;
        $this->method = $method;
        $this->params = [];
    }
    public function match($url, $verb) {
        if($this->verb != $verb){
            return false;
        }
        $partsURL = explode("/", trim($url,'/'));
        $partsRoute = explode("/", trim($this->url,'/'));
        if(count($partsRoute) != count($partsURL)){
            return false;
        }
        foreach ($partsRoute as $key => $part) {
            if($part[0] != ":"){
                if($part != $partsURL[$key])
                return false;
            }
            else
            $this->params[''.substr($part,1)] = $partsURL[$key];
        }
        return true;
    }
    public function run($request){
        $controller = $this->controller;  
        $method = $this->method;
        $request->params = (object) $this->params;
       
        (new $controller())->$method($request);
    }
}

class Router {
    private $routeTable = [];
    private $defaultRoute;
    private $request;


    public function __construct() {
        $this->defaultRoute;
        $this->request = new Request();
    }

    public function route($url, $verb) {
        //$ruta->url //no compila!
        foreach ($this->routeTable as $route) {
            if($route->match($url, $verb)){
                $route->run($this->request);
                return;
            }
        }
        if ($this->defaultRoute != null)
            $this->defaultRoute->run($this->request);
    }
    
    public function addRoute ($url, $verb, $controller, $method) {
        $this->routeTable[] = new Route($url, $verb, $controller, $method);
    }

    public function setDefaultRoute($controller, $method) {
        $this->defaultRoute = new Route("", "", $controller, $method);
    }
}