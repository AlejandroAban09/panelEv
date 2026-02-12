<?php
// Demo de Inyección SQL y Seguridad
// Ejecutar con: php tests/demo_sqli.php

$host = 'localhost';
$user = 'root';
$pass = '';
$db   = 'dunosusa_db';

// 1. Conexión Directa (Simulando el Core)
$mysqli = new mysqli($host, $user, $pass, $db);

if ($mysqli->connect_error) {
    die("Error de conexión: " . $mysqli->connect_error);
}

echo "\n=======================================================\n";
echo "    PRUEBA DE CONCEPTO: INYECCIÓN SQL (Login)\n";
echo "=======================================================\n";

// Datos del 'Hacker'
$usuario_input = "admin";
// El payload: Cierra la comilla, pone una condición siempre verdadera, y comenta el resto
$password_input = "' OR '1'='1";

echo "Usuario ingresado:  " . $usuario_input . "\n";
echo "Password ingresado: " . $password_input . "\n\n";


// -----------------------------------------------------------------------------
// ESCENARIO 1: CÓDIGO INSEGURO (Mala práctica)
// -----------------------------------------------------------------------------
echo "1. INTENTO DE HACKEO EN CÓDIGO INSEGURO (Sin protección)...\n";

// Aquí concatenamos directamente las variables en la cadena SQL. ¡PELIGROSO!
$sql_vulnerable = "SELECT * FROM usuarios WHERE usuario = '$usuario_input' AND password = '$password_input'";

echo "   [SQL Ejecutado]: $sql_vulnerable\n";

// Ejecutamos la consulta mala
$resultado = $mysqli->query($sql_vulnerable);

if ($resultado && $resultado->num_rows > 0) {
    $usuario_hackeado = $resultado->fetch_assoc();
    echo "   [RESULTADO]: ❌ ¡HACKEO EXITOSO! Se inició sesión como: " . $usuario_hackeado['usuario'] . "\n";
    echo "   (El sistema interpretó 'OR 1=1' como código SQL válido)\n";
} else {
    echo "   [RESULTADO]: Acceso denegado (Curioso, debería haber funcionado si hay usuarios).\n";
}

echo "\n-------------------------------------------------------\n\n";


// -----------------------------------------------------------------------------
// ESCENARIO 2: CÓDIGO SEGURO (Como lo hace CodeIgniter)
// -----------------------------------------------------------------------------
echo "2. INTENTO DE HACKEO EN TU SISTEMA (Protegido con CodeIgniter/Escaping)...\n";

// CodeIgniter usa escaping automático o Prepared Statements. Simulemos el Escaping.
$usuario_seguro = $mysqli->real_escape_string($usuario_input);
$password_seguro = $mysqli->real_escape_string($password_input);

// OJO: Al usar Query Builder de CI ($this->db->where...), esto pasa automáticamente.
$sql_seguro = "SELECT * FROM usuarios WHERE usuario = '$usuario_seguro' AND password = '$password_seguro'";

echo "   [SQL Ejecutado]: $sql_seguro\n";

$resultado2 = $mysqli->query($sql_seguro);

if ($resultado2 && $resultado2->num_rows > 0) {
    echo "   [RESULTADO]: ❌ ¡HACKEO EXITOSO! (Esto no debería pasar)\n";
} else {
    echo "   [RESULTADO]: ✅ ACCESO DENEGADO. Sistema Seguro.\n";
    echo "   (El sistema trató la inyección como texto literal, no como comandos)\n";
}

echo "\n=======================================================\n";

$mysqli->close();
