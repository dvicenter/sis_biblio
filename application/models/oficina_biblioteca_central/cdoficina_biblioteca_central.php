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
	function informe_practica($id_alumno){
		$query="CALL SPRCNSInformePractica(1,3,'$id_alumno')";
		$query = $this->db->query($query);
		return $query->result_array();
	}
	function buscarXAsesor($id_docente)
	{	$query="CALL SPRCNSMaterialBibliograficoXAsesor(".$id_docente.")";
		$query = $this->db->query($query);
		return $query->result_array();
	}
	function aprobacion_constancia($id_plan_tesis,$aprobacion)
	{	$query="CALL SPRAPREstadoPlanTesis(".$id_plan_tesis.','.$aprobacion.")";
		if($this->db->query($query))
		{	return true;
		}
		else
		{	return false;
		}
	}
	
	function num_tesis()
    {   
         return $this->db->get('viw_tesis')->num_rows();
    }
        
	function listar_tesis($per_page)
	{    
         $datos = $this->db->get('viw_tesis',$per_page,$this->uri->segment(4));
         return $datos->result_array();
	}
	function buscar_autor_tesis()
	{	$query = "CALL SPRCNSAutoresXTipoAutor(2)";
		$query = $this->db->query($query);
		return $query->result_array();
	}
}