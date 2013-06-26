<?php
class Cdfacultad extends CI_Model{
	public function __construct()
	{	parent::__construct();
		$this->load->database();
	}
	function cargar_facultad()
	{	$query = "CALL SPRCNSFacultad()";
		$query=$this->db->query($query);
		return $query->result_array();
	}
}