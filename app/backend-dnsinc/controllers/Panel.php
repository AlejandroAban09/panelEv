<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Panel extends MY_Controller
{
    public $data, $vParameters, $mainView, $fv;
    public function __construct()
    {
        parent::__construct();
        $this->nsession = $this->config->item('nsession');
        //if (!isset($_SESSION[$this->nsession]) || (($_SESSION[$this->nsession]['usuario'] == ""))) redirect('login');
        $tiempo = date('YmdHis');
        $this->fv = 'dashboard'; // form validation variable
        $this->mainView = 'dashboard';
        $this->data['title'] = 'Panel Evidencias | Dashboard';
        $this->data['fjs'] = '';
        $this->data['js'] = '';
        $this->data['css'] = '';
    }

    public function index()
    {
        $data = $this->data;

        $data['menu'] = 'dashboard';

        $data['tot_encargados'] = $this->db->count_all('encargados');
        $data['tot_tiendas']    = $this->db->count_all('tiendas');
        $data['tot_tipos']      = $this->db->count_all('tipos_incidencia');
        $data['tot_tickets']    = $this->db->count_all('tickets');

        //$data['usuario'] = $this->data['usuario'];

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('panel/home', $data);
        $this->load->view('layout/footer');
    }
    // Generic method to save user preferences (sidebar, theme, table rows, etc.)
    public function save_preference()
    {
        $key   = $this->input->post('key');
        $value = $this->input->post('value');

        if (!empty($key)) {
            // Save cookie for 30 days
            set_cookie($key, $value, 2592000);
        }
    }
}
