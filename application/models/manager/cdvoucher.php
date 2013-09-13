<?php
class Cdvoucher extends CI_Model{
	function load_voucher($tipo_personeria,$codigo_universitario,$documento,$fecha)
	{	$this->load->database();
		$query=("INSERT INTO tbl_voucher (codigo_alumno,documento,tipo_persona,estado,fecha,fecha_registro) VALUES ('".$codigo_universitario."','".$documento."',".$tipo_personeria.",'1','".$fecha."',now());");
		$this->db->query($query);
		return true;
		//$query->result()
	}
}