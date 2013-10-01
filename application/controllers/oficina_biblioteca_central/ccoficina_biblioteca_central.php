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

    function buscar_filtro($index,$cadena)
    {
        if (isset($index)&&isset($cadena)) 
        {
        
            $data['tesis'] = $this->cdoficina_biblioteca_central->buscar_filtro($index,$cadena,10,0);
            echo $this->load->view('module/oficina_biblioteca_central/tesis/table_tesis',$data);
        }
        else{
            echo "falta cadena";
        }

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
        $pdf = new Pdf(PDF_PAGE_ORIENTATION,PDF_UNIT,PDF_PAGE_FORMAT, true, 'UTF-8', false);
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetTitle('Constancia de Negatividad');
        // datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config_alt.php de libraries/config
        //$pdf->SetHeaderData('', PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE , PDF_HEADER_STRING, array(0, 0, 0), array(0,0, 0));
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
        $pdf->setPrintHeader(false);

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

        //$pdf->setTextShadow(array('enabled' => true, 'depth_w' => 0.2, 'depth_h' => 0.2, 'color' => array(196, 196, 196), 'opacity' => 1, 'blend_mode' => 'Normal'));
        
    	$dates=$this->cdoficina_biblioteca_central->reporte_negatividad($id_plan_tesis);
    	$titulo;$alumno_solicitante;$alumno_acompaniante;$asesor;$escuela;$proceso_tramite;$estado;
    	foreach($dates as $date)
    	{	$titulo=strtoupper($date['titulo']);
    		$asesor=strtoupper($date['asesor']);
    		$alumno_solicitante=strtoupper($date['alumno_solicitante']);
    		$alumno_acompaniante=strtoupper($date['alumno_acompaniante']);
    		$escuela=strtoupper($date['escuela']);
    		$proceso_tramite=$date['proceso_tramite'];
    	}
    	switch ($proceso_tramite)
    	{	case 1: $estado='TR&Aacute;MITE';break;
    		case 2: $estado='NO IN&Eacute;DITO';break;
    		case 3: $estado='IN&Eacute;DITO';break;
    	}
    	if($alumno_acompaniante!=''){
    		$alumno_acompaniante=' y <b>'.$alumno_acompaniante.'</b>';
    	}else{$alumno_acompaniante='';}
        $html = '<div style="text-align:center;">
                    <span > Universidad Nacional </span><br/>
                     "Jose Faustino Sanchez Carrion" <br/>
                     <b>OFICINA DE BIBLIOTECA CENTRAL</b> <br/><br/>
                     <i style="font-style: italic;">CERTIFICADO DE NEGATIVIDAD</i>
                </div>
                <div style="font-size:12px;">
                    <p style="text-align: justify;"	>
                        (Ley N&deg; 27705, Resolucion N&deg; 831-2002-ANR, Resolucion N&deg; 0101-2012-CU-UH, y Art. 13&deg;
                        inc. B) del Reglamento de Grados y Titulos) 
                    </p>
                    <p>
                        <b>EL JEFE DE LA UNIDAD DE BIBLIOTECA CENTRAL</b>, Quien suscribe:
                    </p>

                    <p>
                        <u><b>CERTIFICA:</b></u>
                    </p>
                    <p style="text-align: justify;">
                        Que, el plan de tesis titulada  <b>'.$titulo.'</b>, Asesorado (a) por (el, la) <b>Ing. '.$asesor.'</b> desarrollado(s) por &eacute;l(los, las):
                        <b>'.$alumno_solicitante.'</b>'.$alumno_acompaniante.', 
                        de la <b>E.A.P</b>. de <b>'.$escuela.'</b>,  
                        no se encuentra registrado en esta Biblioteca.<br><br>
                        
                        Con Declaraci&oacute;n Jurada Simple, el (a) interesada da fe y conformidad de su
                        trabajo de investigaci&oacute;n y su contenido  <b>'.$estado.'</b>, en caso contrario acepta 
                        dar nulidad si existiera en otra Instituci&oacute;n: Tesis, Monograf&iacute;a y Trabajo de 
                        Investigaci&oacute;n igual, similar con el t&iacute;tulo y/o contenido.<br><br>
                        
                        Se expide el presente Certificado de Negatividad, a solicitud del interesado,
                        <b>'.$alumno_solicitante.'</b>   para los fines de titulaci&oacute;n en 
                        m&eacute;rito al Art. 13&deg; inciso b del Reglamento General de Grados Acad&eacute;micos y 
                        T&iacute;tulos Profesionales de esta Universidad.
                    </p>
                        Recibo N&deg; 1476453
                    <p style="text-align:right;">
                        <br>
                        <span >Huacho,  Marzo 21 de 2013.</span>
                    </p>
                    
                    <div height="500px" style="padding-top:300px;position:relative;">
                        <p style="text-align:center;font-size:10px;">
                            ..........................................................................<BR/>
                            Ing. LINO  ROLANDO RODR&Iacute;GUEZ ALEGRE<BR/>
                            JEFE DE LA OFICINA DE BIBLIOTECA CENTRAL
                        </p>
                    </div>
                </div>
                
                ';
    	/*$html .=   $titulo ;
    	$html .=   $asesor ;*/
    	$pdf->writeHTML($html, true, false, false, false, '');
// ---------------------------------------------------------
// Cerrar el documento PDF y preparamos la salida
// Este método tiene varias opciones, consulte la documentación para más información.
        $nombre_archivo = utf8_decode("Constancia de negatividad.pdf");
        $pdf->Output($nombre_archivo, 'I');
        echo json_encode($pdf);
    }
}