<?php 
	class Cdrol extends CI_Model
	{
		public function __construct() 
	    {
	        parent::__construct();
	        $this->load->database();
		}

		function listar()
		{
			$query = "CALL SPRABMRol(0,null,null,null)";
			$query = $this->db->query($query);
			return $query->result_array();
		}

		function insertar($rol,$descripcion)
		{
			$data = array(
						'rol' => $rol,
						'descripcion' => $descripcion
						);                   
			if ($this->db->query("CALL SPRABMRol(1,null,'$rol','$descripcion')")) 
			{
				return $data;
			}
		}
	}
 ?>
