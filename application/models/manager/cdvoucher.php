<?php
class Cdvoucher extends CI_Model{
	function load_voucher($tipo_personeria,$codigo_universitario,$documento,$fecha)
	{	$this->load->database();
		$query=("INSERT INTO tbl_voucher (codigo_alumno,documento,tipo_persona,estado,fecha,fecha_registro) VALUES ('".$codigo_universitario."','".$documento."',".$tipo_personeria.",'1','".$fecha."',now());");
		$this->db->query($query);
		return true;
		//$query->result()
	}
	
	function ultima_fecha()
	{	$this->load->database();
		$query=('select fecha_registro from tbl_voucher order by id_voucher DESC limit 1');
		$fecha= $this->db->query($query);
		$fecha=$fecha->result_array();
		return $fecha[0]['fecha_registro'];
		
	}
}