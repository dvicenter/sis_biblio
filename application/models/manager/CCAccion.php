<?php
class CCAccion extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/CCAccion');
	}

	function listar() 
	{	
		$this->data['Accion']=$this->CDAccion->listar();
		echo $this->load->view("module/manager/accion/accion_user",$this->data);
	}

	function insertar($accion) 
	{	
		$this->data=array($this->CDAccion->insertar($accion));
		//echo $this->load->view("module/manager/accion/accion_user",$this->data);
		echo json_encode($this->data);
	}
} 
?>
