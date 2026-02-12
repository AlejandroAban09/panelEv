<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Gerentes extends MY_Controller
{
    public $data;
    //constructor
    public function __construct()
    {
        parent::__construct();
        $this->nsession = $this->config->item('nsession');
        $this->data['menu'] = 'gerentes';
        $this->data['title'] = 'Panel Evidencias | Gerentes';
        $this->data['fjs'] = '';
        $this->data['js'] = '';
        $this->data['css'] = '';
        $this->load->model('mgerentes');
        $this->load->library('form_validation');
    }
    //funcion index para mostrar los gerentes
    public function index()
    {
        $data = $this->data;
        $data['gerentes'] = $this->mgerentes->getAll();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('gerentes/index', $data);
        $this->load->view('layout/footer');
    }
    //funcion crear para crear un nuevo gerente
    public function crear($extraData = [])
    {
        $data = array_merge($this->data, $extraData);
        $data['headline'] = "Nuevo Gerente";
        $data['subheadline'] = "Registra un nuevo gerente y su número para alertas.";
        $data['backUrl'] = base_url('gerentes');
        $data['action'] = base_url('gerentes/guardar');

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('gerentes/crear', $data);
        $this->load->view('layout/footer');
    }
    //funcion guardar para guardar el gerente
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
        // Validar duplicidad de telefono (ignorando eliminados)
        $existe = $this->db->where('telefono', $telefono_final)
            ->where('deleted_at', NULL)
            ->get('gerentes')
            ->row();
        if ($existe) {
            $this->crear(['error' => "El número de teléfono ya está registrado para otro gerente."]);
            return;
        }
        $dataInsert = [
            'nombre'   => $this->input->post('nombre'),
            'telefono' => $telefono_final,
            'email'    => $this->input->post('email'),
            'activo'   => $this->input->post('activo'),
            'created_at' => date('Y-m-d H:i:s')
        ];
        $this->mgerentes->insert($dataInsert);
        $this->session->set_flashdata('success', 'Gerente registrado correctamente.');
        redirect('gerentes');
    }
    //funcion editar para editar el gerente
    public function editar($id, $extraData = [])
    {
        $data = array_merge($this->data, $extraData);
        $gerente = $this->mgerentes->getById($id);
        if (!$gerente) {
            redirect('gerentes');
        }
        // Si hay datos POST (redirección interna tras error), sobrescribir valores para no perder lo que el usuario escribió
        if ($this->input->post()) {
            $gerente->nombre = $this->input->post('nombre');
            $gerente->email = $this->input->post('email');
            $gerente->activo = $this->input->post('activo');
            // Reconstruimos el telefono completo para que la logica de visualizacion funcione
            $gerente->telefono = '52' . $this->input->post('telefono_sin_prefijo');
        }
        $data['gerente'] = $gerente;
        // Separar el prefijo 52 para mostrar solo los 10 digitos en el input
        // Si el numero empieza con 52 y tiene 12 digitos, le quitamos los primeros 2
        $telefono_show = $gerente->telefono;
        if (strlen($telefono_show) == 12 && substr($telefono_show, 0, 2) == '52') {
            $telefono_show = substr($telefono_show, 2);
        }
        $data['telefono_show'] = $telefono_show;
        $data['headline'] = "Editar Gerente";
        $data['action'] = base_url('gerentes/actualizar/' . $id);
        $data['backUrl'] = base_url('gerentes');
        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('gerentes/editar', $data);
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
            ->get('gerentes')
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

        $this->mgerentes->updateData($id, $dataUpdate);
        $this->session->set_flashdata('success', 'Gerente actualizado correctamente.');
        redirect('gerentes');
    }
    //funcion eliminar para eliminar el gerente
    public function eliminar($id)
    {
        $this->mgerentes->deleteData($id);
        redirect('gerentes');
    }
}
