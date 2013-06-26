<?php 
	class Cdusuario extends CI_Model
	{
		public function __construct() 
	    {
	        parent::__construct();
	        $this->load->database();
		}

		function listar()
		{
			$query = "CALL SPRABMUsuario(0,null,null,null,null,null)";
			$query = $this->db->query($query);
			return $query->result_array();
		}

		function insertar($id_usuario,$usuario,$contrasenia,$id_sujeto,$active)
		{	
			$data = array(
						'id_usario'=>$id_usuario,
						'usuario' => $usuario,
						'contrasenia' => $contrasenia,
						'id_sujeto'=>$id_sujeto,
						'active' => $active,
						);                   
			if ($this->db->query("CALL SPRABMUsuario(1,2,'$usuario','$contrasenia',1,'$active')")) 
			{
				return $data;
			}
		}
	}
 ?>
