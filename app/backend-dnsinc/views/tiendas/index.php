<nav class="top-navbar d-flex justify-content-between align-items-center" id="top-navbar">
    <span class="btn-toggle-sidebar" onclick="toggleSidebar()">☰</span>
    <div class="fw-semibold">Tiendas</div>
    <div><?= $usuario['usuario_nombre'] ?></div>
</nav>

<div class="content" id="main-content">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold" style="color: #040051;">
            <span>
                <img class="img-fluid" src="assets/images/tiendas.png" alt="" width="35" style="margin-top: -11px;">
            </span>Tiendas
        </h2>

        <a href="<?= base_url('tiendas/crear') ?>" class="btn btn-primary rounded-pill px-3 shadow-sm">
            <i class="bi bi-plus-circle"></i>
            <span class="d-none d-md-inline">Nueva</span>
        </a>
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-body">

            <div class="table-responsive">
                <table class="table table-striped table-hover datatable align-middle w-100">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Centro de costo</th>
                            <th>Estatus</th>
                            <th class="text-end">Acciones</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($tiendas as $t): ?>
                            <tr>
                                <td><?= $t->id ?></td>
                                <td><?= $t->nombre ?></td>
                                <td><?= $t->centro_costo ?></td>

                                <td>
                                    <?= $t->activo
                                        ? '<span class="badge bg-success">Activo</span>'
                                        : '<span class="badge bg-secondary">Inactivo</span>' ?>
                                </td>

                                <td class="text-end">
                                    <div class="d-inline-flex gap-2">

                                        <!-- Botón Ver Detalles (HTML-First) -->
                                        <button type="button"
                                            class="btn btn-soft-info btn-action"
                                            data-bs-toggle="modal"
                                            data-bs-target="#modalVerDetalles"
                                            data-nombre="<?= htmlspecialchars($t->nombre) ?>"
                                            data-cc="<?= htmlspecialchars($t->centro_costo) ?>"
                                            data-gerente="<?= htmlspecialchars($t->gerente_nombre ?? 'No asignado') ?>"
                                            data-supervisor="<?= htmlspecialchars($t->supervisor_nombre ?? 'No asignado') ?>"
                                            title="Ver detalles">
                                            <i class="bi bi-eye"></i>
                                        </button>

                                        <a href="<?= base_url('tiendas/editar/' . $t->id) ?>"
                                            class="btn btn-soft-primary btn-action"
                                            data-bs-toggle="tooltip" title="Editar">
                                            <i class="bi bi-pencil"></i>
                                        </a>

                                        <button type="button"
                                            class="btn btn-soft-danger btn-action"
                                            onclick="confirmarEliminacion(<?= $t->id ?>, '<?= addslashes($t->nombre) ?>')"
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

</div>


<!-- MODAL VER DETALLES -->
<div class="modal fade" id="modalVerDetalles" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg rounded-4">
            <div class="modal-header text-white rounded-top-4" style="background-color: #040051;">
                <h5 class="modal-title"><i class="bi bi-shop"></i> Detalles de la Tienda</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-4">
                <div class="mb-3">
                    <label class="fw-bold text-muted small text-uppercase">Nombre de la Tienda</label>
                    <div class="fs-5 text-dark" id="viewNombre"></div>
                </div>
                <div class="mb-3">
                    <label class="fw-bold text-muted small text-uppercase">Centro de Costo</label>
                    <div class="fs-5 text-dark" id="viewCC"></div>
                </div>
                <hr class="border-secondary opacity-25">
                <div class="row">
                    <div class="col-6">
                        <label class="fw-bold text-muted small text-uppercase">Gerente Asignado</label>
                        <div class="fs-6 fw-semibold text-primary" id="viewGerente"></div>
                    </div>
                    <div class="col-6">
                        <label class="fw-bold text-muted small text-uppercase">Supervisor</label>
                        <div class="fs-6 fw-semibold text-primary" id="viewSupervisor"></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer border-0 pt-0">
                <button type="button" class="btn btn-secondary rounded-pill w-100" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- MODAL ELIMINAR (GENÉRICO) -->
<div class="modal fade" id="modalEliminar" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg rounded-4">

            <div class="modal-header bg-danger text-white rounded-top-4">
                <h5 class="modal-title"><i class="bi bi-exclamation-triangle"></i> Confirmar eliminación</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <p class="mb-0 fs-5">
                    ¿Seguro que deseas eliminar la tienda:<br>
                    <strong id="modalNombre"></strong>?
                </p>
            </div>

            <div class="modal-footer d-flex justify-content-end gap-2">
                <button type="button" class="btn btn-secondary rounded-pill" data-bs-dismiss="modal">Cancelar</button>
                <a id="btnEliminarConfirmado" href="#" class="btn btn-danger rounded-pill px-4">Eliminar</a>
            </div>

        </div>
    </div>
</div>

<script>
    // Script para llenar el modal antes de que se muestre
    var modalVerDetalles = document.getElementById('modalVerDetalles');
    modalVerDetalles.addEventListener('show.bs.modal', function(event) {
        // Botón que activó el modal
        var button = event.relatedTarget;
        // Extraer info de los atributos data-*
        var nombre = button.getAttribute('data-nombre');
        var cc = button.getAttribute('data-cc');
        var gerente = button.getAttribute('data-gerente');

        // Actualizar el contenido del modal
        document.getElementById('viewNombre').textContent = nombre;
        document.getElementById('viewCC').textContent = cc;
        document.getElementById("viewGerente").innerText = gerente;
        document.getElementById("viewSupervisor").innerText = button.getAttribute('data-supervisor');
    });

    // Función antigua para eliminar
    function confirmarEliminacion(id, nombre) {
        document.getElementById("modalNombre").innerText = nombre;
        document.getElementById("btnEliminarConfirmado").href = "<?= base_url('tiendas/eliminar/') ?>" + id;
        new bootstrap.Modal(document.getElementById('modalEliminar')).show();
    }
</script>