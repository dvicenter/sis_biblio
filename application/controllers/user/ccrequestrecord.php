<?php
class Ccrequestrecord extends CI_Controller{
	public function __construct() 
    {	parent::__construct();
		$this->load->helper('url');
		$this->load->model('user/Cdrequestrecord');
	}
	function buscar_asesor()
	{	$data=$this->Cdrequestrecord->buscar_asesor();
		echo json_encode($data);
	}
	function insertar_solitud()
	{	
		$titulo=$_REQUEST['titulo'];
		$voucher=$_REQUEST['voucher'];
		$correo=$_REQUEST['correo'];
		$introduccion=$_REQUEST['introduccion'];
		$objetivo=$_REQUEST['objetivo'];
		$resumen=$_REQUEST['resumen'];
		$conclusion=$_REQUEST['conclusion'];
		$id_docente=$_REQUEST['id_docente'];
		$id_sujeto1=$_REQUEST['id_sujeto1'];
		$id_sujeto2=$_REQUEST['id_sujeto2'];
		$pIns=$_REQUEST['pIns'];
		$this->Cdrequestrecord->insertar_solicitud($titulo,$introduccion,$objetivo,$resumen,$conclusion,$correo,$id_docente,$id_sujeto1,$id_sujeto2,$pIns);
	}
}