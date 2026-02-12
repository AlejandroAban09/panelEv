<?php
class Mtiendas extends MY_Model
{

    protected $table = "tiendas";

    public function getAll()
    {
        $this->db->select('t.*, g.nombre as gerente_nombre, s.nombre as supervisor_nombre');
        $this->db->from($this->table . ' t');
        $this->db->join('gerentes g', 't.gerente = g.id', 'left');
        $this->db->join('supervisores s', 't.supervisor = s.id', 'left');
        $this->db->where('t.activo !=', 2);
        $this->db->order_by('t.id', 'DESC');
        return $this->db->get()->result();
    }

    public function getById($id)
    {
        return $this->db->where('id', $id)->get($this->table)->row();
    }

    public function insert($data)
    {
        return $this->db->insert($this->table, $data);
    }

    public function updateData($id, $data)
    {
        return $this->db->where('id', $id)->update($this->table, $data);
    }

    public function deleteData($id)
    {
        $data = ['activo' => 2];
        return $this->db->where('id', $id)->update($this->table, $data);
    }

    public function getDisponibles($encargado_id = null)
    {
        // Si estás editando, permitimos la tienda actual del encargado
        $tienda_actual = null;
        if (!empty($encargado_id)) {
            $row = $this->db->select('tienda_id')
                ->get_where('encargados', ['id' => (int)$encargado_id])
                ->row();
            $tienda_actual = $row ? (int)$row->tienda_id : null;
        }

        $this->db->select('t.id, t.nombre, t.centro_costo');
        $this->db->from('tiendas t');

        // Join filtrando solo encargados activos
        // De esta forma, si hay un encargado pero está soft-deleted, el JOIN devuelve NULL
        $this->db->join('encargados e', 'e.tienda_id = t.id AND e.activo != 2', 'left');

        $this->db->group_start();
        $this->db->where('e.id', NULL);
        if (!empty($tienda_actual)) {
            $this->db->or_where('t.id', $tienda_actual);
        }
        $this->db->group_end();

        $this->db->where('t.activo !=', 2); // Solo tiendas activas (no eliminadas)

        $this->db->order_by('t.id', 'ASC');

        return $this->db->get()->result();
    }
}
