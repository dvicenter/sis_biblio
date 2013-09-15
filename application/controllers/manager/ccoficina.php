<?php
class Ccoficina extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/cdoficina');
         $this->load->library('pagination');
	}

	
	function listar() 
	{	
		//$this->data['componentes']=$this->cdcomponente->listar();
		//echo $this->load->view("module/manager/componente/componente_user",$this->data);
        $config['base_url'] = base_url().'manager/ccoficina/oficina_pag/';
        $config['total_rows'] = $this->cdoficina->num_oficina();
        $config['per_page'] = 5;
        $config['num_links'] = 4;
        $config['num_tag_open'] = '<li>';
        $config['num_tag_cloase'] = '</li>';
        $config['cur_tag_open'] = "<li class='active'><a href='".base_url().'manager/ccoficina/oficina_pag/0'."'>";
        $config['cur_tag_close'] = '</a></li>';
        $config['next_link'] = '';
        $config['next_tag_open'] = "<div style='displya:none'>";
        $config['next_tag_close'] = '</div>';

        $this->pagination->initialize($config);
        $data = array('oficinas'=>$this->cdoficina->listar($config['per_page']),
        'paginacion'=>$this->pagination->create_links());
        
        echo $this->load->view('module/manager/oficina/oficina_user',$data);
	}
    
    function oficina_pag()
    {
         $config['base_url'] = base_url().'manager/ccoficina/oficina_pag/';
         $config['total_rows'] = $this->cdoficina->num_oficina();
         $config['per_page'] = 5;
         $config['num_links'] = 4;
         
         $data = array('oficina'=>$this->cdoficina->listar($config['per_page']),
         'paginacion'=>$this->pagination->create_links());

         echo json_encode($data);
    }

    function insertar() 
	{	$oficina=$_REQUEST['oficina'];
		$descripcion_oficina=$_REQUEST['descripcion_oficina'];
		$activo=$_REQUEST['activo'];
		$this->data=array($this->cdoficina->insertar($oficina,$descripcion_oficina,$activo));
		echo json_encode($this->data);
	}

	function modificar() 
	{	$id_oficina=$_REQUEST['id_oficina'];
		$oficina=$_REQUEST['oficina'];
		$descripcion_oficina=$_REQUEST['descripcion_oficina'];
		$activo=$_REQUEST['activo'];
		$this->data=array($this->cdoficina->modificar($id_oficina,$oficina,$descripcion_oficina,$activo));
		echo json_encode($this->data);
	}
} 
?>
