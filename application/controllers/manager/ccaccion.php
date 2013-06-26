<?php
class Ccaccion extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/cdaccion');
	}

	function listar() 
	{	
		$this->data['acciones']=$this->cdaccion->listar();
		echo $this->load->view("module/manager/accion/accion_user",$this->data);
	}

	function insertar($accion) 
	{	
		$this->data=array($this->cdaccion->insertar($accion));
		//echo $this->load->view("module/manager/accion/accion_user",$this->data);
		echo json_encode($this->data);
	}
} 
?>