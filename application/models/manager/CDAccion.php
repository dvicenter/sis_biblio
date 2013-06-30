<?php 
	class Cdaccion extends CI_Model
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
        
            $datos = $this->db->get('tbl_accion',$per_page,$this->uri->segment(3));
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
	}
	
 ?>
