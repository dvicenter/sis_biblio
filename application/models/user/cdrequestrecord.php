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
	function insertar_solicitud($titulo,$introduccion,$objetivo,$resumen,$conclusion,$correo,$id_docente,$id_sujeto)
	{	$query = "CALL SPRINSSolicitudConstancia('$titulo','$introduccion','$objetivo','$resumen','$conclusion','$correo',0,".$id_sujeto.",".$id_docente.")";
		$query = $this->db->query($query);
		return $query->result_array();
	}
}