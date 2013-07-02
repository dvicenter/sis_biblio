<?php
class Ccusuario extends CI_Controller
{
	 public function __construct() 
    {
        parent::__construct();
		$this->load->helper('url');
		$this->load->model('manager/cdusuario');
        $this->load->library('pagination');
	}

	function buscar_sujeto()
	{	$data=$this->cdusuario->buscar_sujeto();
		echo json_encode($data);
	}
	function listar() 
	{	
		//$this->data['roles']=$this->cdrol->listar();
        $config['base_url'] = base_url().'manager/ccusuario/usuario_pag/';
        $config['total_rows'] = $this->cdusuario->num_usuario();
        $config['per_page'] = 5;
        $config['num_links'] = 4;
        $config['num_tag_open'] = '<li>';
        $config['num_tag_cloase'] = '</li>';
        $config['cur_tag_open'] = "<li class='active'><a href='".base_url().'manager/ccusuario/usuario_pag/0'."'>";
        $config['cur_tag_close'] = '</a></li>';
        $config['next_link'] = '';
        $config['next_tag_open'] = "<div style='displya:none'>";
        $config['next_tag_close'] = '</div>';

        $this->pagination->initialize($config);
        $data = array('usuario'=>$this->cdusuario->listar($config['per_page']),
        'paginacion'=>$this->pagination->create_links());
        
        echo $this->load->view('module/manager/user/manager_user',$data);
	}
    
    function usuario_pag()
    {
        $config['base_url'] = base_url().'manager/ccusuario/usuario_pag/';
        $config['total_rows'] = $this->cdusuario->num_usuario();
        $config['per_page'] = 5;
        $config['num_links'] = 4;
        
        $data = array('usuario'=>$this->cdusuario->listar($config['per_page']),
        'paginacion'=>$this->pagination->create_links());

        echo json_encode($data);
    }
    
	function insertar() 
	{	$usuario=$_REQUEST['usuario'];
		$contrasenia=$_REQUEST['contrasenia'];
		$id_sujeto=$_REQUEST['id_sujeto'];
		$active=$_REQUEST['active'];
		$this->data=array($this->cdusuario->insertar($usuario,$contrasenia,$id_sujeto,$active));
		//echo $this->load->view("module/manager/accion/accion_user",$this->data);
		echo json_encode($this->data);
	}
	function modificar()
	{	$id_usuario=$_REQUEST['id_usuario'];
		$usuario=$_REQUEST['usuario'];
		$contrasenia=$_REQUEST['contrasenia'];
		$active=$_REQUEST['active'];
		$this->cdusuario->modificar($id_usuario,$usuario,$contrasenia,$active);
	}
	function eliminar($id_usuario){
		$this->cdusuario->eliminar($id_usuario);
	}
} 
?>
