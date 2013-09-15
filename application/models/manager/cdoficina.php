<?php 
	class Cdoficina extends CI_Model
	{
		public function __construct() 
	    {
	        parent::__construct();
	        $this->load->database();
		}

        function num_oficina()
        {   
            return $this->db->get('tbl_oficina')->num_rows();
        }
        
		function listar($per_page)
		{
			$datos =$this->db->select('tbl.id_oficina AS id_oficina,tbl.oficina AS oficina,tbl.descripcion_oficina AS descripcion_oficina,tbl.activo AS activo');
			$this->db->order_by('tbl.id_oficina','desc');
            $datos = $this->db->get('tbl_oficina tbl',$per_page,$this->uri->segment(4));
            return $datos->result_array();
			
		}

		function insertar($oficina,$descripcion_oficina,$activo)
		{	if ($this->db->query("CALL SPRABMOficina(1,'$oficina','$descripcion_oficina','$activo')")) 
			{	$query=$this->db->query("SELECT  tbl.id_oficina,  tbl.oficina,  tbl.descripcion_oficina, tbl.activo FROM  tbl_oficina tbl order by tbl.id_oficina desc limit 1");
				$data;
				foreach ($query->result() as $dato)
				{	$data=$dato;
				}
				return $data;
			}
		}

		function modificar($id_oficina,$oficina,$descripcion_oficina,$activo)
		{	$data = array(
						'id_oficina' => $id_oficina,
						'oficina' => $oficina,
						'descripcion_oficina' => $descripcion_oficina,
						'activo' => $activo
						);
			$query = "CALL SPRABMOficina(2,'$id_oficina','$oficina','$descripcion_oficina','$activo')";
			if($this->db->query($query))
			{	return $data;
			}
		}
		
	}
	
 ?>
