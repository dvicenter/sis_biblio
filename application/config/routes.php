<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
$route['default_controller'] = "CCPanel";
$route['404_override'] = '';
$route['module/([a-zA-Z_-]+)/([a-zA-Z_-]+)']='CCPanel/ubication_module/$1/$2';
$route['module/([a-zA-Z_-]+)']='CCPanel/control_panel/$1';
//$route['module/([a-zA-Z_-]+)']='CCPanel/control_panel/$1';
/* End of file routes.php */
/* Location: ./application/config/routes.php */