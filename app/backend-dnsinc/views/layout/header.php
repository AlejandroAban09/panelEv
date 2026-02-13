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
        /* Custom Stat Cards (Light Mode Default) */
        .card-stat {
            background-color: #cae4ed;
            color: #040051;
            transition: all 0.3s ease;
        }

        .stat-label,
        .stat-value,
        .text-brand {
            color: #040051;
        }

        /* --- DARK MODE (Coherent Slate/Dark Blue Theme) --- */
        body.dark-mode {
            background-color: #0f172a;
            /* Slate 900 - Dark Blue-Gray */
            color: #cbd5e1;
            /* Slate 300 - Soft Text */
        }

        body.dark-mode .sidebar {
            background: #020617;
            /* Slate 950 - Deepest Blue-Black */
            border-right: 1px solid #1e293b;
        }

        body.dark-mode .top-navbar {
            background: #020617;
            border-bottom: 1px solid #1e293b;
            color: #e2e8f0;
        }

        body.dark-mode .card {
            background-color: #1e293b;
            /* Slate 800 */
            border-color: #334155;
            /* Slate 700 */
            color: #cbd5e1;
        }

        /* Specific Override for Stat Cards in Dark Mode */
        body.dark-mode .card-stat {
            background-color: #1e293b;
            border: 1px solid #334155;
        }

        body.dark-mode .stat-label {
            color: #94a3b8;
            /* Slate 400 - Muted */
        }

        body.dark-mode .stat-value {
            color: #f8fafc;
            /* Slate 50 - Bright */
        }

        body.dark-mode .text-brand {
            color: #f8fafc !important;
        }

        body.dark-mode .form-control,
        body.dark-mode .form-select {
            background-color: #0f172a;
            border-color: #334155;
            color: #e2e8f0;
        }

        body.dark-mode .form-control::placeholder {
            color: #64748b;
        }

        /* Dark Mode Tables - Low Contrast & Consistent */
        body.dark-mode .table {
            --bs-table-bg: #1e293b;
            --bs-table-color: #cbd5e1;
            --bs-table-striped-bg: #0f172a;
            --bs-table-striped-color: #cbd5e1;
            --bs-table-hover-bg: #334155;
            --bs-table-hover-color: #fff;
            --bs-table-border-color: #334155;
            color: #cbd5e1;
            border-color: #334155;
        }

        body.dark-mode .table thead th {
            background-color: #020617;
            /* Slate 950 for Header */
            color: #f8fafc;
            border-bottom: 2px solid #334155;
            vertical-align: middle;
        }

        body.dark-mode .table-striped>tbody>tr:nth-of-type(odd)>* {
            background-color: var(--bs-table-striped-bg);
            color: var(--bs-table-striped-color);
            box-shadow: none;
        }

        body.dark-mode .table-striped>tbody>tr:nth-of-type(even)>* {
            background-color: var(--bs-table-bg);
            color: var(--bs-table-color);
        }

        /* Dark Mode Utilities Overrides */
        body.dark-mode .bg-light {
            background-color: #334155 !important;
            color: #f1f5f9 !important;
            border-color: #475569 !important;
        }

        body.dark-mode .bg-white {
            background-color: #1e293b !important;
            color: #f1f5f9 !important;
        }

        body.dark-mode .text-dark {
            color: #f1f5f9 !important;
        }

        body.dark-mode .text-secondary {
            color: #94a3b8 !important;
        }

        body.dark-mode .text-muted {
            color: #cbd5e1 !important;
            /* Fix for modal subtitle visibility */
        }

        /* Dark Mode List Groups (Modals) */
        body.dark-mode .list-group-item {
            background-color: transparent;
            color: #cbd5e1;
            border-color: #334155;
        }

        /* Specific Modal Fixes */
        body.dark-mode .modal-header,
        body.dark-mode .modal-footer {
            background-color: #1e293b !important;
            /* Force override inline bg-white */
            border-color: #334155;
        }

        body.dark-mode .btn-close {
            filter: invert(1) grayscale(100%) brightness(200%);
        }

        /* Fix Badge Icons */
        body.dark-mode .badge i {
            color: inherit !important;
            /* Inherit from parent badge text color */
        }

        /* Select2 Dropdown Dark Mode */
        body.dark-mode .select2-dropdown {
            background-color: #1e293b;
            border-color: #334155;
            color: #cbd5e1;
        }

        body.dark-mode .select2-results__option[aria-selected=true] {
            background-color: #334155;
        }

        body.dark-mode .modal-content {
            background-color: #1e293b;
            border: 1px solid #475569;
            color: #cbd5e1;
        }

        body.dark-mode h1,
        body.dark-mode h2,
        body.dark-mode h3,
        body.dark-mode h4,
        body.dark-mode h5,
        body.dark-mode h6,
        body.dark-mode .text-dark {
            color: #f1f5f9 !important;
        }

        /* Fix Select2 in Dark Mode */
        body.dark-mode .select2-container--default .select2-selection--single {
            background-color: #0f172a;
            border-color: #334155;
        }

        body.dark-mode .select2-container--default .select2-selection--single .select2-selection__rendered {
            color: #cbd5e1;
        }

        /* Theme Icons Toggle */
        body.dark-mode .icon-light-mode {
            display: none !important;
        }

        body.dark-mode .icon-dark-mode {
            display: inline-block !important;
        }

        /* Global Smooth Transition for Theme Switch */
        body,
        .sidebar,
        .top-navbar,
        .content,
        .card,
        .table,
        .table> :not(caption)>*>*,
        .modal-content,
        .form-control,
        .form-select,
        .list-group-item,
        .btn,
        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        p,
        span,
        i,
        a,
        div {
            transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease, box-shadow 0.3s ease;
        }
    </style>
</head><?php
        // NUEVO: Leemos cookies para Sidebar y Tema
        $sidebarState = get_cookie('sidebar_state');
        $themeMode    = get_cookie('theme_mode');

        $bodyClass = '';
        if ($sidebarState === 'toggled') $bodyClass .= ' sidebar-toggled';
        if ($themeMode === 'dark')       $bodyClass .= ' dark-mode';
        ?>

<body class="<?= trim($bodyClass) ?>">