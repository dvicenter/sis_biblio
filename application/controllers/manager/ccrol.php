<?php
class Ccrol extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/cdrol');
	}

	function listar() 
	{	
		$this->data['roles']=$this->cdrol->listar();
		echo $this->load->view("module/manager/rol/rol_user",$this->data);
	}

	function insertar($rol,$descripcion) 
	{	
		$this->data=array($this->cdrol->insertar($rol,$descripcion));
		echo json_encode($this->data);
	}

	function modificar($id_rol,$rol,$descripcion) 
	{	
		$this->data=array($this->cdrol->modificar($id_rol,$rol,$descripcion));
		echo json_encode($this->data);
	}

	function eliminar($id_rol) 
	{	
		$this->data=array($this->cdrol->eliminar($rol,$descripcion));
		echo json_encode($this->data);
	}
} 
?>
