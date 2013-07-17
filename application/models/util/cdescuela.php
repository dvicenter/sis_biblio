<?php
class Cdescuela extends CI_Model{
	public function __construct()
	{	parent::__construct();
		$this->load->database();
	}
	function cargar_escuela($idFacultad)
	{	$query =$this->db->select('tbl.id_escuela AS id_escuela, tbl.escuela AS escuela');
		$this->db->where('tbl.id_facultad',$idFacultad);
		$query =$this->db->get('tbl_escuela tbl');
		return $query->result_array();
	}
}