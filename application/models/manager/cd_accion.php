<?php 
	class Cd_accion extends CI_Model
	{
		public function __construct() 
	    {
	        parent::__construct();
	        $this->load->database();
		}

        function num_accion()
        {   
            return $this->db->get('tbl_accion')->num_rows();
        }

		function listar($per_page)
		{
		//	$pInicio=0;
		//	$pFinal=16;
		//	$query = "CALL SPRCNSAccion(1,".$pInicio.",".$pFinal.")";
		//	$query = $this->db->query($query);
		
		//	return $query->result_array();
            $datos = $this->db->get('tbl_accion',$per_page,$this->uri->segment(4));
            return $datos->result_array();
		}
        
		function insertar($accion)
		{                  
			if ($this->db->query("CALL SPRABMAccion(1,1,'$accion')")) 
			{
				$query = $this->db->query("SELECT tbl.id_accion, tbl.accion FROM tbl_accion tbl order by tbl.id_accion desc limit 1");
				$data;
				foreach ($query->result() as $dato)
				{	$data=$dato;
				}
					return $data;
				
			}
		}
		function modificar($id_accion,$accion)
		{
			$data = array (
							'id_accion' => $id_accion,
							'accion' => $accion
							);
			$query = "CALL SPRABMAccion(2,'$id_accion','$accion')";
			if($this->db->query($query))
			{	return $data;
			}
		}
		function eliminar($id_accion)
		{
			$query = "CALL SPRABMAccion(3,'$id_accion',null)";
			$query = $this->db->query($query);
		}
		function buscar_componente_accion()
		{	$query = "CALL SPRABMComponente(0,0,0,0)";
			$query = $this->db->query($query);
			return $query->result_array();
		}
		function buscar_acciones_componentes($id_componente)
		{	$query ="CALL SPRCNSComponenteAccion(1,".$id_componente.",0)";
			$query=$this->db->query($query);
			return $query->result_array();
		}
		function accion()
		{	$query = "CALL SPRABMAccion(0,0,0)";
			$query=$this->db->query($query);
			return $query->result_array();
		}
		function eliminar_componente_accion($ids)
		{	$query="DELETE FROM tbl_componente_accion WHERE id_componente_accion in (".$ids.")";
			$query=$this->db->query($query);
		}
		function insert_new_componente_accion($ids,$id_componente)
		{	$query="CALL SPRABMComponenteAccion(1,0,".$id_componente.",".$ids.")";
			$this->db->query($query);
		}
		function ultimos_componente_accion($id_componente,$limit)
		{	$data=array();
			$query_=$this->db->query("CALL SPRCNSComponenteAccion(2,".$id_componente.",".$limit.")");
				foreach ($query_->result() as $dato)
					{	array_push($data, $dato);
					}
				return $data;
		}
	}
	
 ?>
