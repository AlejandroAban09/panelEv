<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {
	public $data,$vParameters,$mainView,$fv;
	public function __construct(){
    $this->nsession = $this->config->item('nsession');
    //if (!isset($_SESSION[$this->nsession]) || (($_SESSION[$this->nsession]['usuario'] == ""))) redirect('login');
            $tiempo = date('YmdHis');
            $this->fv = 'dashboard'; // form validation variable
            $this->mainView = 'dashboard';
            $this->data['title'] = 'PureCraft | Dashboard';
            $this->data['fjs'] = '';
            $this->data['js'] = '';
            $this->data['css'] = '';

        $this->load->model(array('musuarios'));
    }

    public function index()
    {

        $this->load->library('form_validation');

        // Si ya está logueado, lo mandamos al panel
        if ($this->session->userdata('usuario_id')) {
            redirect('panel');
            return;
        }

        $data = [];
        $data['title'] = 'Iniciar sesión';

        if ($this->input->method() === 'post') {

            $this->form_validation->set_rules('usuario', 'Usuario', 'required|trim');
            $this->form_validation->set_rules('password', 'Contraseña', 'required');

            if ($this->form_validation->run()) {

                $usuario  = $this->input->post('usuario', true);
                $password = $this->input->post('password', true);

                $user = $this->musuarios->login($usuario, $password);

                if ($user) {
                    // Guardar datos mínimos en sesión
                   $session_data = array(
                        'usuario_id'     => $user->id,
                        'usuario_nombre' => $user->nombre,
                        'usuario_user'   => $user->usuario,
                        'usuario_rol'    => $user->rol,
                        'tipo_id'        => $user->tipo_id,
                        'login'          => TRUE
                    );

                    $this->session->set_userdata($this->nsession, $session_data);

                    redirect('panel');
                    return;
                } else {
                    $data['error'] = 'Usuario o contraseña incorrectos, o usuario inactivo.';
                }
            } else {
                $data['error'] = validation_errors();
            }
        }

        $this->load->view('auth/login', $data);
    }

    public function logout()
    {
        $this->session->unset_userdata($this->nsession);
        $this->session->sess_destroy();
        redirect('login');
    }
}
