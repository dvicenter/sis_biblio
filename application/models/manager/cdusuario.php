<?php 
	class Cdusuario extends CI_Model
	{
		public function __construct() 
	    {
	        parent::__construct();
	        $this->load->database();
		}
        
       function num_usuario()
        {   
            return $this->db->get('viw_usuario')->num_rows();
          }
        
		function listar($per_page)
		{
		//	$query = "CALL SPRABMUsuario(0,null,null,null,null,null)";
		//	$query = $this->db->query($query);
		//	return $query->result_array();
            $datos = $this->db->get('viw_usuario',$per_page,$this->uri->segment(4));
            return $datos->result_array();      
		}

        
		function buscar_sujeto()
		{	$query = "CALL SPRCNSSujeto()";
			$query = $this->db->query($query);
			return $query->result_array();
		}
        

		function insertar($usuario,$contrasenia,$id_sujeto,$active)
		{	if ($this->db->query("CALL SPRABMUsuario(1,2,'$usuario','$contrasenia','$id_sujeto','$active')")) 
			{	$query=$this->db->query("SELECT tbl.id_usuario, tbl.usuario, tbl.contrasenia, tbl.id_sujeto, tbl.active,
  					viw_sujeto.sujeto FROM tbl_usuario tbl INNER JOIN viw_sujeto
    				ON tbl.id_sujeto = viw_sujeto.id_sujeto order by tbl.id_usuario desc LIMIT 1");
				$data;
				foreach ($query->result() as $dato)
				{	$data=$dato;
				}
				return $data;
			}
		}
		function modificar($id_usuario,$usuario,$contrasenia,$active){
			$query = "CALL SPRABMUsuario(2,'$id_usuario','$usuario','$contrasenia',0,'$active')";
			$this->db->query($query);
		}
		function eliminar($id_usuario){
			$query = "CALL SPRABMUsuario(3,'".$id_usuario."',null,null,0,0)";
			$this->db->query($query);
		}
	
	}
 ?>
