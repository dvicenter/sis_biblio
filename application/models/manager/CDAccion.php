<?php 
	class Cdaccion extends CI_Model
	{
		public function __construct() 
	    {
	        parent::__construct();
	        $this->load->database();
		}

		function listar()
		{
			$query = "CALL SPRABMAccion(0,null,null)";
			$query = $this->db->query($query);
			return $query->result_array();
		}

		function insertar($accion)
		{	
			$data = array(
						'accion' => $accion,
						);                   
			if ($this->db->query("CALL SPRABMAccion(1,1,'$accion')")) 
			{
				return $data;
			}
		}
	}
 ?>