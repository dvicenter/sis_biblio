<?php
class Ccfacultad extends CI_Controller{
	public function __construct()
	{	parent::__construct();
		$this->load->helper('url');
		$this->load->model('user/Cdfacultad');
	}
	function cargar_facultad()
	{	$this->DATA['facultades']=$this->Cdfacultad->cargar_facultad();
		echo $this->load->view('util/combo_facultad',$this->DATA);
	}
}