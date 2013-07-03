<?php
class Ccrol extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/cdrol');
        $this->load->library('pagination');
	}

	function listar() 
	{	
		//$this->data['roles']=$this->cdrol->listar();
        $config['base_url'] = base_url().'manager/ccrol/rol_pag/';
        $config['total_rows'] = $this->cdrol->num_rol();
        $config['per_page'] = 5;
        $config['num_links'] = 4;
        $config['num_tag_open'] = '<li>';
        $config['num_tag_cloase'] = '</li>';
        $config['cur_tag_open'] = "<li class='active'><a href='".base_url().'manager/ccrol/rol_pag/0'."'>";
        $config['cur_tag_close'] = '</a></li>';
        $config['next_link'] = '';
        $config['next_tag_open'] = "<div style='displya:none'>";
        $config['next_tag_close'] = '</div>';
        /*$config['first_link'] = 'Primero';
        $config['last_link'] = 'Ultimo';
        $config['next_link'] = 'Siguiente';
        $config['prev_link'] = 'Anterior';
        $config['cur_tag_open'] = '<b class="actual">';
        $config['cur_tag_close'] = '</b>';
        $config['full_tag_open'] = '<div id="paginacion">';
        $config['full_tag_close'] = '</div>';*/
        
/*        $config['page_query_string'] = TRUE;
         $config['use_page_numbers'] = TRUE;
        $config['query_string_segment'] = 'page';
         
        $config['full_tag_open'] = '<div class="pagination"><ul>';
        $config['full_tag_close'] = '</ul></div>';
         
        $config['first_link'] = '&laquo; First';
        $config['first_tag_open'] = '<li class="prev page">';
        $config['first_tag_close'] = '</li>';
         
        $config['last_link'] = 'Last &raquo;';
        $config['last_tag_open'] = '<li class="next page">';
        $config['last_tag_close'] = '</li>';
         
        $config['next_link'] = 'Next &rarr;';
        $config['next_tag_open'] = '<li class="next page">';
        $config['next_tag_close'] = '</li>';
         
        $config['prev_link'] = '&larr; Previous';
        $config['prev_tag_open'] = '<li class="prev page">';
        $config['prev_tag_close'] = '</li>';
         
        $config['cur_tag_open'] = '<li class="active"><a href="">';
        $config['cur_tag_close'] = '</a></li>';
         
        $config['num_tag_open'] = '<li class="page">';
        $config['num_tag_close'] = '</li>';
  */      
        $this->pagination->initialize($config);
        $data = array('roles'=>$this->cdrol->listar($config['per_page']),
        'paginacion'=>$this->pagination->create_links());
        
        echo $this->load->view('module/manager/rol/rol_user',$data);
	}
    
    function rol_pag()
    {
         $config['base_url'] = base_url().'manager/ccaccion/rol_pag/';
        $config['total_rows'] = $this->cdrol->num_rol();
        $config['per_page'] = 5;
        $config['num_links'] = 4;
        
        //$this->pagination->initialize($config);
        $data = array('roles'=>$this->cdrol->listar($config['per_page']),
        'paginacion'=>$this->pagination->create_links());
        
        
        //$this->load->view('module/manager/accion/accion_user',$data);
        echo json_encode($data);
    }
    
	function insertar() 
	{	$rol=$_REQUEST['rol'];
		$descripcion=$_REQUEST['descripcion_rol'];
		$this->data=array($this->cdrol->insertar($rol,$descripcion));
		echo json_encode($this->data);
	}

	function modificar() 
	{	$id_rol=$_REQUEST['id_rol'];
		$rol=$_REQUEST['rol'];
		$descripcion=$_REQUEST['descripcion_rol'];
		$this->data=array($this->cdrol->modificar($id_rol,$rol,$descripcion));
		echo json_encode($this->data);
	}

	function eliminar($id_rol) 
	{	$this->data=array($this->cdrol->eliminar($id_rol));
	}
	
	function buscar_rol()
	{	$data=$this->cdrol->buscar_rol();
		echo json_encode($data);
		
	}
	function buscar_usuario_rol()
 	{	$data=$this->cdrol->buscar_usuario_rol();
 		echo json_encode($data);
		
 	}

} 
?>
