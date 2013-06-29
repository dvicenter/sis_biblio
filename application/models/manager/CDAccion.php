<?php 
	class Cdaccion extends CI_Model
	{
		public function __construct() 
	    {
	        parent::__construct();
	        $this->load->database();
		}

		function listar()
		{	$pInicio=1;
			$pFinal=5;
			$query = "CALL SPRCNSAccion(1,".$pInicio.",".$pFinal.")";
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
		function modificar($id_accion,$accion)
		{
		$data = array (
						'id_accion' => $id_accion,
						'accion' => $accion,
		);
			$query = "CALL SPRABMAccion(2,'$id_accion','$accion')";
			$query = $this->db->query($query);
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
