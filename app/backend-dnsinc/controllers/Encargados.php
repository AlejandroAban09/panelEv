<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Encargados extends MY_Controller
{
    //
    public $data, $vParameters, $mainView, $fv;
    //funcion constructora para inicializar variables y modelos
    public function __construct()
    {
        parent::__construct();
        $this->nsession = $this->config->item('nsession');
        //if (!isset($_SESSION[$this->nsession]) || (($_SESSION[$this->nsession]['usuario'] == ""))) redirect('login');
        $tiempo = date('YmdHis');
        $this->fv = 'dashboard'; // form validation variable
        $this->mainView = 'dashboard';
        $this->data['title'] = 'Panel Evidencias | Encargados';
        $this->data['fjs'] = '';
        $this->data['js'] = '';
        $this->data['css'] = '';

        $this->load->model(array('mencargados', 'mtiendas'));

        $this->load->library('form_validation');
    }
    //funcion index para mostrar todos los encargados
    public function index()
    {
        $data = $this->data;
        $data['menu'] = 'encargados';
        $data['encargados'] = $this->mencargados->getAll();

        //$data['usuario'] = $this->data['usuario'];

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('encargados/index', $data);
        $this->load->view('layout/footer');
    }

    //funcion crear para mostrar el formulario de registro de encargados
    public function crear()
    {
        $data = $this->data;
        $data['menu'] = 'encargados';
        $data['headline'] = "Nuevo Encargado";
        $data['subheadline'] = "Registra un encargado y asigna una tienda disponible.";
        $data['backUrl'] = base_url('encargados');
        $data['action'] = base_url('encargados/guardar');
        $data['tiendas'] = $this->mtiendas->getDisponibles();
        //$data['usuario'] = $this->data['usuario'];

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('encargados/crear', $data);
        $this->load->view('layout/footer');
    }
    //funcion guardar para guardar el encargado anterior
    /*public function guardar() {
        $this->form_validation->set_rules('nombre', 'Nombre', 'required');
        $this->form_validation->set_rules('telefono', 'Teléfono', 'required');

        if (!$this->form_validation->run()) {
            $this->crear();
            return;
        }

        $data = [
            'nombre' => $this->input->post('nombre'),
            'telefono' => $this->input->post('telefono'),
            'email' => $this->input->post('email'),
            'tienda_id' => $this->input->post('tienda_id'),
            'activo' => $this->input->post('activo'),
            'created_at' => date('Y-m-d H:i:s')
        ];

        $this->mencargados->insert($data);

        redirect('encargados');
    }*/
    //funcion guardar para guardar el encargado con validaciones nuevo
    public function guardar()
    {

        // Normalizar y agregar prefijo 52
        $telefono_sin_prefijo = preg_replace('/\D+/', '', $this->input->post('telefono_sin_prefijo', true));
        $telefono = '52' . $telefono_sin_prefijo;

        $email = $this->normalize_email($this->input->post('email', true));

        // Pasar normalizados al POST para que form_validation valide eso
        $_POST['telefono'] = $telefono;
        $_POST['email']    = $email;

        // Form validation SOLO formato
        $this->form_validation->set_rules('nombre', 'Nombre', 'required|trim');
        $this->form_validation->set_rules(
            'telefono',
            'Teléfono',
            'required|numeric|exact_length[12]|regex_match[/^52[0-9]{10}$/]'
        );
        $this->form_validation->set_rules('email', 'Correo', 'required|valid_email');
        $this->form_validation->set_rules('tienda_id', 'Tienda', 'required');

        $this->form_validation->set_message(
            'regex_match',
            'El campo {field} debe tener formato 52 + 10 dígitos (ej. 521234567890).'
        );

        if (!$this->form_validation->run()) {
            // Mostrar errores
            $data = $this->data;
            $data['menu'] = 'encargados';
            $data['headline'] = "Nuevo Encargado";
            $data['subheadline'] = "Registra un encargado y asigna una tienda disponible.";
            $data['backUrl'] = base_url('encargados');
            $data['action'] = base_url('encargados/guardar');
            $data['tiendas'] = $this->mtiendas->getDisponibles();
            $data['error'] = validation_errors('<div>', '</div>');

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('encargados/crear', $data);
            $this->load->view('layout/footer');
            return;
        }

        // Validación por BD: teléfono y email únicos
        if ($this->exists_phone($telefono)) {
            $data = $this->data;
            $data['menu'] = 'encargados';
            $data['headline'] = "Nuevo Encargado";
            $data['subheadline'] = "Registra un encargado y asigna una tienda disponible.";
            $data['backUrl'] = base_url('encargados');
            $data['action'] = base_url('encargados/guardar');
            $data['tiendas'] = $this->mtiendas->getDisponibles();
            $data['error'] = "El teléfono ya está registrado en otro encargado.";

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('encargados/crear', $data);
            $this->load->view('layout/footer');
            return;
        }

        if ($this->exists_email($email)) {
            $data = $this->data;
            $data['menu'] = 'encargados';
            $data['headline'] = "Nuevo Encargado";
            $data['subheadline'] = "Registra un encargado y asigna una tienda disponible.";
            $data['backUrl'] = base_url('encargados');
            $data['action'] = base_url('encargados/guardar');
            $data['tiendas'] = $this->mtiendas->getDisponibles();
            $data['error'] = "El correo ya está registrado en otro encargado.";

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('encargados/crear', $data);
            $this->load->view('layout/footer');
            return;
        }

        $data = [
            'nombre'     => $this->input->post('nombre', true),
            'telefono'   => $telefono,
            'email'      => $email,
            'tienda_id'  => (int)$this->input->post('tienda_id'),
            'activo'     => (int)$this->input->post('activo'),
            'created_at' => date('Y-m-d H:i:s')
        ];

        $this->mencargados->insert($data);
        redirect('encargados');
    }

    public function editar($id)
    {
        $data = $this->data;
        $data['menu'] = 'encargados';
        $data['headline'] = "Editar Encargado";
        $data['subheadline'] = "Actualiza información y/o cambia la tienda asignada.";
        $data['backUrl'] = base_url('encargados');
        $data['action'] = base_url('encargados/actualizar/' . $id);
        $data['encargado'] = $this->mencargados->getById($id);
        $data['tiendas'] = $this->mtiendas->getDisponibles($id);

        //$data['usuario'] = $this->data['usuario'];

        if (!$data['encargado']) redirect('encargados');

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('encargados/editar', $data);
        $this->load->view('layout/footer');
    }

    /*public function actualizar($id) {
        $this->form_validation->set_rules('nombre', 'Nombre', 'required');
        $this->form_validation->set_rules('telefono', 'Teléfono', 'required');

        if (!$this->form_validation->run()) {
            $this->editar($id);
            return;
        }

        $data = [
            'nombre' => $this->input->post('nombre'),
            'telefono' => $this->input->post('telefono'),
            'email' => $this->input->post('email'),
            'tienda_id' => $this->input->post('tienda_id'),
            'activo' => $this->input->post('activo'),
        ];

        $this->mencargados->updateData($id, $data);

        redirect('encargados');
    }*/

    public function actualizar($id){

        // Normalizar y agregar prefijo 52
        $telefono_sin_prefijo = preg_replace('/\D+/', '', $this->input->post('telefono_sin_prefijo', true));
        $telefono = '52' . $telefono_sin_prefijo;

        $email = $this->normalize_email($this->input->post('email', true));

        $_POST['telefono'] = $telefono;
        $_POST['email']    = $email;

        // Form validation SOLO formato
        $this->form_validation->set_rules('nombre', 'Nombre', 'required|trim');
        $this->form_validation->set_rules(
            'telefono',
            'Teléfono',
            'required|numeric|exact_length[12]|regex_match[/^52[0-9]{10}$/]'
        );
        $this->form_validation->set_rules('email', 'Correo', 'required|valid_email');
        $this->form_validation->set_rules('tienda_id', 'Tienda', 'required');

        $this->form_validation->set_message(
            'regex_match',
            'El campo {field} debe tener formato 52 + 10 dígitos (ej. 521234567890).'
        );

        if (!$this->form_validation->run()) {
            // Re-render editar con errores
            $data = $this->data;
            $data['menu'] = 'encargados';
            $data['headline'] = "Editar Encargado";
            $data['subheadline'] = "Actualiza información y/o cambia la tienda asignada.";
            $data['backUrl'] = base_url('encargados');
            $data['action'] = base_url('encargados/actualizar/' . $id);
            $data['encargado'] = $this->mencargados->getById($id);
            $data['tiendas'] = $this->mtiendas->getDisponibles($id);
            $data['error'] = validation_errors('<div>', '</div>');

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('encargados/editar', $data);
            $this->load->view('layout/footer');
            return;
        }

        // Validación por BD (excluyendo este id)
        if ($this->exists_phone($telefono, $id)) {
            $data = $this->data;
            $data['menu'] = 'encargados';
            $data['headline'] = "Editar Encargado";
            $data['subheadline'] = "Actualiza información y/o cambia la tienda asignada.";
            $data['backUrl'] = base_url('encargados');
            $data['action'] = base_url('encargados/actualizar/' . $id);
            $data['encargado'] = $this->mencargados->getById($id);
            $data['tiendas'] = $this->mtiendas->getDisponibles($id);
            $data['error'] = "El teléfono ya está registrado en otro encargado.";

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('encargados/editar', $data);
            $this->load->view('layout/footer');
            return;
        }

        if ($this->exists_email($email, $id)) {
            $data = $this->data;
            $data['menu'] = 'encargados';
            $data['headline'] = "Editar Encargado";
            $data['subheadline'] = "Actualiza información y/o cambia la tienda asignada.";
            $data['backUrl'] = base_url('encargados');
            $data['action'] = base_url('encargados/actualizar/' . $id);
            $data['encargado'] = $this->mencargados->getById($id);
            $data['tiendas'] = $this->mtiendas->getDisponibles($id);
            $data['error'] = "El correo ya está registrado en otro encargado.";

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('encargados/editar', $data);
            $this->load->view('layout/footer');
            return;
        }

        $data = [
            'nombre'    => $this->input->post('nombre', true),
            'telefono'  => $telefono,
            'email'     => $email,
            'tienda_id' => (int)$this->input->post('tienda_id'),
            'activo'    => (int)$this->input->post('activo'),
        ];

        $this->mencargados->updateData($id, $data);
        redirect('encargados');
    }

    public function eliminar($id){
        $this->mencargados->delete($id);
        redirect('encargados');
    }

    private function normalize_phone($phone){
        return preg_replace('/\D+/', '', (string)$phone);
    }

    private function normalize_email($email){
        return trim(mb_strtolower((string)$email));
    }

    private function exists_phone($telefono, $ignore_id = null){
        $this->db->from('encargados')->where('telefono', $telefono);
        if (!empty($ignore_id)) $this->db->where('id !=', (int)$ignore_id);
        return $this->db->count_all_results() > 0;
    }

    private function exists_email($email, $ignore_id = null){
        $this->db->from('encargados');
        $this->db->where('LOWER(email)', $email); // CI pone comillas y escapa

        if (!empty($ignore_id)) $this->db->where('id !=', (int)$ignore_id);

        return $this->db->count_all_results() > 0;
    }
}
