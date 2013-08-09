<?php
class Ccoficina_biblioteca_central extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->helper('url');
		$this->load->model('oficina_biblioteca_central/cdoficina_biblioteca_central');
		$this->load->library('pagination');
	}
	/*function listar(){
		$this->data['planes_tesis']=$this->cdoficina_biblioteca_central->listar();
		echo $this->load->view("module/oficina_biblioteca_central/constancia/manager_constancia",$this->data);
	}*/
	
	function listar_solicitud()
	{	$config['base_url'] = base_url().'oficina_biblioteca_central/ccoficina_biblioteca_central/solicitud_pag/';
        $config['total_rows'] = $this->cdoficina_biblioteca_central->num_solicitud();
        $config['per_page'] = 10;
        $config['num_links'] = 4;
        $config['num_tag_open'] = '<li>';
        $config['num_tag_cloase'] = '</li>';
        $config['cur_tag_open'] = "<li class='active'><a href='".base_url().'oficina_biblioteca_central/ccoficina_biblioteca_central/solicitud_pag/0'."'>";
        $config['cur_tag_close'] = '</a></li>';
        $config['next_link'] = '';
        $config['next_tag_open'] = "<div style='displya:none'>";
        $config['next_tag_close'] = '</div>';
		
		$this->pagination->initialize($config);
        $data = array('solicitud'=>$this->cdoficina_biblioteca_central->listar_solicitud($config['per_page']),
        'paginacion'=>$this->pagination->create_links());
        
        echo $this->load->view('module/oficina_biblioteca_central/constancia/manager_constancia',$data);
	}
	
	function solicitud_pag()
    {
        $config['base_url'] = base_url().'oficina_biblioteca_central/ccoficina_biblioteca_central/solicitud_pag/';
        $config['total_rows'] = $this->cdoficina_biblioteca_central->num_solicitud();
        $config['per_page'] = 10;
        $config['num_links'] = 4;
        
        $data = array('solicitud'=>$this->cdoficina_biblioteca_central->listar_solicitud($config['per_page']),
        'paginacion'=>$this->pagination->create_links());
        
        echo json_encode($data);
    }
	
	function buscar_plan_tesis()
	{	$id_plan_tesis=$_REQUEST['id_plan_tesis'];
		$data=$this->cdoficina_biblioteca_central->buscar_plan_tesis($id_plan_tesis);
		echo json_encode($data);
	}
	function informe_practica()
	{	$id_alumno=$_REQUEST['id_alumno'];
		$data=$this->cdoficina_biblioteca_central->informe_practica($id_alumno);
		echo json_encode($data);
	}
	function buscarXAsesor()
	{	$id_docente=$_REQUEST['id_docente'];
		$this->data['consults_asesor']=$this->cdoficina_biblioteca_central->buscarXAsesor($id_docente);
		echo $this->load->view('module/oficina_biblioteca_central/constancia/consult_asesor',$this->data);
	}
	function aprobacion_constancia()
	{	$id_plan_tesis=$_REQUEST['id_plan_tesis'];
		$aprobacion=$_REQUEST['aprobacion'];
		$this->cdoficina_biblioteca_central->aprobacion_constancia($id_plan_tesis,$aprobacion);
	}
	
	function listar_tesis()
	{	$config['base_url'] = base_url().'oficina_biblioteca_central/ccoficina_biblioteca_central/tesis_pag/';
        $config['total_rows'] = $this->cdoficina_biblioteca_central->num_tesis();
        $config['per_page'] = 10;
        $config['num_links'] = 4;
        $config['num_tag_open'] = '<li>';
        $config['num_tag_cloase'] = '</li>';
        $config['cur_tag_open'] = "<li class='active'><a href='".base_url().'oficina_biblioteca_central/ccoficina_biblioteca_central/tesis_pag/0'."'>";
        $config['cur_tag_close'] = '</a></li>';
        $config['next_link'] = '';
        $config['next_tag_open'] = "<div style='displya:none'>";
        $config['next_tag_close'] = '</div>';
		
		$this->pagination->initialize($config);
        $data = array('tesis'=>$this->cdoficina_biblioteca_central->listar_tesis($config['per_page']),
        'paginacion'=>$this->pagination->create_links());
        
        echo $this->load->view('module/oficina_biblioteca_central/tesis/manager_tesis',$data);
	}
	
	function tesis_pag()
    {
        $config['base_url'] = base_url().'oficina_biblioteca_central/ccoficina_biblioteca_central/tesis_pag/';
        $config['total_rows'] = $this->cdoficina_biblioteca_central->num_tesis();
        $config['per_page'] = 10;
        $config['num_links'] = 4;
        
        $data = array('tesis'=>$this->cdoficina_biblioteca_central->listar_tesis($config['per_page']),
        'paginacion'=>$this->pagination->create_links());
        
        echo json_encode($data);
    }
    function buscar_autor_tesis()
    {	$data=$this->cdoficina_biblioteca_central->buscar_autor_tesis();
		echo json_encode($data);
    }
    function insertar_tesis()
    {	$id_autor_tesis=$_REQUEST['id_autor_tesis'];
    	$id_asesor=$_REQUEST['id_asesor'];
    	$titulo=$_REQUEST['titulo'];
    	$introduccion=$_REQUEST['introduccion'];
    	$objetivo=$_REQUEST['objetivo'];
    	$resumen=$_REQUEST['resumen'];
    	$conclusion=$_REQUEST['conclusion'];
    	$anio=$_REQUEST['anio'];
    	$this->cdoficina_biblioteca_central->insertar_tesis($id_autor_tesis,$id_asesor,$titulo,$introduccion,$objetivo,$resumen,$conclusion,$anio);
    }
    function editar_tesis()
    {	$id_material_bibliografico=$_REQUEST['id_material_bibliografico'];
    	$introduccion=$_REQUEST['introduccion'];
    	$objetivo=$_REQUEST['objetivo'];
    	$resumen=$_REQUEST['resumen'];
    	$conclusion=$_REQUEST['conclusion'];
    	$this->cdoficina_biblioteca_central->editar_tesis($id_material_bibliografico,$introduccion,$objetivo,$resumen,$conclusion);
    }
    function reporte_negatividad($id_plan_tesis)
    {	//echo json_encode($data);
    	$this->load->library('Pdf');
        $pdf = new Pdf('P', 'mm', 'A4', true, 'UTF-8', false);
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetTitle('Constancia de Negatividad');
        // datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config_alt.php de libraries/config
        $pdf->SetHeaderData('', PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE , PDF_HEADER_STRING, array(0, 0, 0), array(0,0, 0));
        $pdf->setFooterData($tc = array(0, 0, 0), $lc = array(0, 0, 0));

// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config.php de libraries/config
        $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', 10));
        $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// se pueden modificar en el archivo tcpdf_config.php de libraries/config
        $pdf->SetDefaultMonospacedFont(PDF_FONT_NAME_MAIN);

// se pueden modificar en el archivo tcpdf_config.php de libraries/config
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
        $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// se pueden modificar en el archivo tcpdf_config.php de libraries/config
        $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//relación utilizada para ajustar la conversión de los píxeles
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
        // establecer el modo de fuente por defecto
        $pdf->setFontSubsetting(true);

// Establecer el tipo de letra
 
//Si tienes que imprimir carácteres ASCII estándar, puede utilizar las fuentes básicas como
// Helvetica para reducir el tamaño del archivo.
        $pdf->SetFont('dejavusans', '', 14, '', true);

// Añadir una página
// Este método tiene varias opciones, consulta la documentación para más información.
        $pdf->AddPage();

        $pdf->setTextShadow(array('enabled' => true, 'depth_w' => 0.2, 'depth_h' => 0.2, 'color' => array(196, 196, 196), 'opacity' => 1, 'blend_mode' => 'Normal'));
        
    	$dates=$this->cdoficina_biblioteca_central->reporte_negatividad($id_plan_tesis);
    	$titulo;$alumno;$asesor;$escuela;
    	foreach($dates as $date)
    	{	$titulo=$date['titulo'];
    		$asesor=$date['asesor'];
    	}
    	$html =   $titulo ;
    	$html .=   $asesor ;
    	$pdf->writeHTMLCell($w = 0, $h = 0, $x = '', $y = '', $html, $border = 0, $ln = 1, $fill = 0, $reseth = true, $align = '', $autopadding = true);
 
// ---------------------------------------------------------
// Cerrar el documento PDF y preparamos la salida
// Este método tiene varias opciones, consulte la documentación para más información.
        $nombre_archivo = utf8_decode("Constancia de negatividad.pdf");
        $pdf->Output($nombre_archivo, 'I');
        echo json_encode($pdf);
    }
}