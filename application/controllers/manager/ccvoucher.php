<?php
class Ccvoucher extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/cdvoucher');
	}
	function load_voucher()
	{	$archivo=$_FILES['archivo']['name'];
		if ($archivo != "") {
			$destino ="resource/file_tmp/".$archivo;
			if (copy($_FILES['archivo']['tmp_name'],$destino)) {
				$status = "Archivo subido: '.$archivo.'";
				$filas=file("resource/file_tmp/".$archivo);
				$i=0;
				while ($i<count($filas)) {					
					$row=$filas[$i];
					$concepto=substr($row, 39,4);
					if ($concepto=='0032') 
					{
						$tipo_persona=substr($row, 43,2);
						$fecha=substr($row, 113,8);
						if($tipo_persona=='01'){
							$codigo_universitaro=substr($row, 4,10);
							$result=$this->cdvoucher->load_voucher($tipo_persona,$codigo_universitaro,"");
						}else if($tipo_persona=='04'){
							$documento=substr($row, 54,8);
							$result=$this->cdvoucher->load_voucher($tipo_persona,"",$documento,$fecha);
							
						}
					}
								
					$i++;
				}
				if($result)
				{	echo 'Carga exitosa';
				}
				else{
					echo 'Error de carga';
				}
			} else {
				$status = "Error al subir el archivo";
			}
		}
		//$filas=file("C:\Users\CeSArCND\Desktop\caja.txt");
		//$filas=file('miarchivo.txt');
	}
}