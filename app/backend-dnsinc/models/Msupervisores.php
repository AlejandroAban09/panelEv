<?php
class Msupervisores extends MY_Model
{
    protected $table = "supervisores";

    public function getAll()
    {
        return $this->db
            ->select("supervisores.*, GROUP_CONCAT(tiendas.nombre SEPARATOR ', ') AS tiendas_nombres")
            ->from("supervisores")
            ->join("tiendas", "tiendas.supervisor = supervisores.id AND tiendas.activo != 2", "left")
            ->where('supervisores.activo !=', 2)
            ->group_by("supervisores.id")
            ->order_by("supervisores.id", "DESC")
            ->get()
            ->result();
    }

    public function getById($id)
    {
        return $this->db->get_where($this->table, ['id' => $id])->row();
    }

    public function insert($data)
    {
        return $this->db->insert($this->table, $data);
    }

    public function updateData($id, $data)
    {
        return $this->db->update($this->table, $data, ["id" => $id]);
    }

    public function deleteData($id)
    {
        $data = [
            'activo' => 2
        ];
        return $this->db->update($this->table, $data, ["id" => $id]);
    }
}
