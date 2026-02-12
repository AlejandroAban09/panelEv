<?php
// Script de Prueba de Concepto de Seguridad (SQL Injection)
// Este script intenta 'hackear' el login utilizando inyecciones SQL comunes.

// Definimos entorno para CLI
define('ENVIRONMENT', 'development');

// Asumimos que estamos en la carpeta raíz para el bootstrap
chdir(__DIR__ . '/..');

$system_path = 'app/system-dnsinc';
$application_folder = 'app/backend-dnsinc';

// Bootstrap básico de CodeIgniter para usar sus modelos
if (realpath($system_path) !== FALSE) {
    $system_path = realpath($system_path) . '/';
}
// Ensure there's a trailing slash
$system_path = rtrim($system_path, '/') . '/';

// Constants required by CI
define('SELF', pathinfo(__FILE__, PATHINFO_BASENAME));
define('BASEPATH', str_replace('\\', '/', $system_path));
define('FCPATH', __DIR__ . '/../');
define('SYSDIR', trim(strrchr(trim(BASEPATH, '/'), '/'), '/'));
define('APPPATH', $application_folder . '/');
define('VIEWPATH', APPPATH . 'views/');

require_once BASEPATH . 'core/CodeIgniter.php';

// Hack para obtener instancia de CI fuera del flujo web normal
$CI = &get_instance();
$CI->load->database();
$CI->load->model('Musuarios', 'musuarios');

echo "\n============================================\n";
echo "   PRUEBA DE SEGURIDAD: SQL INJECTION\n";
echo "============================================\n";

// Payload de Inyección: Intentar saltarse la contraseña
// En un sistema vulnerable, esto se convertiría en: WHERE password = '' OR '1'='1'
$payload_usuario = "admin";
$payload_pass = "' OR '1'='1"; // Payload clásico

echo "Intentando inyección SQL en el login...\n";
echo "Usuario: $payload_usuario\n";
echo "Password (Malicioso): $payload_pass\n\n";

// Ejecutamos el método login del modelo
// Nota: CodeIgniter Active Record escapa automáticamente los inputs.
// Si es vulnerable, devolverá un usuario. Si es seguro, devolverá NULL (o falso).
// Helper para el IDE
/** @var Musuarios $musuarios */
$musuarios = $CI->musuarios;
$user = $musuarios->login($payload_usuario, $payload_pass);

if ($user) {
    echo "FALLO DE SEGURIDAD DETECTADO!\n";
    echo "El sistema permitió el acceso con el payload de inyección.\n";
    print_r($user);
} else {
    echo "SISTEMA SEGURO.\n";
    echo "La inyección SQL falló. El modelo protegió la consulta correctamente.\n";
    echo "CodeIgniter escapó los caracteres especiales.\n";
}

echo "\n============================================\n";
