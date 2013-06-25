<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Cclogin extends CI_Controller {

	public function __construct()
    {	parent::__construct();
	    $this->load->helper('url');
	    $this->load->model('Cdlogin');
	    $this->load->helper('form');
	    $this->load->library('form_validation');
	    $this->load->library('session');
    }

	public function index()
	{	$this->data['error']="";
		if(!isset($_POST['usuario_login']))
		{	$this->load->view('v_login',$this->data);
		}
		else {
			$this->form_validation->set_rules('usuario_login','Usuario','required');
			$this->form_validation->set_rules('password_login','Contrase&ntilde;a','required');
			$this->form_validation->set_message('required','%s esta vacio');
			if($this->form_validation->run()==false)
			{	$this->load->view('v_login',$this->data);
			}
			else
			{	$isValidLogin = $this->Cdlogin->getLogin($_POST['usuario_login'],$_POST['password_login']);
                if($isValidLogin)
                {    $sesion_data = array(
                                    'usuario' => $_POST['usuario_login'],
                                    'password' => $_POST['password_login']
                                     );
                    $this->session->set_userdata($sesion_data);
                
                $data['usuario'] = $this->session->userdata['usuario'];
                $data['password'] = $this->session->userdata['password'];
                
                $this->load->view('v_panel',$data);
                }
                else
                {	$this->data['error']="Usuario o Contrase&ntilde;a err&oacute;neo";
                	$this->load->view('v_login',$this->data);
                }
			}
		}
	}

	function cerrar_sesion(){
		$this->data['error']="";
		if ($this->session->userdata("usuario")==TRUE) 
		{	$this->session->sess_destroy();
			$this->load->view('v_login',$this->data);
		}
		else
		{
			$this->load->view('v_login',$this->data);
		}
	}
	
}