<?php
class Cccomponente extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/cdcomponente');
         $this->load->library('pagination');
	}

	
	function listar() 
	{	
		//$this->data['componentes']=$this->cdcomponente->listar();
		//echo $this->load->view("module/manager/componente/componente_user",$this->data);
        $config['base_url'] = base_url().'manager/cccomponente/componente_pag/';
        $config['total_rows'] = $this->cdcomponente->num_componente();
        $config['per_page'] = 5;
        $config['num_links'] = 4;
        $config['num_tag_open'] = '<li>';
        $config['num_tag_cloase'] = '</li>';
        $config['cur_tag_open'] = "<li class='active'><a href='".base_url().'manager/cccomponente/componente_pag/0'."'>";
        $config['cur_tag_close'] = '</a></li>';
        $config['next_link'] = '';
        $config['next_tag_open'] = "<div style='displya:none'>";
        $config['next_tag_close'] = '</div>';

        $this->pagination->initialize($config);
        $data = array('componentes'=>$this->cdcomponente->listar($config['per_page']),
        'paginacion'=>$this->pagination->create_links());
        
        echo $this->load->view('module/manager/componente/componente_user',$data);
	}
    
    function componente_pag()
    {
         $config['base_url'] = base_url().'manager/cccomponente/componente_pag/';
         $config['total_rows'] = $this->cdcomponente->num_componente();
         $config['per_page'] = 5;
         $config['num_links'] = 4;
         
         $data = array('componentes'=>$this->cdcomponente->listar($config['per_page']),
         'paginacion'=>$this->pagination->create_links());

         echo json_encode($data);
    }

	function insertar() 
	{	$componente=$_REQUEST['componente'];
		$descripcion_componente=$_REQUEST['descripcion_componente'];
		$this->data=array($this->cdcomponente->insertar($componente,$descripcion_componente));
		echo json_encode($this->data);
	}
	
	function modificar() 
	{	$id_componente=$_REQUEST['id_componente'];
		$componente=$_REQUEST['componente'];
		$descripcion_componente=$_REQUEST['descripcion_componente'];
		$this->data=array($this->cdcomponente->modificar($id_componente,$componente,$descripcion_componente));
		echo json_encode($this->data);
	}

	function eliminar($id_componente) 
	{	
		$this->cdcomponente->eliminar($id_componente);
		
	}
} 
?>
