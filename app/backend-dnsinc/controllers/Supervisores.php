<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Supervisores extends MY_Controller
{
    public $data;

    public function __construct()
    {
        parent::__construct();
        $this->nsession = $this->config->item('nsession');

        $this->data['menu'] = 'supervisores';
        $this->data['title'] = 'Panel Evidencias | Supervisores';
        $this->data['fjs'] = '';
        $this->data['js'] = '';
        $this->data['css'] = '';

        $this->load->model('msupervisores');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $data = $this->data;
        $data['supervisores'] = $this->msupervisores->getAll();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('supervisores/index', $data);
        $this->load->view('layout/footer');
    }

    public function crear($extraData = [])
    {
        $data = array_merge($this->data, $extraData);
        $data['headline'] = "➕ Nuevo Supervisor";
        $data['subheadline'] = "Registra un nuevo supervisor y su número para alertas.";
        $data['backUrl'] = base_url('supervisores');
        $data['action'] = base_url('supervisores/guardar');

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('supervisores/crear', $data);
        $this->load->view('layout/footer');
    }

    public function guardar()
    {
        // Validacion
        $this->form_validation->set_rules('nombre', 'Nombre', 'required|trim');
        $this->form_validation->set_rules('telefono_sin_prefijo', 'Teléfono', 'required|numeric|exact_length[10]');

        if ($this->form_validation->run() === FALSE) {
            $this->crear(['error' => validation_errors()]);
            return;
        }

        // Lógica del prefijo +52
        $telefono_raw = $this->input->post('telefono_sin_prefijo');
        $telefono_final = '52' . $telefono_raw;

        // Validar duplicidad (ignorando eliminados)
        $existe = $this->db->where('telefono', $telefono_final)
            ->where('deleted_at', NULL)
            ->get('supervisores')
            ->row();
        if ($existe) {
            $this->crear(['error' => "El número de teléfono ya está registrado para otro supervisor."]);
            return;
        }

        $dataInsert = [
            'nombre'   => $this->input->post('nombre'),
            'telefono' => $telefono_final,
            'email'    => $this->input->post('email'),
            'activo'   => $this->input->post('activo'),
            'created_at' => date('Y-m-d H:i:s')
        ];

        $this->msupervisores->insert($dataInsert);

        $this->session->set_flashdata('success', 'Supervisor registrado correctamente.');
        redirect('supervisores');
    }

    public function editar($id, $extraData = [])
    {
        $data = array_merge($this->data, $extraData);
        $supervisor = $this->msupervisores->getById($id);

        if (!$supervisor) {
            redirect('supervisores');
        }

        // Si hay datos POST (redirección interna tras error), sobrescribir valores
        if ($this->input->post()) {
            $supervisor->nombre = $this->input->post('nombre');
            $supervisor->email = $this->input->post('email');
            $supervisor->activo = $this->input->post('activo');
            $supervisor->telefono = '52' . $this->input->post('telefono_sin_prefijo');
        }

        $data['supervisor'] = $supervisor;

        // Separar el prefijo 52 para mostrar solo los 10 digitos en el input
        // Si el numero empieza con 52 y tiene 12 digitos, le quitamos los primeros 2
        $telefono_show = $supervisor->telefono;
        if (strlen($telefono_show) == 12 && substr($telefono_show, 0, 2) == '52') {
            $telefono_show = substr($telefono_show, 2);
        }
        $data['telefono_show'] = $telefono_show;

        $data['headline'] = "✏️ Editar Supervisor";
        $data['action'] = base_url('supervisores/actualizar/' . $id);
        $data['backUrl'] = base_url('supervisores');

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('supervisores/editar', $data);
        $this->load->view('layout/footer');
    }

    public function actualizar($id)
    {
        // Validacion
        $this->form_validation->set_rules('nombre', 'Nombre', 'required|trim');
        $this->form_validation->set_rules('telefono_sin_prefijo', 'Teléfono', 'required|numeric|exact_length[10]');

        if ($this->form_validation->run() === FALSE) {
            $this->editar($id, ['error' => validation_errors()]);
            return;
        }

        $telefono_raw = $this->input->post('telefono_sin_prefijo');
        $telefono_final = '52' . $telefono_raw;

        // Validar duplicidad (excluyendo actual y eliminados)
        $existe = $this->db->where('telefono', $telefono_final)
            ->where('id !=', $id)
            ->where('deleted_at', NULL)
            ->get('supervisores')
            ->row();

        if ($existe) {
            $this->editar($id, ['error' => "El número de teléfono ya está registrado."]);
            return;
        }

        $dataUpdate = [
            'nombre'   => $this->input->post('nombre'),
            'telefono' => $telefono_final,
            'email'    => $this->input->post('email'),
            'activo'   => $this->input->post('activo')
        ];

        $this->msupervisores->updateData($id, $dataUpdate);
        $this->session->set_flashdata('success', 'Supervisor actualizado correctamente.');
        redirect('supervisores');
    }

    public function eliminar($id)
    {
        $this->msupervisores->deleteData($id);
        redirect('supervisores');
    }
}
