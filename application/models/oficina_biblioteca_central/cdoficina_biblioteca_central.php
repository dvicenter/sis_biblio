<?php
class Cdoficina_biblioteca_central extends CI_Model{
	public function __construct() 
	    {	parent::__construct();
	        $this->load->database();
		}
	function listar()
	{	$query="CALL SPRCNSPlanTesis(1,0)";
		$query = $this->db->query($query);
		return $query->result_array();
	}
	function buscar_plan_tesis($id_plan_tesis)
	{	$query="CALL SPRCNSPlanTesis(2,'$id_plan_tesis')";
		$query = $this->db->query($query);
		return $query->result_array();
	}
}