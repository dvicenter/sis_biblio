<?php 
	class Cdrol extends CI_Model
	{
		public function __construct() 
	    {
	        parent::__construct();
	        $this->load->database();
		}

        function num_rol()
        {   
            return $this->db->get('tbl_rol')->num_rows();
        }
        
		
		
		
		function listar($per_page)
		{
		//	$query = "CALL SPRABMRol(0,null,null,null)";
		//	$query = $this->db->query($query);
		//	return $query->result_array();
        
            $datos = $this->db->get('tbl_rol',$per_page,$this->uri->segment(4));
            return $datos->result_array();
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
		{	$query = "CALL SPRABMRol(3,'$id_rol',null,null)";
			$query = $this->db->query($query);
		}
		
		function buscar_rol()
		{	$query = "CALL SPRABMRol(0,0,0,0)";
			$query = $this->db->query($query);
			return $query->result_array();
		}
		function buscar_usuario_rol()
		{	$query = "CALL SPRABMUsuario(0,0,0,0,0,0)";
			$query = $this->db->query($query);
			return $query->result_array();
		}
		function buscar_rol_usuario($id_usuario){
			$query ="CALL SPRCNSListar_rol_usuario(1,".$id_usuario.",0)";
			$query=$this->db->query($query);
			return $query->result_array();
		}
		function rol()
		{	$query = "CALL SPRABMRol(0,0,0,0)";
			$query=$this->db->query($query);
			return $query->result_array();
		}
		function eliminar_usuario_rol($ids)
		{	$query="DELETE FROM tbl_usuario_rol WHERE id_usuario_rol in (".$ids.")";
			$query=$this->db->query($query);
		}
		function insert_new_rol_usuario($ids,$id_usuario)
		{	$query="CALL SPRABMUsuarioRol(1,0,".$id_usuario.",".$ids.")";
			$this->db->query($query);
		}
		function ultimos_usuario_rol($id_usuario,$limit)
		{	$data=array();
			$query_=$this->db->query("CALL SPRCNSListar_rol_usuario(2,".$id_usuario.",".$limit.")");
				foreach ($query_->result() as $dato)
					{	array_push($data, $dato);
					}
				return $data;
		}
	}
 ?>
