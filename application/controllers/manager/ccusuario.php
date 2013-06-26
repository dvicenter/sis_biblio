<?php
class Ccusuario extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/cdusuario');
	}

	function listar() 
	{	
		$this->data['usuario']=$this->cdusuario->listar();
		echo $this->load->view("module/manager/user/manager_user",$this->data);
	}

	function insertar($id_usuario,$usuario,$contrasenia,$id_sujeto,$active) 
	{	
		$this->data=array($this->cdusuario->insertar($id_usuario,$usuario,$contrasenia,$id_sujeto,$active));
		//echo $this->load->view("module/manager/accion/accion_user",$this->data);
		echo json_encode($this->data);
	}
} 
?>
