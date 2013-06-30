<?php
class Ccaccion extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/cd_accion');
	}

	function listar() 
	{	$this->data['acciones']=$this->cd_accion->listar();
		echo $this->load->view("module/manager/accion/accion_user",$this->data);
	}

	function insertar() 
	{	
		$accion=$_REQUEST['accion'];
		$this->data=array($this->cd_accion->insertar($accion));
		echo json_encode($this->data);
	}
	function modificar() 
	{	
		$id_accion=$_REQUEST['id_accion'];
		$accion=$_REQUEST['accion'];
		$this->data=array($this->cd_accion->modificar($id_accion,$accion));
		echo json_encode($this->data);
	}

	function eliminar($id_accion) 
	{	
		$this->cd_accion->eliminar($id_accion);
	}
} 
?>
