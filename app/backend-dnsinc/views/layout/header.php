<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title><?= isset($title) ? $title : 'Panel de Administración' ?></title>

    <base href="<?php echo base_url(); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">

    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap5.min.css">

    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />


    <style>
        body {
            background-color: #f5f6fa;
            font-family: 'Inter', sans-serif;
            overflow-x: hidden;
        }

        /* SIDEBAR */
        .sidebar {
            width: 260px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background: #040051ff;
            color: #fff;
            transition: all 0.3s ease-in-out;
            z-index: 1030;
            transform: translateX(0);
            /* por defecto visible */
        }

        .sidebar .nav-link {
            color: #cbd5e1;
            font-weight: 500;
            border-radius: 6px;
            padding: 10px 15px;
            margin-bottom: 2px;
        }

        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background: #0087cbff;
            color: #fff;
        }

        /* NAVBAR SUPERIOR */
        .top-navbar {
            position: sticky;
            top: 0;
            height: 60px;
            display: flex;
            align-items: center;
            padding: 0 20px;
            background: #de2b09;
            z-index: 1040;
            /* mayor que sidebar */
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.05);
            transition: margin-left 0.3s ease-in-out;
            margin-left: 260px;
            color: white;
        }

        body.sidebar-toggled .top-navbar {
            margin-left: 0 !important;
        }

        .btn-toggle-sidebar {
            font-size: 26px;
            cursor: pointer;
            margin-right: 10px;
        }

        /* CONTENIDO PRINCIPAL */
        .content {
            margin-left: 260px;
            padding: 30px 20px;
            transition: margin-left 0.3s ease-in-out;
        }

        body.sidebar-toggled .content {
            margin-left: 0 !important;
        }

        /* Mantener look & feel Bootstrap 5 + tamaño grande */
        .select2-container .select2-selection--single {
            height: calc(1.5em + 1rem + 2px) !important;
            /* similar a .form-select-lg */
            padding: .5rem 1rem !important;
            border-radius: .5rem !important;
            border: 1px solid #dee2e6 !important;
        }

        /* .select2-container--default .select2-selection--single .select2-selection__rendered{ */
        /*line-height: calc(1.5em + 1rem) !important;*/
        /* } */
        .select2-container--default .select2-selection--single .select2-selection__arrow {
            height: calc(1.5em + 1rem + 2px) !important;
        }

        /* Botones soft (modernos) */
        .btn-soft {
            border: 1px solid transparent;
            background: rgba(15, 23, 42, .06);
            color: #0f172a;
        }

        .btn-soft:hover {
            background: rgba(15, 23, 42, .10);
        }

        .btn-soft-primary {
            background: rgba(79, 70, 229, .10);
            color: #4f46e5;
        }

        .btn-soft-primary:hover {
            background: rgba(79, 70, 229, .16);
        }

        .btn-soft-danger {
            background: rgba(220, 53, 69, .10);
            color: #dc3545;
        }

        .btn-soft-danger:hover {
            background: rgba(220, 53, 69, .16);
        }

        .btn-soft-info {
            background: rgba(54, 169, 225, .10);
            color: #36a9e1;
        }

        .btn-soft-info:hover {
            background: rgba(54, 169, 225, .16);
        }

        /* Botón de acción compacto */
        .btn-action {
            width: 38px;
            height: 38px;
            padding: 0;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
        }

        /* Botón “detalle” tipo pill */
        .btn-detail {
            border-radius: 999px;
            padding: .35rem .7rem;
            font-weight: 600;
            display: inline-flex;
            gap: .45rem;
            align-items: center;
        }

        /* Mejor alineación de iconos */
        .btn i.bi {
            font-size: 1.05rem;
        }

        .form-label {
            font-weight: 650;
        }

        .form-control,
        .form-select {
            border-radius: 12px;
        }

        .card .card-body {
            line-height: 1.35;
        }

        /* Evita sensación de “cuadriculado” */
        .form-block {
            margin-bottom: 18px;
        }

        /* === COMPORTAMIENTO RESPONSIVO === */

        /* En móvil: por defecto sidebar oculto, se ve solo con .collapsed */
        @media (max-width: 991px) {

            .sidebar {
                transform: translateX(-100%);
                /* OCULTO por defecto en móvil */
            }

            /* NUEVO: Si tiene la clase toggled: Sidebar VISIBLE */
            body.sidebar-toggled .sidebar {
                transform: translateX(0);
                /* VISIBLE cuando tiene .sidebar-toggled */
                top: 5%;
            }

            .top-navbar {
                margin-left: 0 !important;
            }

            .content {
                margin-left: 0 !important;
            }
        }

        /* En desktop: .sidebar visible, .sidebar-toggled oculto */
        @media (min-width: 992px) {
            body.sidebar-toggled .sidebar {
                transform: translateX(-100%);
            }
        }
    </style>
    <style>
        /* DataTables Responsive Control Styling */
        table.dataTable.dtr-inline.collapsed>tbody>tr>td.dtr-control:before,
        table.dataTable.dtr-inline.collapsed>tbody>tr>th.dtr-control:before {
            background-color: #0d6efd;
            /* Bootstrap Primary Blue by default, or verify if green is desired based on screenshot */
            /* Based on screenshot, it looks blue with a plus. Let's stick to standard or customize.
           User said "se guarda en el boton +". Screenshot 1 shows a blue plus. 
           Screenshot 3 shows a red minus when expanded. 
           Bootstrap 5 style is usually fine, but let's ensure it looks good. */
        }

        /* Custom Green/Blue style if needed to match theme */
        .page-item.active .page-link {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }

        /* --- DARK MODE --- */
        body.dark-mode {
            background-color: #121212;
            color: #e0e0e0;
        }

        body.dark-mode .sidebar {
            background: #1a1a1a;
            border-right: 1px solid #333;
        }

        body.dark-mode .top-navbar {
            background: #1a1a1a;
            border-bottom: 1px solid #333;
            color: #fff;
        }

        body.dark-mode .card {
            background-color: #1e1e1e;
            border-color: #333;
            color: #e0e0e0;
        }

        body.dark-mode .form-control,
        body.dark-mode .form-select {
            background-color: #2d2d2d;
            border-color: #444;
            color: #fff;
        }

        body.dark-mode .table {
            color: #e0e0e0;
            border-color: #333;
        }

        body.dark-mode .table-striped>tbody>tr:nth-of-type(odd)>* {
            background-color: #2c2c2c;
            color: #e0e0e0;
        }

        body.dark-mode .table-light {
            --bs-table-bg: #2d2d2d;
            --bs-table-color: #fff;
        }

        body.dark-mode .modal-content {
            background-color: #1a1a1a;
            color: #e0e0e0;
        }

        body.dark-mode h1,
        body.dark-mode h2,
        body.dark-mode h3,
        body.dark-mode h4,
        body.dark-mode h5,
        body.dark-mode h6,
        body.dark-mode .text-dark {
            color: #f5f5f5 !important;
        }
    </style>
</head>

<?php
// NUEVO: Leemos cookies para Sidebar y Tema
$sidebarState = get_cookie('sidebar_state');
$themeMode    = get_cookie('theme_mode');

$bodyClass = '';
if ($sidebarState === 'toggled') $bodyClass .= ' sidebar-toggled';
if ($themeMode === 'dark')       $bodyClass .= ' dark-mode';
?>

<body class="<?= trim($bodyClass) ?>">