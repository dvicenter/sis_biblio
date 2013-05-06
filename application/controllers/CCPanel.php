<?php
class CCPanel extends CI_Controller
{
	public function index()
	{
		$this->load->helper('url');
		$this->load->view('v_panel');
	} 
} 
?>
