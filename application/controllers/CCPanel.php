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
		}
		$this->load->view($this->ubication);
	}
} 
?>
