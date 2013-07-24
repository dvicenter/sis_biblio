<?php
class Cdrequestrecord extends CI_Model{
	public function __construct(){
		parent::__construct();
		$this->load->database();
	}
	function buscar_asesor()
	{	$query = "CALL SPRCNSAsesor()";
		$query = $this->db->query($query);
		return $query->result_array();
	}
	function insertar_solicitud($titulo,$introduccion,$objetivo,$resumen,$conclusion,$correo,$id_docente,$id_sujeto1,$id_sujeto2,$pIns)
	{	$query = "CALL SPRINSSolicitudConstancia('$titulo','$introduccion','$objetivo','$resumen','$conclusion','$correo',0,".$id_sujeto1.",".$id_docente.",".$id_sujeto2.",".$pIns.")";
		$query = $this->db->query($query);
		return $query->result_array();
	}
}