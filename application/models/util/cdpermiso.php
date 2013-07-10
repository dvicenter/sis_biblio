<?php
class Cdpermiso extends CI_Model{
	public function __construct()
	{	parent::__construct();
		$this->load->database();
	}
	function habilitar_permiso()
	{	$query = "CALL SPRCNPermiso()";
		$query=$this->db->query($query);
		return $query->result_array();
	}
}