<?php
class Ccrequestrecord extends CI_Controller{
	public function __construct() 
    {	parent::__construct();
		$this->load->helper('url');
		$this->load->model('user/Cdrequestrecord');
	}
	function buscar_asesor()
	{	$data=$this->Cdrequestrecord->buscar_asesor();
		echo json_encode($data);
	}
	function insertar_solitud()
	{	
	}
}