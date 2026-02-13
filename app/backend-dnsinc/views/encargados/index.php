<nav class="top-navbar d-flex justify-content-between align-items-center" id="top-navbar">
    <div class="d-flex align-items-center gap-3">
        <span class="btn-toggle-sidebar" onclick="toggleSidebar()">☰</span>
        <div class="fw-semibold">Encargados</div>
    </div>

    <div class="d-flex align-items-center gap-3">
        <?php $themeMode = get_cookie('theme_mode'); ?>
        <a href="#" class="text-white theme-switcher" style="font-size: 1.2rem;">
            <i class="bi <?= ($themeMode === 'dark') ? 'bi-sun-fill' : 'bi-moon-fill' ?>"></i>
        </a>
        <div><?= $usuario['usuario_nombre'] ?></div>
    </div>
</nav>

<div class="content" id="main-content">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold text-brand">
            <span>
                <img class="img-fluid icon-light-mode" src="assets/images/encargados.png" alt="" width="35" style="margin-top: -5px;">
                <img class="img-fluid icon-dark-mode" src="assets/images/encargados-white.png" alt="" width="35" style="margin-top: -5px; display: none;">
            </span>
            Encargados
        </h2>

        <a href="<?= base_url('encargados/crear') ?>" class="btn btn-primary rounded-pill px-3 shadow-sm">
            <i class="bi bi-plus-circle"></i> <span class="d-none d-md-inline">Nuevo</span>
        </a>
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-body">

            <div class="table-responsive">
                <table id="tablaEncargados" class="table table-striped table-hover datatable nowrap align-middle w-100">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th data-priority="1">Nombre</th>
                            <th data-priority="2"><i class="bi bi-whatsapp"></i> Whatsapp</th>
                            <th data-priority="3">Tienda</th>
                            <th data-priority="4">Estatus</th>
                            <th>Email</th>
                            <th class="text-end">Acciones</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($encargados as $e): ?>
                            <tr>
                                <td><?= $e->id ?></td>
                                <td><?= $e->nombre ?></td>
                                <td>
                                    <span class="badge bg-info bg-opacity-10 text-success border border-success border-opacity-25 rounded-pill">
                                        <?= $e->telefono ?>
                                    </span>
                                </td>
                                <td>
                                    <span class="badge bg-light text-dark border fw-normal text-start text-truncate" style="max-width: 250px;">
                                        <i class="bi bi-shop me-1 text-secondary"></i><?= $e->tienda_nombre ?> (<?= $e->tienda_cc ?>)
                                    </span>
                                </td>
                                <td>
                                    <?= $e->activo
                                        ? '<span class="badge bg-success">Activo</span>'
                                        : '<span class="badge bg-secondary">Inactivo</span>' ?>
                                </td>
                                <td><?= $e->email ?></td>
                                <td class="text-end">
                                    <div class="d-inline-flex gap-2">

                                        <a href="<?= base_url('encargados/editar/' . $e->id) ?>"
                                            class="btn btn-soft-primary btn-action"
                                            data-bs-toggle="tooltip" title="Editar">
                                            <i class="bi bi-pencil"></i>
                                        </a>

                                        <button type="button"
                                            class="btn btn-soft-danger btn-action"
                                            onclick="confirmarEliminacion(<?= $e->id ?>, '<?= addslashes($e->nombre) ?>')"
                                            data-bs-toggle="tooltip" title="Eliminar">
                                            <i class="bi bi-trash"></i>
                                        </button>

                                    </div>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>

                </table>
            </div>

        </div>
    </div>

    <div class="modal fade" id="modalEliminar" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg rounded-4">

                <div class="modal-header bg-danger text-white rounded-top-4">
                    <h5 class="modal-title"><i class="bi bi-exclamation-triangle"></i> Confirmar eliminación</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <p class="mb-0 fs-5">
                        ¿Seguro que deseas eliminar al encargado:<br>
                        <strong id="modalNombre"></strong>?
                    </p>
                </div>

                <div class="modal-footer d-flex justify-content-end gap-2">
                    <button type="button" class="btn btn-secondary rounded-pill" data-bs-dismiss="modal">
                        Cancelar
                    </button>

                    <a id="btnEliminarConfirmado" href="#" class="btn btn-danger rounded-pill px-4">
                        Eliminar
                    </a>
                </div>

            </div>
        </div>
    </div>

</div>

<script>
    function confirmarEliminacion(id, nombre) {
        document.getElementById("modalNombre").innerText = nombre;
        document.getElementById("btnEliminarConfirmado").href = "<?= base_url('encargados/eliminar/') ?>" + id;

        var myModal = new bootstrap.Modal(document.getElementById('modalEliminar'));
        myModal.show();
    }
</script>