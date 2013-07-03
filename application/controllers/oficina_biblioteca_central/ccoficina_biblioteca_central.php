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
	function informe_practica()
	{	$id_alumno=$_REQUEST['id_alumno'];
		$data=$this->cdoficina_biblioteca_central->informe_practica($id_alumno);
		echo json_encode($data);
	}
	function buscarXAsesor()
	{	$id_docente=$_REQUEST['id_docente'];
		$this->data['consults_asesor']=$this->cdoficina_biblioteca_central->buscarXAsesor($id_docente);
		echo $this->load->view('module/oficina_biblioteca_central/constancia/consult_asesor',$this->data);
	}
	function aprobacion_constancia()
	{	$id_plan_tesis=$_REQUEST['id_plan_tesis'];
		$aprobacion=$_REQUEST['aprobacion'];
		$this->cdoficina_biblioteca_central->aprobacion_constancia($id_plan_tesis,$aprobacion);
	}
}