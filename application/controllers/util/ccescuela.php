<?php 
class Ccescuela extends CI_Controller{
	public function __construct()
	{	parent::__construct();
		$this->load->helper('url');
		$this->load->model('util/Cdescuela');
	}
	function cargar_escuela()
	{	$idFacultad=$_REQUEST['idFacultad'];
		$this->DATA['escuelas']=$this->Cdescuela->cargar_escuela($idFacultad);
		echo $this->load->view('util/combo_escuela',$this->DATA);
	}
}