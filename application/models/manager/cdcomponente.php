<?php 
	class Cdcomponente extends CI_Model
	{
		public function __construct() 
	    {
	        parent::__construct();
	        $this->load->database();
		}

        function num_componente()
        {   
            return $this->db->get('tbl_componente')->num_rows();
        }
        
		function listar($per_page)
		{
		//	$query = "CALL SPRABMComponente(0,null,null,null)";
		//	$query = $this->db->query($query);
		//	return $query->result_array();
            $datos = $this->db->get('tbl_componente',$per_page,$this->uri->segment(4));
            return $datos->result_array();
		}

		
		
		function insertar($componente,$descripcion_componente)
		{	if ($this->db->query("CALL SPRABMComponente(1,1,'$componente','$descripcion_componente')")) 
			{	$query=$this->db->query("SELECT  tbl.id_componente,  tbl.componente,  tbl.descripcion_componente FROM  tbl_componente tbl order by tbl.id_componente desc limit 1");
				$data;
				foreach ($query->result() as $dato)
				{	$data=$dato;
				}
				return $data;
			}
		}
        
		function modificar($id_componente,$componente,$descripcion_componente)
		{	$data = array(
						'id_componente' => $id_componente,
						'componente' => $componente,
						'descripcion_componente' => $descripcion_componente
						);
			$query = "CALL SPRABMComponente(2,'$id_componente','$componente','$descripcion_componente')";
			if($this->db->query($query))
			{	return $data;
			}
		}

		function eliminar($id_componente)
		{
			$query = "CALL SPRABMComponente(3,'$id_componente',null,null)";
			$this->db->query($query);
		}
		function buscar_componente_accion()
		{	$query = "CALL SPRABMComponente(0,0,0,0)";
		$query = $this->db->query($query);
		return $query->result_array();
		}
	
	}
	
 ?>
