<div class="sidebar" id="sidebar" style="overflow-y: auto;">

    <div class="d-flex justify-content-between align-items-center px-3 mt-3 mb-4">
        <!-- Logo del sistema en el sidebar -->
        <img class="img-fluid" src="assets/images/logo.png" alt="Logo DunoSusa" width="200">

        <!-- Botón para cerrar el sidebar en móvil -->
        <span class="btn-toggle-sidebar text-white d-lg-none" onclick="toggleSidebar()">✖</span>
    </div>

    <nav class="nav flex-column px-2">

        <a class="nav-link <?= ($menu == 'dashboard' ? 'active' : '') ?>" href="<?= base_url('panel') ?>">
            <span><img class="img-fluid" src="assets/images/home-white.png" alt="Icono panel" width="20" height="20" style="margin-top: -8px;margin-right: 4px;"></span> Panel
        </a>

        <hr>

        <a class="nav-link <?= ($menu == 'tickets' ? 'active' : '') ?>" href="<?= base_url('tickets') ?>">
            <span><img class="img-fluid" src="assets/images/tickets-white.png" alt="Icono evidencias" width="20" height="20" style="margin-top: -8px;margin-right: 4px;"></span> Evidencias
        </a>
        <a class="nav-link <?= ($menu == 'tiendas' ? 'active' : '') ?>" href="<?= base_url('tiendas') ?>">
            <span><img class="img-fluid" src="assets/images/tiendas-white.png" alt="Icono tiendas" width="20" height="20" style="margin-top: -8px;margin-right: 4px;"></span> Tiendas
        </a>

        <?php if ($is_admin): ?>

            <a class="nav-link <?= ($menu == 'incidencias' ? 'active' : '') ?>" href="<?= base_url('incidencias') ?>">
                <span><img class="img-fluid" src="assets/images/tipos-white.png" alt="Icono tipos evidencia" width="20" height="20" style="margin-top: -8px;margin-right: 4px;"></span> Tipos evidencia
            </a>

            <span class="text-uppercase small mt-3 mb-1 px-2">Gestión</span>

            <a class="nav-link <?= ($menu == 'usuarios' ? 'active' : '') ?>" href="<?= base_url('usuarios') ?>">
                <span><img class="img-fluid" src="assets/images/encargados-white.png" alt="Icono administradores" width="20" height="20" style="margin-top: -8px;margin-right: 4px;"></span> Administradores
            </a>

            <a class="nav-link <?= ($menu == 'gerentes' ? 'active' : '') ?>" href="<?= base_url('gerentes') ?>">
                <span><img class="img-fluid" src="assets/images/gerente-blanco.png" alt="Icono gerentes" width="20" height="20" style="margin-top: -8px;margin-right: 4px;"></span> Gerentes
            </a>

            <a class="nav-link <?= ($menu == 'supervisores' ? 'active' : '') ?>" href="<?= base_url('supervisores') ?>">
                <span><img class="img-fluid" src="assets/images/supervisor-blanco.png" alt="Icono supervisores" width="20" height="20" style="margin-top: -8px;margin-right: 4px;"></span> Supervisores
            </a>

            <a class="nav-link <?= ($menu == 'encargados' ? 'active' : '') ?>" href="<?= base_url('encargados') ?>">
                <span><img class="img-fluid" src="assets/images/encargados-white.png" alt="Icono encargados" width="20" height="20" style="margin-top: -8px;margin-right: 4px;"></span> Encargados Tienda
            </a>

        <?php endif; ?>

        <hr class="border-secondary">

        <a class="nav-link" href="<?= base_url('login/logout') ?>">
            <span><img class="img-fluid" src="assets/images/salir-white.png" alt="Icono cerrar sesion" width="20" height="20" style="margin-top: -8px;margin-right: 4px;"></span> Cerrar sesión
        </a>

    </nav>
</div>