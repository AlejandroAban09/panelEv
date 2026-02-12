<?php
class Mencargados extends MY_Model
{
    protected $table = "encargados";

    public function getAll()
    {
        return $this->db
            ->select("encargados.*, tiendas.nombre AS tienda_nombre, tiendas.centro_costo AS tienda_cc")
            ->join("tiendas", "tiendas.id = encargados.tienda_id")
            ->where('encargados.activo !=', 2)
            ->order_by("encargados.id", "DESC")
            ->get("encargados")
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

    public function delete($id)
    {
        $data = ['activo' => 2];
        return $this->db->update($this->table, $data, ["id" => $id]);
    }
}
