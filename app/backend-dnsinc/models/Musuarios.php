<?php
class Musuarios extends MY_Model
{
    protected $table = 'usuarios';

    public function login($usuario, $password_plain)
    {
        $this->db->where('usuario', $usuario);
        $this->db->where('activo', 1);
        $user = $this->db->get($this->table)->row();

        if ($user) {
            // Verificación con Bcrypt (Estándar de seguridad reportado)
            if (password_verify($password_plain, $user->password)) {
                return $user;
            }
            // Fallback temporal para hashes SHA1 previos
            if (sha1($password_plain) === $user->password) {
                return $user;
            }
        }

        return null; // Usuario no encontrado o contraseña incorrecta
    }

    public function getAll()
    {
        return $this->db
            ->select("
                u.*,
                GROUP_CONCAT(t.nombre ORDER BY t.id SEPARATOR ', ') AS tipo_nombre
            ")
            ->from("usuarios u")
            ->join("tipos_incidencia t", "FIND_IN_SET(t.id, u.tipo_id) > 0", "left", false)
            ->group_by("u.id")
            ->order_by("u.id", "DESC")
            ->where('u.activo !=', 2)
            ->get()
            ->result();
    }

    public function getById($id)
    {
        return $this->db->get_where($this->table, ['id' => (int)$id])->row();
    }

    public function existsUsuario($usuario, $except_id = null)
    {
        $this->db->from($this->table)->where('usuario', $usuario)->where('activo !=', 2);
        if (!empty($except_id)) $this->db->where('id !=', (int)$except_id);
        return $this->db->count_all_results() > 0;
    }

    public function insert($data)
    {
        return $this->db->insert($this->table, $data);
    }

    public function updateData($id, $data)
    {
        return $this->db->where('id', (int)$id)->update($this->table, $data);
    }

    public function deleteData($id)
    {
        $data = ['activo' => 2];
        return $this->db->where('id', (int)$id)->update($this->table, $data);
    }
}
