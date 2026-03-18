<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Migracion extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        // Solo para admin o dev. Al extender MY_Controller, ya validamos sesión de usuario logueado.
        // if (!$this->data['is_admin']) { show_error('Acceso denegado', 403); }
    }

    public function index()
    {
        echo "<h1>Script de Rescate / Migración</h1>";
        echo "<p>Migrando nombres de Gerentes y Supervisores de la tabla 'tiendas' a las nuevas tablas relacionales...</p>";

        $tiendas = $this->db->get('tiendas')->result();

        $countGerentes = 0;
        $countSupervisores = 0;

        foreach ($tiendas as $t) {
            // --- MIGRACIÓN GERENTES ---
            $gerenteVal = $t->gerente; // Puede ser nombre 'Ana' o ID '5'

            // Solo procesar si NO es numérico (asumimos que si es numérico ya es un ID)
            // Y si no está vacío
            if (!empty($gerenteVal) && !is_numeric($gerenteVal)) {

                // Buscar si ya existe este nombre en la tabla gerentes
                $existingG = $this->db->get_where('gerentes', ['nombre' => $gerenteVal])->row();

                if ($existingG) {
                    $newId = $existingG->id;
                } else {
                    // Crear nuevo gerente
                    $dataInsert = [
                        'nombre' => $gerenteVal,
                        'telefono' => '520000000000', // Placeholder
                        'email' => null,
                        'activo' => 1,
                    ];
                    $this->db->insert('gerentes', $dataInsert);
                    $newId = $this->db->insert_id();
                }

                // Actualizar tienda con el nuevo ID
                $this->db->where('id', $t->id)->update('tiendas', ['gerente' => $newId]);
                $countGerentes++;
                echo "Tienda {$t->id}: Gerente '{$gerenteVal}' migrado a ID {$newId}<br>";
            }


            // --- MIGRACIÓN SUPERVISORES ---
            $supervisorVal = $t->supervisor;

            if (!empty($supervisorVal) && !is_numeric($supervisorVal)) {

                // Buscar si ya existe
                $existingS = $this->db->get_where('supervisores', ['nombre' => $supervisorVal])->row();

                if ($existingS) {
                    $newIdS = $existingS->id;
                } else {
                    // Crear nuevo supervisor
                    $dataInsertS = [
                        'nombre' => $supervisorVal,
                        'telefono' => '520000000000', // Placeholder
                        'email' => null,
                        'activo' => 1
                    ];
                    $this->db->insert('supervisores', $dataInsertS);
                    $newIdS = $this->db->insert_id();
                }

                // Actualizar tienda
                $this->db->where('id', $t->id)->update('tiendas', ['supervisor' => $newIdS]);
                $countSupervisores++;
                echo "Tienda {$t->id}: Supervisor '{$supervisorVal}' migrado a ID {$newIdS}<br>";
            }
        }

        echo "<hr>";
        echo "<strong>Proceso Completado.</strong><br>";
        echo "Gerentes actualizados: $countGerentes<br>";
        echo "Supervisores actualizados: $countSupervisores<br>";
    }

    public function add_soft_delete_columns()
    {
        echo "<h1>Actualizando Base de Datos para Soft Delete</h1>";

        $tablas = ['usuarios', 'gerentes', 'supervisores', 'encargados', 'tiendas'];

        foreach ($tablas as $tabla) {
            // Verificar si la tabla existe
            if (!$this->db->table_exists($tabla)) {
                echo "La tabla <strong>$tabla</strong> no existe. Saltando...";
                continue;
            }

            // Verificar si la columna ya existe
            $fields = $this->db->list_fields($tabla);
            if (in_array('deleted_at', $fields)) {
                echo "La tabla <strong>$tabla</strong> ya tiene la columna 'deleted_at'.";
            } else {
                // Agregar columna
                $sql = "ALTER TABLE `$tabla` ADD COLUMN `deleted_at` DATETIME NULL DEFAULT NULL AFTER `activo`";
                // Si 'activo' no existe, lo ponemos al final
                if (!in_array('activo', $fields)) {
                    $sql = "ALTER TABLE `$tabla` ADD COLUMN `deleted_at` DATETIME NULL DEFAULT NULL";
                }

                if ($this->db->query($sql)) {
                    echo "Columna 'deleted_at' agregada a <strong>$tabla</strong>.";
                } else {
                    echo "Error al agregar columna a <strong>$tabla</strong>.";
                }
            }
        }

        echo "<hr><strong>Proceso terminado.</strong>";
    }
}
