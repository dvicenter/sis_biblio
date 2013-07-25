<?php
class Ccaccion extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/cd_accion');
        $this->load->library('pagination');
	}
    
    function listar()
    {
        $config['base_url'] = base_url().'manager/ccaccion/listar_pag/';
        $config['total_rows'] = $this->cd_accion->num_accion();
        $config['per_page'] = 5;
        $config['num_links'] = 4;
        $config['num_tag_open'] = '<li>';
        $config['num_tag_cloase'] = '</li>';
        $config['cur_tag_open'] = "<li class='active'><a href='".base_url().'manager/ccaccion/listar_pag/0'."'>";
        $config['cur_tag_close'] = '</a></li>';
        $config['next_link'] = '';
        $config['next_tag_open'] = "<div style='displya:none'>";
        $config['next_tag_close'] = '</div>';
        $this->pagination->initialize($config);
        $data = array('accion'=>$this->cd_accion->listar($config['per_page']),
        'paginacion'=>$this->pagination->create_links());
        $this->load->view('module/manager/accion/accion_user',$data);
    }
	function listar_pag()
    {
         $config['base_url'] = base_url().'manager/ccaccion/listar_pag/';
        $config['total_rows'] = $this->cd_accion->num_accion();
        $config['per_page'] = 5;
        $config['num_links'] = 5;
        
        //$this->pagination->initialize($config);
        $data = array('accion'=>$this->cd_accion->listar($config['per_page']),
        'paginacion'=>$this->pagination->create_links());
        
        
        //$this->load->view('module/manager/accion/accion_user',$data);
        echo json_encode($data);
    }

	function insertar() 
	{	
		$accion=$_REQUEST['accion'];
		$this->data=array($this->cd_accion->insertar($accion));
		echo json_encode($this->data);
	}
	function modificar() 
	{	
		$id_accion=$_REQUEST['id_accion'];
		$accion=$_REQUEST['accion'];
		$this->data=array($this->cd_accion->modificar($id_accion,$accion));
		echo json_encode($this->data);
	}

	function eliminar($id_accion) 
	{	
		$this->cd_accion->eliminar($id_accion);
	}
	function buscar_componente_accion()
	{	$data=$this->cd_accion->buscar_componente_accion();
 		echo json_encode($data);
	}
	function buscar_acciones_componentes()
	{	$id_componente=$_REQUEST['id_componente'];
		$this->data['componentes_accion']=$this->cd_accion->buscar_acciones_componentes($id_componente);
		echo $this->load->view('module/manager/role_component_action/accion_componente_assignment',$this->data);
	}
	function accion()
	{	$this->data['acciones']=$this->cd_accion->accion();
		echo $this->load->view('module/manager/role_component_action/accion',$this->data);
	}
	function eliminar_componente_accion()
	{	$ids=$_REQUEST['ids'];
		$this->cd_accion->eliminar_componente_accion($ids);
	}
	function insert_new_componente_accion()
	{	$ids=$_REQUEST['ids'];
		$id_componente=$_REQUEST['id_componente'];
		$ids=explode(',', $ids);
		$ids_r=array();
		for($i=0;$i < sizeof($ids);$i++){
			$this->cd_accion->insert_new_componente_accion($ids[$i],$id_componente);
		}
		$ids++;
		$data = $this->cd_accion->ultimos_componente_accion($id_componente,sizeof($ids));
		echo json_encode($data);
	}
} 
?>
