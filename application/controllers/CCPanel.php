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
			case 'tesis':$ubication='module/'.$path.'/'.$file;$this->ubication='module/'.$path.'/'.$file;  
				break;
		}
		$this->load->view($this->ubication);
	}
} 
?>
