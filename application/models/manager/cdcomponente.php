<?php 
	class Cdcomponente extends CI_Model
	{
		public function __construct() 
	    {
	        parent::__construct();
	        $this->load->database();
		}

		function listar()
		{
			$query = "CALL SPRABMComponente(0,null,null,null)";
			$query = $this->db->query($query);
			return $query->result_array();
		}

		function insertar($componente,$descripcion_componente)
		{
			$data = array(
						'componente' => $componente,
						'descripcion_componente' => $descripcion_componente
						);                   
			if ($this->db->query("CALL SPRABMComponente(1,1,'$componente','$descripcion_componente')")) 
			{
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
		{	$data = array(
						'id_componente' => $id_componente
						);
			$query = "CALL SPRABMComponente(3,'$id_componente',null,null)";
			if($this->db->query($query))
			{	return $data;
			}
		}
	
	}
	
 ?>
