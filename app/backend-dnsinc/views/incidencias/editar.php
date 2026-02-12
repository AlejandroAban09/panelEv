<nav class="top-navbar d-flex justify-content-between align-items-center">
    <span class="btn-toggle-sidebar" onclick="toggleSidebar()">☰</span>
    <div class="fw-semibold">Tipos Evidencias | Editar</div>
    <div><?= $usuario['usuario_nombre'] ?></div>
</nav>

<div class="content">
    <div class="mx-auto" style="max-width: 780px;">
        <div class="card shadow-lg border-0 rounded-4">
            <div class="card-body p-4 p-md-5">
                <?php if (!empty($error)): ?>
                <div class="alert alert-danger rounded-4"><?= $error ?></div>
                <?php endif; ?>

                <form action="<?= $action ?>" method="post">

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Nombre del tipo de incidencia</label>
                        <input type="text" name="nombre" class="form-control form-control-lg"
                            value="<?= $tipo->nombre ?>" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Descripción (opcional)</label>
                        <input type="text" name="descripcion" class="form-control form-control-lg"
                            value="<?= $tipo->descripcion ?>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Emails de notificación</label>
                        <textarea name="emails_notificacion" class="form-control"
                            rows="4"><?= $tipo->emails_notificacion ?></textarea>
                        <div class="form-text">Separados por coma.</div>
                    </div>

                    <div class="mb-2">
                        <label class="form-label fw-semibold">Estatus</label>
                        <select name="activo" class="form-select form-select-lg">
                            <option value="1" <?= ((int)$tipo->activo===1?'selected':'') ?>>Activo</option>
                            <option value="0" <?= ((int)$tipo->activo===0?'selected':'') ?>>Inactivo</option>
                        </select>
                    </div>

                    <div class="d-flex justify-content-center gap-3 mt-5">
                        <a href="<?= $backUrl ?>" class="btn btn-outline-secondary btn-lg rounded-pill px-4">
                            <i class="bi bi-arrow-left-circle"></i> Regresar
                        </a>

                        <button class="btn btn-primary btn-lg rounded-pill px-4">
                            <i class="bi bi-save"></i> Actualizar
                        </button>
                    </div>

                </form>

            </div>
        </div>

    </div>
</div>