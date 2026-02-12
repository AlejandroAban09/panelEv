<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Incidencias extends MY_Controller {
	public $data,$vParameters,$mainView,$fv;
	public function __construct(){
    parent::__construct();
    $this->nsession = $this->config->item('nsession');
    //if (!isset($_SESSION[$this->nsession]) || (($_SESSION[$this->nsession]['usuario'] == ""))) redirect('login');
            $tiempo = date('YmdHis');
            $this->fv = 'dashboard'; // form validation variable
            $this->mainView = 'dashboard';
            $this->data['title'] = 'Panel Evidencias | Tipos';
            $this->data['fjs'] = '';
            $this->data['js'] = '';
            $this->data['css'] = '';

            $this->load->model(array('mincidencias'));

            $this->load->library('form_validation');
    }

    public function index() {
        $data = $this->data;
        //$data['title'] = "Tipos de Incidencia";
        $data['menu'] = "incidencias";
        $data['tipos'] = $this->mincidencias->getAll();
        $data['count'] = $this->mincidencias->countAll()->total;

        //$data['usuario'] = $this->data['usuario'];

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('incidencias/index', $data);
        $this->load->view('layout/footer');
    }

    public function crear() {
        $data = $this->data;
        //$data['title'] = "Nuevo Tipo de Incidencia";
        $data['menu'] = "incidencias";
        $data['headline'] = "➕ Nuevo Tipo de Evidencia";
        $data['subheadline'] = "Configura el tipo y los emails que recibirán la notificación.";
        $data['backUrl'] = base_url('incidencias');
        $data['action'] = base_url('incidencias/guardar');

        //$data['usuario'] = $this->data['usuario'];

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('incidencias/crear', $data);
        $this->load->view('layout/footer');
    }

    public function guardar() {
        $data = [
            "nombre" => $this->input->post("nombre"),
            "descripcion" => $this->input->post("descripcion"),
            "emails_notificacion" => $this->input->post("emails_notificacion"),
            'activo' => $this->input->post('activo'),
        ];

        $this->mincidencias->insert($data);
        redirect("incidencias");
    }

    public function editar($id) {
        $data = $this->data;
        //$data['title'] = "Editar Tipo de Incidencia";
        $data['menu'] = "incidencias";
        $data['headline'] = "✏️ Editar Tipo de Evidencia";
        $data['subheadline'] = "Actualiza nombre, descripción y correos.";
        $data['backUrl'] = base_url('incidencias');
        $data['action'] = base_url('incidencias/actualizar/'.$id);
        $data['tipo'] = $this->mincidencias->getById($id);

        //$data['usuario'] = $this->data['usuario'];

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('incidencias/editar', $data);
        $this->load->view('layout/footer');
    }

    public function actualizar($id) {
        $data = [
            "nombre" => $this->input->post("nombre"),
            "descripcion" => $this->input->post("descripcion"),
            "emails_notificacion" => $this->input->post("emails_notificacion"),
            'activo' => $this->input->post('activo'),
        ];

        $this->mincidencias->updateData($id, $data);
        redirect("incidencias");
    }

    public function eliminar($id) {
        $this->mincidencias->deleteData($id);
        redirect("incidencias");
    }
}
