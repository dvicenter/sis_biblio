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
		{   if ($this->db->query("CALL SPRABMRol(1,null,'$rol','$descripcion')")) 
			{	$data;
				$query=$this->db->query("SELECT  tbl.id_rol, tbl.rol, tbl.descripcion FROM tbl_rol tbl order by tbl.id_rol desc limit 1");
				foreach ($query->result() as $dato)
					{	$data=$dato;
					}
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
