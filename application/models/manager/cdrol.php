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

		function modificar($id_rol,$rol,$descripcion)
		{ $data=array(
						'id_rol' => $id_rol,
						'rol' => $rol,
						'descripcion' => $descripcion
		);
			$query = "CALL SPRABMRol(2,'$id_rol','$rol','$descripcion')";
			$query = $this->db->query($query);
			if($this->db->query($query))
			{	return $data;
			}
		}

		

		function eliminar($id_rol)
		{
			$query = "CALL SPRABMRol(3,'$id_rol',null,null)";
			$query = $this->db->query($query);
		}
	}
 ?>
