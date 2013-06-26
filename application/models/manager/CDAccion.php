<?php 
	class CDAccion extends CI_Model
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

		function insertar($accion)
		{
			$data = array(
						'accion' => $accion,
						);                   
			if ($this->db->query("CALL CMRSPRABMRol(1,'$accion')")) 
			{
				return $data;
			}
		}
	}
 ?>
