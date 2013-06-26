<?php
class Cdrequestrecord extends CI_Model{
	public function __construct(){
		parent::__construct();
		$this->load->database();
	}
	function buscar_asesor()
	{	$query = "CALL SPRCNSAsesor()";
		$query = $this->db->query($query);
		return $query->result_array();
	}
}