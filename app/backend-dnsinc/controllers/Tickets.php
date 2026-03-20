<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tickets extends MY_Controller {
	public $data,$vParameters,$mainView,$fv;
	public function __construct(){
    parent::__construct();
    $this->nsession = $this->config->item('nsession');
    //sif (!isset($_SESSION[$this->nsession]) || (($_SESSION[$this->nsession]['usuario'] == ""))) redirect('login');
            $tiempo = date('YmdHis');
            $this->fv = 'dashboard'; // form validation variable
            $this->mainView = 'dashboard';
            $this->data['title'] = 'Panel Evidencias | Evidencias';
            $this->data['fjs'] = '';
            $this->data['js'] = '';
            $this->data['css'] = '';
            $this->load->model(array('mtickets', 'mincidencias'));
            $this->load->library('mailer');
    }

    public function index() {
        $data = $this->data;
        //$data['title'] = "Tickets";
        $data['menu'] = "tickets";
        $tipoFiltro = null;
        $tipo = '';
        if (!$data['is_admin']) { // rol 2
            $tipoFiltro = $data['usuario']['tipo_id'] ?? null;
            $tipos_ids = array_filter(array_map('intval', explode(',', $tipoFiltro)));
            $count = count($tipos_ids);
            $i=0;
            foreach($tipos_ids as $t){
                $i++;
                $tipoIncidencias = $this->mincidencias->getById(($t != null) ? $t : 0);
                $tipo .= (!empty($tipoIncidencias)) ? $tipoIncidencias->nombre : '';
                if($count != $i){
                    $tipo .= ' - ';
                }
            }
        }
        $data['tipo'] = $tipo;
        $data['tickets'] = $this->mtickets->getAll($tipoFiltro);
        //$data['usuario'] = $this->data['usuario'];
        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('tickets/index', $data);
        $this->load->view('layout/footer');
    }

    public function detalle($id) {
        $data = $this->data;
        //$data['title'] = "Detalle del Ticket";
        $data['menu'] = "tickets";
        $data['headline'] = "Detalle de la Evidencia";
        $data['subheadline'] = "Información completa del reporte y evidencias.";
        $data['backUrl'] = base_url('tickets');
        $tipoFiltro = null;
        if (!$data['is_admin']) {
            $tipoFiltro = $data['usuario']['tipo_incidencia_id'] ?? null;
        }
        $data['ticket'] = $this->mtickets->getById($id, $tipoFiltro);
        //$data['usuario'] = $this->data['usuario'];
        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('tickets/detalle', $data);
        $this->load->view('layout/footer');
    }

    public function cerrar($id)
    {
        $data = $this->data;
        $sess = $data['usuario'];
        // Si rol 2: proteger que solo cierre tickets de su tipo
        $tipoFiltro = null;
        if (!$data['is_admin']) {
            $tipoFiltro = $sess['tipo_id'] ?? null;
        }
        $ticket = $this->mtickets->getById($id, $tipoFiltro);
        if (!$ticket) {
            show_404();
            return;
        }
        // Si ya está cerrado, solo regresa
        if ($ticket->status === 'cerrado') {
            redirect('tickets/detalle/'.$id);
            return;
        }
        // Cerrar en BD
        $this->mtickets->cerrarTicket($id, $sess['usuario_id'] ?? null);
        // Enviar correo al encargado (si tiene email)
        if (!empty($ticket->encargado_email)) {
            $asunto = "Evidencia Folio: #{$ticket->id} - Cerrado";
            /*$html = '
            <div style="font-family: Arial, sans-serif; line-height:1.5;">
            <h2 style="margin:0 0 10px;">Tu incidencia fue cerrada</h2>
            <p>Hola <b>'.htmlspecialchars($ticket->encargado_nombre).'</b>,</p>
            <p>Te confirmamos que tu incidencia fue marcado como <b>CERRADO</b>.</p>
            <table cellpadding="6" cellspacing="0" style="border-collapse:collapse;">
                <tr><td><b>Incidencia</b></td><td>Folio: #'.$ticket->id.'</td></tr>
                <tr><td><b>Tienda</b></td><td>'.htmlspecialchars($ticket->tienda_nombre).' ('.htmlspecialchars($ticket->tienda_cc).')</td></tr>
                <tr><td><b>Tipo</b></td><td>'.htmlspecialchars($ticket->tipo_nombre).'</td></tr>
                <tr><td><b>Fecha de creación</b></td><td>'.date("d/m/Y H:i", strtotime($ticket->created_at)).'</td></tr>
            </table>
            <hr style="margin:15px 0;">
            <p style="margin:0;"><b>Descripción:</b></p>
            <p style="margin:6px 0 0;">'.nl2br(htmlspecialchars($ticket->descripcion)).'</p>
            <p style="margin-top:16px;color:#64748b;">
                Gracias.<br>Sistema de Incidencias
            </p>
            </div>';*/
            $data2['incidencia'] = $this->mtickets->getById($id, $tipoFiltro);
            $html = $this->load->view('tickets/correo', $data2, TRUE);
            $this->mailer->enviarIncidencia([$ticket->encargado_email], $asunto, $html, null);
        }
        redirect('tickets');
    }

}
