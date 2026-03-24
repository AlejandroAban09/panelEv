<?php

if (! defined('BASEPATH')) exit('No direct script access allowed');
class MY_Controller extends MX_Controller
{
    public $data;
    public function __construct()
    {
        parent::__construct();
        //session_start();
        $this->nsession = $this->config->item('nsession');
        $this->data['titulo'] = 'NPANEL | Panel Administrativo ';
        $this->data['variables'] = array();
        /* Tools */
        $this->load->helper(array('tools'));
        // Debug
        // $this->output->enable_profiler(true);
        $sess = $this->session->userdata($this->nsession);
        // Si no hay usuario logueado, mandar a login
        if (empty($sess) || empty($sess['usuario_id']) || empty($sess['login'])) {
            redirect('login');
            exit;
        }
        // Evitar caché del navegador en páginas protegidas
        $this->output->set_header('Last-Modified: ' . gmdate("D, d M Y H:i:s") . ' GMT');
        $this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
        $this->output->set_header('Pragma: no-cache');
        $this->output->set_header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
        $this->data['usuario'] = $sess;
        $this->data['is_admin'] = ((int)$sess['usuario_rol'] === 1);
        $this->data['is_operador'] = ((int)$sess['usuario_rol'] === 2);
    }
}
