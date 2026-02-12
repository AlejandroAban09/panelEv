<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Tiendas extends MY_Controller
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
        $this->data['title'] = 'Panel Evidencias | Tiendas';
        $this->data['fjs'] = '';
        $this->data['js'] = '';
        $this->data['css'] = '';

        $this->load->model(array('mtiendas', 'mgerentes', 'msupervisores'));

        $this->load->library('form_validation');
    }

    public function index()
    {
        $data = $this->data;
        //$data['title'] = "Tiendas";
        $data['menu'] = "tiendas";
        $data['tiendas'] = $this->mtiendas->getAll();

        //$data['usuario'] = $this->data['usuario'];

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('tiendas/index', $data);
        $this->load->view('layout/footer');
    }

    public function crear($extraData = [])
    {
        $data = array_merge($this->data, $extraData);
        //$data['title'] = "Nueva Tienda";
        $data['menu'] = "tiendas";
        $data['headline'] = "➕ Nueva Tienda";
        $data['subheadline'] = "Registra una tienda y su centro de costo.";
        $data['backUrl'] = base_url('tiendas');
        $data['action'] = base_url('tiendas/guardar');

        // Obtener lista de gerentes activos
        $data['gerentes'] = $this->mgerentes->getAll();
        // Obtener lista de supervisores activos
        $data['supervisores'] = $this->msupervisores->getAll();

        //$data['usuario'] = $this->data['usuario'];

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('tiendas/crear', $data);
        $this->load->view('layout/footer');
    }

    public function guardar()
    {
        $this->form_validation->set_rules('nombre', 'Nombre de la tienda', 'required|trim|is_unique[tiendas.nombre]');
        $this->form_validation->set_rules('centro_costo', 'Centro de costo', 'required|trim|is_unique[tiendas.centro_costo]');

        if ($this->form_validation->run() === FALSE) {
            $this->crear(['error' => validation_errors()]);
            return;
        }

        $data = [
            "nombre" => $this->input->post("nombre"),
            "centro_costo" => $this->input->post("centro_costo"),
            "gerente" => $this->input->post("gerente_id"), // Guardamos el ID del gerente
            "supervisor" => $this->input->post("supervisor_id"), // Guardamos el ID del supervisor
            'activo' => $this->input->post('activo'),
        ];

        $this->mtiendas->insert($data);
        $this->session->set_flashdata('success', 'Tienda registrada correctamente.');
        redirect("tiendas");
    }

    public function editar($id, $extraData = [])
    {
        $data = array_merge($this->data, $extraData);
        //$data['title'] = "Editar Tienda";
        $data['menu'] = "tiendas";
        $data['headline'] = "✏️ Editar Tienda";
        $data['subheadline'] = "Actualiza el nombre o centro de costo.";
        $data['backUrl'] = base_url('tiendas');
        $data['action'] = base_url('tiendas/actualizar/' . $id);
        $tienda = $this->mtiendas->getById($id);

        if ($this->input->post()) {
            $tienda->nombre = $this->input->post('nombre');
            $tienda->centro_costo = $this->input->post('centro_costo');
            $tienda->gerente = $this->input->post('gerente_id');
            $tienda->supervisor = $this->input->post('supervisor_id');
            $tienda->activo = $this->input->post('activo');
        }

        $data['tienda'] = $tienda;

        // Obtener lista de gerentes activos
        $data['gerentes'] = $this->mgerentes->getAll();
        // Obtener lista de supervisores activos
        $data['supervisores'] = $this->msupervisores->getAll();

        //$data['usuario'] = $this->data['usuario'];

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('tiendas/editar', $data);
        $this->load->view('layout/footer');
    }

    public function actualizar($id)
    {
        // Validacion manual de unicidad excluyendo el ID actual
        $nombre = $this->input->post("nombre");
        $cc = $this->input->post("centro_costo");

        $existeNombre = $this->db->where('nombre', $nombre)->where('id !=', $id)->get('tiendas')->row();
        if ($existeNombre) {
            $this->editar($id, ['error' => "El nombre de la tienda ya existe."]);
            return;
        }

        $existeCC = $this->db->where('centro_costo', $cc)->where('id !=', $id)->get('tiendas')->row();
        if ($existeCC) {
            $this->editar($id, ['error' => "El centro de costo ya existe."]);
            return;
        }

        $data = [
            "nombre"        => $this->input->post("nombre"),
            "centro_costo"  => $this->input->post("centro_costo"),
            "gerente"       => $this->input->post("gerente_id"), // Actualizamos ID
            "supervisor"    => $this->input->post("supervisor_id"), // Actualizamos ID
            'activo' => $this->input->post('activo'),
        ];

        $this->mtiendas->updateData($id, $data);
        $this->session->set_flashdata('success', 'Tienda actualizada correctamente.');
        redirect("tiendas");
    }

    public function eliminar($id)
    {
        $this->mtiendas->deleteData($id);
        redirect("tiendas");
    }
}
