<?php
class Ccoficina_biblioteca_central extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->helper('url');
		$this->load->model('oficina_biblioteca_central/cdoficina_biblioteca_central');
	}
	function listar(){
		$this->data['planes_tesis']=$this->cdoficina_biblioteca_central->listar();
		echo $this->load->view("module/oficina_biblioteca_central/constancia/manager_constancia",$this->data);
	}
	function buscar_plan_tesis()
	{	$id_plan_tesis=$_REQUEST['id_plan_tesis'];
		$data=$this->cdoficina_biblioteca_central->buscar_plan_tesis($id_plan_tesis);
		echo json_encode($data);
	}
}