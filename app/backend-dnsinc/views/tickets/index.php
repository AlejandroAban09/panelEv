<nav class="top-navbar d-flex justify-content-between align-items-center" id="top-navbar">
    <span class="btn-toggle-sidebar" onclick="toggleSidebar()">☰</span>
    <div class="fw-semibold">Evidencias</div>
    <div><?= $usuario['usuario_nombre'] ?></div>
</nav>

<div class="content" id="main-content">

    <h2 class="fw-bold" style="color: #040051;"><span> <img class="img-fluid" src="assets/images/tickets.png" alt="" width="35" style="margin-top: -5px;"> </span>Evidencias registradas <?php echo ($tipo != '') ? ' - ' . $tipo : ''; ?></h2>

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