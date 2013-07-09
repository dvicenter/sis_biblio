<?php
class Ccoficina_biblioteca_central extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->helper('url');
		$this->load->model('oficina_biblioteca_central/cdoficina_biblioteca_central');
		$this->load->library('pagination');
	}
	function listar(){
		$this->data['planes_tesis']=$this->cdoficina_biblioteca_central->listar();
		echo $this->load->view("module/oficina_biblioteca_central/constancia/manager_constancia",$this->data);
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
}