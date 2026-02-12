<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
// Validation default parameters
$config = array(
    'usuarios' => array(
        array(
            'field' => 'rol',
            'label' => 'Rol',
            'rules' => 'required'
        ),
        array(
            'field' => 'nombre',
            'label' => 'Nombre',
            'rules' => 'required'
        ),
        array(
            'field' => 'apellido',
            'label' => 'Apellidos',
            'rules' => 'trim'//required
        ),
        array(
            'field' => 'usuario',
            'label' => 'Usuario',
            'rules' => 'required|min_length[3]'
        ),
        array(
            'field' => 'password',
            'label' => 'Password',
            'rules' => 'required|min_length[3]'
        ),
        array(
            'field'   => 'password_2',
            'label'   => 'Confirmar Password',
            'rules'   => 'trim|required|matches[password]|min_length[3]'
        ),
        array(
            'field' => 'email',
            'label' => 'Email',
            'rules' => 'required|valid_email'
        )
    ),
    'usuarios_editar' => array(
        array(
            'field' => 'rol',
            'label' => 'Rol',
            'rules' => 'required'
        ),
        array(
            'field' => 'nombre',
            'label' => 'Nombre',
            'rules' => 'required'
        ),
        array(
            'field' => 'usuario',
            'label' => 'Usuario',
            'rules' => 'required'
        ),
        array(
            'field' => 'password',
            'label' => 'Password',
            'rules' => 'trim'
        ),
        array(
            'field'   => 'password_2',
            'label'   => 'Confirmar Password',
            'rules'   => 'trim'
        ),
        array(
            'field' => 'email',
            'label' => 'Email',
            'rules' => 'required|valid_email'
        )
    ),
    'blog' => array(
        array(
            'field' => 'titulo',
            'label' => 'Titulo',
            'rules' => 'required'
        ),
        array(
            'field' => 'foto',
            'label' => 'Foto Portada',
            'rules' => 'required'
        ),
        array(
            'field' => 'descripcion',
            'label' => 'Descripción',
            'rules' => 'required'
        ),
        array(
            'field' => 'foto_1',
            'label' => 'Foto',
            'rules' => 'required'
        ),
    ),
    
);


