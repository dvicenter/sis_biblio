<?php
class Cdvoucher extends CI_Model{
	function load_voucher($tipo_personeria,$codigo_universitario,$documento)
	{	$this->load->database();
		$query=("INSERT INTO tbl_voucher (codigo_alumno,documento,tipo_persona) VALUES ('".$codigo_universitario."','".$documento."',".$tipo_personeria.");");
		$this->db->query($query);
		//$query->result()
	}
}