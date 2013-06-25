<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
$route['default_controller'] = "cclogin";
$route['404_override'] = '';
$route['module/([a-zA-Z_-]+)/([a-zA-Z_-]+)']='ccpanel/ubication_module/$1/$2';
$route['module/([a-zA-Z_-]+)']='ccpanel/control_panel/$1';
$route['acceder/sistema']='cclogin/index';
$route['cerrar_sesion']='cclogin/cerrar_sesion';
/* End of file routes.php */
/* Location: ./application/config/routes.php */