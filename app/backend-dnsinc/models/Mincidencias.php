<?php
class Mincidencias extends MY_Model{

	protected $table = "tipos_incidencia";

    public function getAll() {
        return $this->db->order_by("id", "DESC")->get($this->table)->result();
    }

    public function getById($id) {
        return $this->db->where("id", $id)->get($this->table)->row();
    }

    public function insert($data) {
        return $this->db->insert($this->table, $data);
    }

    public function updateData($id, $data) {
        return $this->db->where("id", $id)->update($this->table, $data);
    }

    public function deleteData($id) {
        return $this->db->where("id", $id)->delete($this->table);
    }

    public function countAll() {
        return $this->db
            ->select("COUNT(*) AS total") 
			->get($this->table)
			->row();
    }
	
}
?>