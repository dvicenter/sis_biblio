<?php 
	class CDRol extends CI_Model
	{
		public function __construct() 
	    {
	        parent::__construct();
	        $this->load->database();
		}

		function listar()
		{
			$query = "CALL CMRSPRABMRol(0,null,null)";
			$query = $this->db->query($query);
			return $query->result_array();
		}

		function insertar($rol,$descripcion)
		{
			$data = array(
						'rol' => $rol,
						'descripcion' => $descripcion
						);                   
			if ($this->db->query("CALL CMRSPRABMRol(1,'$rol','$descripcion')")) 
			{
				return $data;
			}
		}
	}
 ?>