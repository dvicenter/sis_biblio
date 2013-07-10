<?php
class Ccpermiso extends CI_Controller{
	public function __construct()
	{	parent::__construct();
		$this->load->helper('url');
		$this->load->model('util/Cdpermiso');
	}
	function habilitar_permiso()
	{	$DATA=$this->Cdpermiso->habilitar_permiso();
		echo json_encode($DATA);
	}
}