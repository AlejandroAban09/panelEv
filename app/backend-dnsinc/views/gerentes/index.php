<nav class="top-navbar d-flex justify-content-between align-items-center" id="top-navbar">
    <div class="d-flex align-items-center gap-3">
        <span class="btn-toggle-sidebar" onclick="toggleSidebar()">☰</span>
        <div class="fw-semibold">Gerentes</div>
    </div>

    <div class="d-flex align-items-center gap-3">
        <?php $themeMode = get_cookie('theme_mode'); ?>
        <!-- aria-label para que lectores de pantalla identifiquen el boton de tema -->
        <a href="#" class="text-white theme-switcher" style="font-size: 1.2rem;" aria-label="Cambiar tema">
            <i class="bi <?= ($themeMode === 'dark') ? 'bi-sun-fill' : 'bi-moon-fill' ?>"></i>
        </a>
        <div><?= $usuario['usuario_nombre'] ?? 'Usuario' ?></div>
    </div>
</nav>
<!-- contenido -->
<div class="content" id="main-content">
    <!-- titulo -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <!-- Titulo principal de la pagina (h1 unico por pagina, buena practica SEO) -->
        <h1 class="fw-bold text-brand" style="font-size:1.5rem;">
            <span>
                <img class="img-fluid icon-light-mode" src="assets/images/gerente-azul.png" alt="Icono gerentes" width="35" style="margin-top: -5px;">
                <img class="img-fluid icon-dark-mode" src="assets/images/gerente-blanco.png" alt="Icono gerentes" width="35" style="margin-top: -5px; display: none;">
            </span>
            Gerentes
        </h1>
        <!-- boton de crear -->
        <!-- aria-label para que lectores de pantalla identifiquen la accion del boton -->
        <a href="<?= base_url('gerentes/crear') ?>" class="btn btn-primary rounded-pill px-3 shadow-sm" aria-label="Nuevo gerente">
            <i class="bi bi-plus-circle"></i> <span class="d-none d-md-inline">Nuevo</span>
        </a>
    </div>
    <div class="card shadow-sm border-0">
        <div class="card-body">
            <div class="table-responsive">
                <table id="tablaGerentes" class="table table-striped table-hover datatable nowrap align-middle w-100">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th data-priority="1">Nombre</th>
                            <th data-priority="2"><i class="bi bi-whatsapp"></i> Whatsapp</th>
                            <th data-priority="3">Tiendas</th>
                            <th data-priority="4">Estatus</th>
                            <th>Email</th>
                            <th class="text-end">Acciones</th>
                        </tr>
                    </thead>
                    <!-- cuerpo de la tabla -->
                    <tbody>
                        <?php foreach ($gerentes as $g): ?>
                            <tr>
                                <td><?= $g->id ?></td>
                                <td><?= $g->nombre ?></td>
                                <!-- Columna de Tiendas -->
                                <td>
                                    <!-- text-dark garantiza contraste suficiente sobre fondo claro (WCAG AA) -->
                                    <span class="badge bg-success bg-opacity-10 text-dark border border-success border-opacity-50 rounded-pill fw-semibold">
                                        <?= $g->telefono ?>
                                    </span>
                                </td>
                                <td>
                                    <?php
                                    $tiendas = $g->tiendas_nombres ? explode(', ', $g->tiendas_nombres) : [];
                                    $max_visible = 2;
                                    $total = count($tiendas);
                                    ?>
                                    <?php if ($total == 0): ?>
                                        <span class="text-muted small">Sin asignación</span>
                                    <?php else: ?>
                                        <div class="d-flex flex-column gap-1">
                                            <?php foreach (array_slice($tiendas, 0, $max_visible) as $tienda): ?>
                                                <span class="badge bg-light text-dark border fw-normal text-start text-truncate" style="max-width: 200px;">
                                                    <i class="bi bi-shop me-1 text-secondary"></i><?= $tienda ?>
                                                </span>
                                            <?php endforeach; ?>
                                            <?php if ($total > $max_visible): ?>
                                                <button type="button"
                                                    class="btn btn-link btn-sm text-decoration-none p-0 text-start"
                                                    onclick="verTiendas(<?= $g->id ?>, '<?= addslashes($g->nombre) ?>', '<?= addslashes($g->tiendas_nombres) ?>')">
                                                    <span class="badge bg-soft-primary text-primary fw-semibold">
                                                        +<?= ($total - $max_visible) ?> más...
                                                    </span>
                                                </button>
                                            <?php endif; ?>
                                        </div>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <?= $g->activo
                                        ? '<span class="badge bg-success">Activo</span>'
                                        : '<span class="badge bg-secondary">Inactivo</span>' ?>
                                </td>
                                <td><?= $g->email ?></td>
                                <td class="text-end">
                                    <div class="d-inline-flex gap-2">
                                        <a href="<?= base_url('gerentes/editar/' . $g->id) ?>"
                                            class="btn btn-soft-primary btn-action"
                                            data-bs-toggle="tooltip" title="Editar">
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <button type="button"
                                            class="btn btn-soft-danger btn-action"
                                            onclick="confirmarEliminacion(<?= $g->id ?>, '<?= addslashes($g->nombre) ?>')"
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
    <!-- Modal Eliminar -->
    <div class="modal fade" id="modalEliminar" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg rounded-4">
                <div class="modal-header bg-danger text-white rounded-top-4">
                    <h5 class="modal-title"><i class="bi bi-exclamation-triangle"></i> Confirmar eliminación</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p class="mb-0 fs-5">
                        ¿Seguro que deseas eliminar al gerente:<br>
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
    <!-- Modal Ver Tiendas -->
    <div class="modal fade" id="modalTiendas" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content border-0 shadow-lg rounded-4">
                <div class="modal-header bg-white border-bottom-0 pb-0">
                    <div>
                        <h5 class="modal-title fw-bold" style="color: #040051;">Tiendas asignadas</h5>
                        <p class="text-muted small mb-0" id="modalTiendasGerente"></p>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body pt-3">
                    <div class="list-group list-group-flush" id="listaTiendasModal">
                        <!-- Tiendas JS -->
                    </div>
                </div>
                <div class="modal-footer border-top-0">
                    <button type="button" class="btn btn-secondary rounded-pill w-100" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- script/funciones para gerentes -->
<script>
    //funcion para confirmar eliminacion
    function confirmarEliminacion(id, nombre) {
        document.getElementById("modalNombre").innerText = nombre;
        document.getElementById("btnEliminarConfirmado").href = "<?= base_url('gerentes/eliminar/') ?>" + id;
        var myModal = new bootstrap.Modal(document.getElementById('modalEliminar'));
        myModal.show();
    }
    //funcion para ver tiendas
    function verTiendas(id, nombre, tiendasStr) {
        document.getElementById("modalTiendasGerente").innerText = nombre;
        const lista = document.getElementById("listaTiendasModal");
        lista.innerHTML = '';
        if (!tiendasStr) return;
        const tiendas = tiendasStr.split(', ');
        tiendas.forEach(t => {
            const item = document.createElement('div');
            item.className = 'list-group-item px-0 border-0 d-flex align-items-center gap-2';
            item.innerHTML = `<i class="bi bi-shop text-primary bg-primary bg-opacity-10 p-2 rounded-circle"></i> <span class="fw-medium">${t}</span>`;
            lista.appendChild(item);
        });
        var myModal = new bootstrap.Modal(document.getElementById('modalTiendas'));
        myModal.show();
    }
</script>