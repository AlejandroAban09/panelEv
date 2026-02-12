<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends MY_Controller {
	public $data,$vParameters,$mainView,$fv;
	public function __construct(){
    parent::__construct();
    $this->nsession = $this->config->item('nsession');
    //if (!isset($_SESSION[$this->nsession]) || (($_SESSION[$this->nsession]['usuario'] == ""))) redirect('login');
            $tiempo = date('YmdHis');
            $this->fv = 'dashboard'; // form validation variable
            $this->mainView = 'dashboard';
            $this->data['title'] = 'Panel Evidencias | Usuarios';
            $this->data['fjs'] = '';
            $this->data['js'] = '';
            $this->data['css'] = '';

            $this->load->model(array('musuarios', 'mincidencias'));

            $this->load->library('form_validation');
    }

    public function index() {
        $data = $this->data;
        //$data['title'] = "Usuarios";
        $data['menu'] = "usuarios";
        $data['usuarios'] = $this->musuarios->getAll();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('usuarios/index', $data);
        $this->load->view('layout/footer');
    }

    public function crear() {
        $data = $this->data;
        //$data['title'] = "Nuevo Usuario";
        $data['menu'] = "usuarios";
        $data['headline'] = "➕ Nuevo Usuario (Operador)";
        $data['subheadline'] = "Solo se crean usuarios rol 2 y deben tener un tipo de evidencia asignado.";
        $data['backUrl'] = base_url('usuarios');
        $data['action'] = base_url('usuarios/guardar');

        $data['tipos'] = $this->mincidencias->getAll();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('usuarios/crear', $data);
        $this->load->view('layout/footer');
    }

    public function guardar() {

        $data = $this->data;
        $data['headline'] = "➕ Nuevo Usuario (Operador)";
        $data['subheadline'] = "Solo se crean usuarios rol 2 y deben tener un tipo de evidencia asignado.";
        $data['backUrl'] = base_url('usuarios');
        $data['action'] = base_url('usuarios/guardar');

        $usuario = trim($this->input->post('usuario', true));
        $password = (string)$this->input->post('password');
        $tipos_ids = $this->input->post('tipo_incidencia_id'); // array
        $tipos_ids = is_array($tipos_ids) ? array_map('intval', $tipos_ids) : [];
        $tipos_ids = array_values(array_filter($tipos_ids));

        if ($this->musuarios->existsUsuario($usuario)) {
            //$data = $this->data;
            //$data['title'] = "Nuevo Usuario";
            $data['menu'] = "usuarios";
            $data['tipos'] = $this->mincidencias->getAll();
            $data['error'] = "Ese usuario ya existe.";
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('usuarios/crear', $data);
            $this->load->view('layout/footer');
            return;
        }

        if (empty($password) || strlen($password) < 4) {
            //$data = $this->data;
            //$data['title'] = "Nuevo Usuario";
            $data['menu'] = "usuarios";
            $data['tipos'] = $this->mincidencias->getAll();
            $data['error'] = "La contraseña es obligatoria (mínimo 4 caracteres).";
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('usuarios/crear', $data);
            $this->load->view('layout/footer');
            return;
        }

        if (empty($tipos_ids)) {
            //$data = $this->data;
            //$data['title'] = "Nuevo Usuario";
            $data['menu'] = "usuarios";
            $data['tipos'] = $this->mincidencias->getAll();
            $data['error'] = "Debes asignar un Tipo de Evidencia al usuario (rol 2).";
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('usuarios/crear', $data);
            $this->load->view('layout/footer');
            return;
        }

        // ✅ Regla: solo se crean rol 2
        $dataInsert = [
            'nombre'             => $this->input->post('nombre', true),
            'usuario'            => $usuario,
            'password'           => sha1($password),
            'rol'                => 2,
            'tipo_id'            => implode(',', $tipos_ids),
            'activo'             => $this->input->post('activo'),
            'created_at'         => date('Y-m-d H:i:s')
        ];

        $this->musuarios->insert($dataInsert);
        redirect('usuarios');
    }

    public function editar($id) {
        $data = $this->data;
        //$data['title'] = "Editar Usuario";
        $data['menu'] = "usuarios";
        $data['headline'] = "✏️ Editar Usuario";
        $data['subheadline'] = "Actualiza datos, estado y (si aplica) el tipo asignado.";
        $data['backUrl'] = base_url('usuarios');
        $data['action'] = base_url('usuarios/actualizar/'.$id);

        $data['usuario_edit'] = $this->musuarios->getById($id);
        $data['tipos'] = $this->mincidencias->getAll();

        if (!$data['usuario_edit']) {
            redirect('usuarios');
            return;
        }

        // ✅ Si por alguna razón existe un rol 1, lo dejamos editar pero sin cambiar rol
        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('usuarios/editar', $data);
        $this->load->view('layout/footer');
    }

    public function actualizar($id) {

        $data = $this->data;
        $data['headline'] = "✏️ Editar Usuario";
        $data['subheadline'] = "Actualiza datos, estado y (si aplica) el tipo asignado.";
        $data['backUrl'] = base_url('usuarios');
        $data['action'] = base_url('usuarios/actualizar/'.$id);

        $user = $this->musuarios->getById($id);
        if (!$user) { redirect('usuarios'); return; }

        $usuario = trim($this->input->post('usuario', true));
        $tipos_ids = $this->input->post('tipo_incidencia_id'); // array
        $tipos_ids = is_array($tipos_ids) ? array_map('intval', $tipos_ids) : [];
        $tipos_ids = array_values(array_filter($tipos_ids));
        $password = (string)$this->input->post('password');

        if ($this->musuarios->existsUsuario($usuario, $id)) {
            //$data = $this->data;
            //$data['title'] = "Editar Usuario";
            $data['menu'] = "usuarios";
            $data['usuario_edit'] = $user;
            $data['tipos'] = $this->mincidencias->getAll();
            $data['error'] = "Ese usuario ya existe.";
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('usuarios/editar', $data);
            $this->load->view('layout/footer');
            return;
        }

        // Si es rol 2, tipo obligatorio
        if ((int)$user->rol === 2 && empty($tipos_ids)) {
            //$data = $this->data;
            //$data['title'] = "Editar Usuario";
            $data['menu'] = "usuarios";
            $data['usuario_edit'] = $user;
            $data['tipos'] = $this->mincidencias->getAll();
            $data['error'] = "Debes asignar un Tipo de Evidencia al usuario (rol 2).";
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('usuarios/editar', $data);
            $this->load->view('layout/footer');
            return;
        }

        $update = [
            'nombre'  => $this->input->post('nombre', true),
            'usuario' => $usuario,
            'tipo_id' => ((int)$user->rol === 2) ? implode(',', $tipos_ids) : $user->tipo_id,
            'activo'  => (int)$this->input->post('activo')
        ];

        // Password opcional
        if (!empty($password)) {
            $update['password'] = sha1($password);
        }

        $this->musuarios->updateData($id, $update);
        redirect('usuarios');
    }

    public function eliminar($id) {
        $user = $this->musuarios->getById($id);
        if ($user && (int)$user->rol === 1) {
            // Evitar borrar admin por seguridad
            redirect('usuarios');
            return;
        }
        $this->musuarios->deleteData($id);
        redirect('usuarios');
    }


}
