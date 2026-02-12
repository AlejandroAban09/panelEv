<?php
class Mgerentes extends MY_Model
{
    protected $table = "gerentes";

    public function getAll()
    {
        return $this->db
            ->select("gerentes.*, GROUP_CONCAT(tiendas.nombre SEPARATOR ', ') AS tiendas_nombres")
            ->from("gerentes")
            // Join con tiendas activas (ni soft-deleted ni eliminadas status 2)
            ->join("tiendas", "tiendas.gerente = gerentes.id AND tiendas.activo != 2", "left")
            ->where('gerentes.activo !=', 2)
            ->group_by("gerentes.id")
            ->order_by("gerentes.id", "DESC")
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
