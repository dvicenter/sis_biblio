<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Cdlogin extends CI_Model{
 	public function __construct()
	{	
        parent::__construct();
        $this->load->library('session');
	    $this->load->database();
	}
	public function getLogin($username,$password)
    {
	    $data = array(
	    'usuario' => $username,
	    'contrasenia' => $password,
	    'active'=>'1'
	    );
   
    	$query = $this->db->get_where('tbl_usuario',$data);
    	return $query->result_array();
    }

      
 	public function isLogged()
    {	if(isset($this->session->userdata['usuario']))
        {	return TRUE;
        }
        else
        {	return FALSE;
        }
       
    }
}
