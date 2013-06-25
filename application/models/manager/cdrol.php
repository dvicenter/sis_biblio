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
			$query = 'SELECT rol, descripcion FROM tbl_rol';
			$query = $this->db->query($query);
			return $query->result_array();
		}

		function insertar($rol,$descripcion)
		{
			$data = array(
						'rol' => $rol,
						'descripcion' => $descripcion
						);
			//$this->db->insert('tbl_rol', $data);
			if ($this->db->insert('tbl_rol', $data)) 
			{
				return $data;
			}
		}
	}
 ?>