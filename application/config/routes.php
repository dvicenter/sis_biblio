<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
$route['default_controller'] = "CCLogin";
$route['404_override'] = '';
$route['module/([a-zA-Z_-]+)/([a-zA-Z_-]+)']='CCPanel/ubication_module/$1/$2';
$route['module/([a-zA-Z_-]+)']='CCPanel/control_panel/$1';
$route['acceder/sistema']='CCLogin/index';
$route['cerrar_sesion']='CCLogin/cerrar_sesion';
/* End of file routes.php */
/* Location: ./application/config/routes.php */