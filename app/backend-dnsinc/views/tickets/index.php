<nav class="top-navbar d-flex justify-content-between align-items-center" id="top-navbar">
    <div class="d-flex align-items-center gap-3">
        <span class="btn-toggle-sidebar" onclick="toggleSidebar()">☰</span>
        <div class="fw-semibold">Evidencias</div>
    </div>

    <div class="d-flex align-items-center gap-3">
        <?php $themeMode = get_cookie('theme_mode'); ?>
        <!-- aria-label para que lectores de pantalla identifiquen el boton de tema -->
        <a href="#" class="text-white theme-switcher" style="font-size: 1.2rem;" aria-label="Cambiar tema">
            <i class="bi <?= ($themeMode === 'dark') ? 'bi-sun-fill' : 'bi-moon-fill' ?>"></i>
        </a>
        <div><?= $usuario['usuario_nombre'] ?></div>
    </div>
</nav>

<div class="content" id="main-content">

    <!-- Titulo principal de la pagina (h1 unico por pagina, buena practica SEO) -->
    <h1 class="fw-bold text-brand" style="font-size:1.5rem;">
        <span>
            <img class="img-fluid icon-light-mode" src="assets/images/tickets.png" alt="Icono evidencias" width="35" style="margin-top: -5px;">
            <img class="img-fluid icon-dark-mode" src="assets/images/tickets-white.png" alt="Icono evidencias" width="35" style="margin-top: -5px; display: none;">
        </span>
        Evidencias registradas <?php echo ($tipo != '') ? ' - ' . $tipo : ''; ?>
    </h1>

    <div class="card shadow-sm border-0">
        <div class="card-body">

            <div class="table-responsive">
                <table class="table table-striped table-hover datatable align-middle w-100">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Encargado</th>
                            <th>Tienda</th>
                            <th>Gerente</th>
                            <th>Supervisor</th>
                            <th>Tipo</th>
                            <th>Estatus</th>
                            <th>F. Creado</th>
                            <th>F. Cerrado</th>
                            <th class="text-end">Acciones</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($tickets as $t): ?>
                            <tr>
                                <td><?= $t->id ?></td>
                                <td><?= $t->encargado_nombre ?></td>
                                <td><?= $t->tienda_nombre ?> (<?= $t->tienda_cc ?>)</td>
                                <td><?= $t->gerente_nombre ?: '<span class="text-muted small">No asignado</span>' ?></td>
                                <td><?= $t->supervisor_nombre ?: '<span class="text-muted small">No asignado</span>' ?></td>
                                <td><?= $t->tipo_nombre ?></td>

                                <td>
                                    <?php if ($t->status == 'cerrado'): ?>
                                        <span class="badge bg-success">Cerrado</span>
                                    <?php else: ?>
                                        <span class="badge bg-warning text-dark">Abierto</span>
                                    <?php endif; ?>
                                </td>

                                <td><?= date("d-m-Y h:i a", strtotime($t->created_at)) ?></td>
                                <td><?= ($t->closed_at != '') ? date("d-m-Y h:i a", strtotime($t->closed_at)) : '' ?></td>

                                <td class="text-end">
                                    <a href="<?= base_url('tickets/detalle/' . $t->id) ?>"
                                        class="btn btn-soft-info btn-detail"
                                        data-bs-toggle="tooltip" title="Ver detalle">
                                        <i class="bi bi-eye"></i>
                                        <span class="d-none d-md-inline">Detalle</span>
                                    </a>
                                </td>

                            </tr>
                        <?php endforeach; ?>
                    </tbody>

                </table>
            </div>

        </div>
    </div>

</div>