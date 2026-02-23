<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title><?= isset($title) ? $title : 'Iniciar sesión' ?></title>

    <!-- Descripcion de la pagina de acceso del sistema -->
    <meta name="description" content="Acceso al panel de administración de evidencias - DunoSusa.">

    <!-- Evita que los buscadores indexen la pagina de login -->
    <meta name="robots" content="noindex, nofollow">

    <base href="<?php echo base_url(); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon del sistema -->
    <link rel="icon" href="<?= base_url('assets/images/icono.png') ?>" type="image/png">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #ededed;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            /* evita el corte del card en móviles */
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
        }

        .login-card {
            max-width: 420px;
            width: 100%;
            background: #040051;
            border-radius: 18px;
            box-shadow: 0 20px 40px rgba(15, 23, 42, 0.45);
            padding: 32px 30px;
            animation: fadeIn 0.4s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-logo {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background: #eef2ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: #4f46e5;
            margin-bottom: 12px;
        }

        .form-control {
            border-radius: 10px;
        }

        .btn-primary {
            border-radius: 10px;
            background: #4f46e5;
            border-color: #4f46e5;
        }

        .btn-primary:hover {
            background: #4338ca;
            border-color: #4338ca;
        }

        .small-text {
            font-size: 0.85rem;
            color: #6b7280;
        }

        /* RESPONSIVE ADJUSTMENTS ONLY */

        @media (max-width: 480px) {

            body {
                padding: 10px;
            }

            .login-card {
                padding: 24px 22px;
                /* reduce el padding para que no se vea apretado */
                border-radius: 14px;
                /* bordes más suaves en móviles */
            }

            h4 {
                font-size: 1.3rem;
            }

            .login-logo {
                width: 42px;
                height: 42px;
                font-size: 20px;
            }
        }
    </style>
</head>

<body>

    <div style="position: absolute;top: 2%;left: 2%;">
        <img class="img-fluid" src="assets/images/logo.png" alt="" width="70%">
    </div>

    <div class="login-card">
        <div class="text-center mb-3">
            <div class="login-logo">
                <span><img src="assets/images/icono.png" alt=""></span>
            </div>
            <h4 class="fw-semibold mb-0 text-white">Panel de Evidencias</h4>
            <p class="small-text mt-1 text-white">Inicia sesión para administrar el sistema</p>
        </div>

        <?php if (!empty($error)): ?>
            <div class="alert alert-danger small-text py-2">
                <?= $error ?>
            </div>
        <?php endif; ?>

        <form method="post" action="<?= base_url('login') ?>">
            <div class="mb-3">
                <label for="usuario" class="form-label text-white">Usuario</label>
                <input type="text" class="form-control" id="usuario" name="usuario" value="<?= set_value('usuario') ?>"
                    autocomplete="off" autofocus>
            </div>

            <div class="mb-4">
                <label for="password" class="form-label text-white">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password" autocomplete="off">
            </div>

            <button type="submit" class="btn btn-primary w-100 mb-2" style="background: #de2b09;border-color: #de2b09;">
                Iniciar sesión
            </button>

            <p class="small-text text-center mt-2 mb-0 text-white">
                Acceso restringido para personal autorizado.
            </p>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>