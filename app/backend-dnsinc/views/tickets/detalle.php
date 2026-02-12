<nav class="top-navbar d-flex justify-content-between align-items-center">
    <span class="btn-toggle-sidebar" onclick="toggleSidebar()">☰</span>
    <div class="fw-semibold">Evidencias | Detalle</div>
    <div><?= $usuario['usuario_nombre'] ?></div>
</nav>

<div class="content">
    <div class="mx-auto" style="max-width: 980px;">

        <div class="d-flex flex-wrap justify-content-between align-items-start gap-3 mb-3">
            <div>
                <h2 class="fw-bold mb-1" style="color: #040051;"><?= $headline ?> <span class="text-muted">Folio: #<?= $ticket->id ?></span></h2>
                <div class="text-muted"><?= $subheadline ?></div>
            </div>

            <div class="d-flex align-items-center gap-2">
                <a href="<?= $backUrl ?>" class="btn btn-outline-secondary rounded-pill px-3">
                    <i class="bi bi-arrow-left-circle"></i> Regresar
                </a>

                <?php if ($ticket->status !== 'cerrado'): ?>
                    <!-- Botón cerrar ticket -->
                    <button type="button" class="btn btn-danger rounded-pill px-3 shadow-sm" data-bs-toggle="modal"
                        data-bs-target="#modalCerrarTicket">
                        <i class="bi bi-check2-circle"></i> Cerrar
                    </button>
                <?php endif; ?>
            </div>
        </div>

        <div class="card shadow-lg border-0 rounded-4">
            <div class="card-body p-4 p-md-5">

                <div class="row g-4">

                    <div class="col-12 col-lg-7">
                        <div class="mb-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <h5 class="fw-bold mb-0">Información</h5>

                                <?php if ($ticket->status === 'cerrado'): ?>
                                    <span class="badge bg-success fs-6">Cerrado</span>
                                <?php else: ?>
                                    <span class="badge bg-warning text-dark fs-6">Abierto</span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="row g-3">
                            <div class="col-12">
                                <div class="p-3 rounded-4 bg-light">
                                    <div class="text-muted small">Tienda</div>
                                    <div class="fw-semibold">
                                        <?= $ticket->tienda_nombre ?> (<?= $ticket->tienda_cc ?>)
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="p-3 rounded-4 bg-light">
                                    <div class="text-muted small">Tipo de evidencia</div>
                                    <div class="fw-semibold"><?= $ticket->tipo_nombre ?></div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="p-3 rounded-4 bg-light">
                                    <div class="text-muted small">Encargado</div>
                                    <div class="fw-semibold"><?= $ticket->encargado_nombre ?></div>
                                    <div class="text-muted small">
                                        <?= $ticket->encargado_tel ?>
                                        <?= !empty($ticket->encargado_email) ? ' · ' . $ticket->encargado_email : '' ?>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="p-3 rounded-4 bg-light">
                                    <div class="text-muted small">Gerente</div>
                                    <div class="fw-semibold">
                                        <?= $ticket->gerente_nombre ?: 'No asignado' ?>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="p-3 rounded-4 bg-light">
                                    <div class="text-muted small">Supervisor</div>
                                    <div class="fw-semibold">
                                        <?= $ticket->supervisor_nombre ?: 'No asignado' ?>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="p-3 rounded-4 bg-light">
                                    <div class="text-muted small">Descripción</div>
                                    <div class="fw-semibold"><?= nl2br(htmlspecialchars($ticket->descripcion)) ?></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-lg-5">
                        <h5 class="fw-bold mb-3">Fechas</h5>

                        <div class="p-3 rounded-4 bg-light mb-3">
                            <div class="text-muted small">Creado</div>
                            <div class="fw-semibold"><?= date("d/m/Y H:i", strtotime($ticket->created_at)) ?></div>
                        </div>

                        <?php if (!empty($ticket->closed_at)): ?>
                            <div class="p-3 rounded-4 bg-light mb-3">
                                <div class="text-muted small">Cerrado</div>
                                <div class="fw-semibold"><?= date("d/m/Y H:i", strtotime($ticket->closed_at)) ?></div>
                            </div>
                        <?php endif; ?>

                        <h5 class="fw-bold mt-4 mb-3">Evidencias</h5>

                        <?php if (!empty($ticket->ruta_zip)): ?>
                            <a class="btn btn-primary rounded-pill px-4 shadow-sm" href="../<?= $ticket->ruta_zip ?>"
                                download>
                                <i class="bi bi-download"></i> Descargar ZIP
                            </a>
                        <?php else: ?>
                            <div class="text-muted">No hay evidencias adjuntas.</div>
                        <?php endif; ?>
                    </div>

                </div>

            </div>
        </div>

    </div>
</div>

<!-- Modal confirmar cierre -->
<div class="modal fade" id="modalCerrarTicket" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg rounded-4">

            <div class="modal-header bg-danger text-white rounded-top-4">
                <h5 class="modal-title">
                    <i class="bi bi-exclamation-triangle"></i> Confirmar cierre
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <p class="mb-0 fs-5">
                    ¿Deseas cerrar la evidencia <strong>Folio: #<?= $ticket->id ?></strong>?<br>
                    Se enviará un correo de confirmación al encargado de tienda.
                </p>
            </div>

            <div class="modal-footer d-flex justify-content-end gap-2">
                <button type="button" class="btn btn-secondary rounded-pill" data-bs-dismiss="modal">
                    Cancelar
                </button>

                <a href="<?= base_url('tickets/cerrar/' . $ticket->id) ?>" class="btn btn-danger rounded-pill px-4">
                    Cerrar Evidencia
                </a>
            </div>

        </div>
    </div>
</div>