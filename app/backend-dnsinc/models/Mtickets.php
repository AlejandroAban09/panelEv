<?php
class Mtickets extends MY_Model
{

    protected $table = "tickets";
    //Obtener todos los tickets
    public function getAll($tipo_id = null)
    {
        $this->db
            ->select("
                tickets.*, 
                encargados.nombre AS encargado_nombre,
                tiendas.nombre AS tienda_nombre,
                tiendas.centro_costo AS tienda_cc,
                tipos_incidencia.nombre AS tipo_nombre,
                COALESCE(g_snap.nombre, g_curr.nombre) AS gerente_nombre,
                COALESCE(s_snap.nombre, s_curr.nombre) AS supervisor_nombre
            ")
            ->join("encargados", "encargados.id = tickets.encargado_id", "left")
            ->join("tiendas", "tiendas.id = tickets.tienda_id", "left")
            ->join("tipos_incidencia", "tipos_incidencia.id = tickets.tipo_id", "left")
            // Joins para Gerentes (Snapshot vs Actual)
            ->join("gerentes g_snap", "g_snap.id = tickets.gerente_id", "left")
            ->join("gerentes g_curr", "g_curr.id = tiendas.gerente", "left")
            // Joins para Supervisores (Snapshot vs Actual)
            ->join("supervisores s_snap", "s_snap.id = tickets.supervisor_id", "left")
            ->join("supervisores s_curr", "s_curr.id = tiendas.supervisor", "left")

            ->order_by("tickets.id", "DESC");

        if (!empty($tipo_id)) {
            $tipos_ids = array_filter(array_map('intval', explode(',', $tipo_id)));
            $this->db->where_in('tickets.tipo_id', $tipos_ids);
        }

        return $this->db->get("tickets")->result();
    }

    //Obtener un ticket por id
    public function getById($id, $tipo_id = null)
    {
        $this->db
            ->select("
                tickets.*, 
                encargados.nombre AS encargado_nombre,
                encargados.telefono AS encargado_tel,
                encargados.email AS encargado_email,
                tiendas.nombre AS tienda_nombre,
                tiendas.centro_costo AS tienda_cc,
                tipos_incidencia.nombre AS tipo_nombre,
                COALESCE(g_snap.nombre, g_curr.nombre) AS gerente_nombre,
                COALESCE(s_snap.nombre, s_curr.nombre) AS supervisor_nombre
            ")
            ->join("encargados", "encargados.id = tickets.encargado_id", "left")
            ->join("tiendas", "tiendas.id = tickets.tienda_id", "left")
            ->join("tipos_incidencia", "tipos_incidencia.id = tickets.tipo_id", "left")
            // Joins para Gerentes
            ->join("gerentes g_snap", "g_snap.id = tickets.gerente_id", "left")
            ->join("gerentes g_curr", "g_curr.id = tiendas.gerente", "left")
            // Joins para Supervisores
            ->join("supervisores s_snap", "s_snap.id = tickets.supervisor_id", "left")
            ->join("supervisores s_curr", "s_curr.id = tiendas.supervisor", "left")

            ->where("tickets.id", (int)$id);

        if (!empty($tipo_id)) {
            $tipos_ids = array_filter(array_map('intval', explode(',', $tipo_id)));
            $this->db->where_in('tickets.tipo_id', $tipos_ids);
            //$this->db->where("tickets.tipo_id", (int)$tipo_id);
        }

        return $this->db->get("tickets")->row();
    }

    //Cerrar un ticket
    public function cerrarTicket($id, $closed_by = null)
    {
        $data = [
            'status' => 'cerrado',
            'closed_at' => date('Y-m-d H:i:s')
        ];

        if (!empty($closed_by)) {
            $data['closed_by'] = (int)$closed_by;
        }

        return $this->db->where('id', (int)$id)->update('tickets', $data);
    }
}
