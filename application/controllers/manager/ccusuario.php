<?php
class Ccusuario extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/cdusuario');
	}

	function buscar_sujeto()
	{	$data=$this->cdusuario->buscar_sujeto();
		echo json_encode($data);
	}
	function listar() 
	{	
		$this->data['usuario']=$this->cdusuario->listar();
		echo $this->load->view("module/manager/user/manager_user",$this->data);
	}

	function insertar() 
	{	$usuario=$_REQUEST['usuario'];
		$contrasenia=$_REQUEST['contrasenia'];
		$id_sujeto=$_REQUEST['id_sujeto'];
		$active=$_REQUEST['active'];
		$this->data=array($this->cdusuario->insertar($usuario,$contrasenia,$id_sujeto,$active));
		//echo $this->load->view("module/manager/accion/accion_user",$this->data);
		echo json_encode($this->data);
	}
	function modificar()
	{	$id_usuario=$_REQUEST['id_usuario'];
		$usuario=$_REQUEST['usuario'];
		$contrasenia=$_REQUEST['contrasenia'];
		$active=$_REQUEST['active'];
		$this->cdusuario->modificar($id_usuario,$usuario,$contrasenia,$active);
	}
	function eliminar($id_usuario){
		$this->cdusuario->eliminar($id_usuario);
	}
} 
?>
