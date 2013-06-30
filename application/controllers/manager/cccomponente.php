<?php
class Cccomponente extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/cdcomponente');
	}

	function listar() 
	{	
		$this->data['componentes']=$this->cdcomponente->listar();
		echo $this->load->view("module/manager/componente/componente_user",$this->data);
	}

	function insertar() 
	{	$componente=$_REQUEST['componente'];
		$descripcion_componente=$_REQUEST['descripcion_componente'];
		$this->data=array($this->cdcomponente->insertar($componente,$descripcion_componente));
		echo json_encode($this->data);
	}
	
	function modificar() 
	{	$id_componente=$_REQUEST['id_componente'];
		$componente=$_REQUEST['componente'];
		$descripcion_componente=$_REQUEST['descripcion_componente'];
		$this->data=array($this->cdcomponente->modificar($id_componente,$componente,$descripcion_componente));
		echo json_encode($this->data);
	}

	function eliminar($id_componente) 
	{	
		$this->cdcomponente->eliminar($id_componente);
		
	}
} 
?>
