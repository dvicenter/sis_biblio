<?php
class Cdescuela extends CI_Model{
	public function __construct()
	{	parent::__construct();
		$this->load->database();
	}
	function cargar_escuela()
	{	$query = "CALL SPRCNSEscuela()";
		$query=$this->db->query($query);
		return $query->result_array();
	}
}