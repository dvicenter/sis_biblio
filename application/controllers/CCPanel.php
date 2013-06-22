<?php
class CCPanel extends CI_Controller
{
	public function index()
	{
		$this->load->helper('url');
		$this->load->view('v_panel');
	}
	function ubication_module($path,$file)
	{	
		switch ($path)
		{
			case 'tesis':$this->ubication='module/oficina_biblioteca_central/'.$path.'/'.$file;  
				break;
			case 'constancia':$this->ubication='module/oficina_biblioteca_central/'.$path.'/'.$file;  
				break;
			case 'role_assignment':$this->ubication='module/manager/'.$path.'/'.$file;
				break;  
			case 'manager':$this->ubication='module/manager/user/'.$file;  
				break;
			case 'user':$this->ubication='module/'.$path.'/'.$file;  
				break;
			case 'role_assignment_component':$this->ubication='module/manager/'.$path.'/'.$file;
				break;  
			case 'role_component_action':$this->ubication='module/manager/'.$path.'/'.$file;
				break;  
		}
		$this->load->view($this->ubication);
	}
	public function load_panel()
	{	echo 'hola';
		$this->load->helper('url');
		$this->load->view('v_panel');
	}
} 
?>
