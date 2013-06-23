<?php
class CCRol extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/CDRol');
	}

	function listar() 
	{	
		$this->data['roles']=$this->CDRol->listar();
		echo $this->load->view("module/manager/rol/rol_user",$this->data);
	}

	function insertar($rol,$descripcion) 
	{	
		$this->data=array($this->CDRol->insertar($rol,$descripcion));
		//echo $this->load->view("module/manager/rol/rol_user",$this->data);
		echo json_encode($this->data);
	}
} 
?>