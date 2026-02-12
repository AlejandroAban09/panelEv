<nav class="top-navbar d-flex justify-content-between align-items-center">
    <span class="btn-toggle-sidebar" onclick="toggleSidebar()">☰</span>
    <div class="fw-semibold">Usuarios | Editar</div>
    <div><?= $usuario['usuario_nombre'] ?></div>
</nav>

<div class="content">
    <div class="mx-auto" style="max-width: 780px;">

        <!--<div class="mb-3">
            <h2 class="fw-bold mb-1"><?= $headline ?></h2>
            <div class="text-muted"><?= $subheadline ?></div>
        </div>-->

        <div class="card shadow-lg border-0 rounded-4">
            <div class="card-body p-4 p-md-5">

                <?php if (!empty($error)): ?>
                <div class="alert alert-danger rounded-4"><?= $error ?></div>
                <?php endif; ?>

                <form action="<?= $action ?>" method="post">

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Nombre y apellidos</label>
                        <input type="text" name="nombre" class="form-control form-control-lg"
                            value="<?= $usuario_edit->nombre ?>" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Usuario</label>
                        <input type="text" name="usuario" class="form-control form-control-lg"
                            value="<?= $usuario_edit->usuario ?>" required autocomplete="off">
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Contraseña (opcional)</label>
                        <input type="password" name="password" class="form-control form-control-lg" autocomplete="off">
                        <div class="form-text">Si la dejas vacía, no se cambia.</div>
                    </div>

                    <?php 
                    $tiposSel = !empty($usuario_edit->tipo_id) ? array_filter(array_map('intval', explode(',', $usuario_edit->tipo_id))) : [];
                    ?>

                    <?php if ((int)$usuario_edit->rol === 2): ?>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Tipo de Evidencia asignado</label>
                        <select name="tipo_incidencia_id[]" class="form-select form-select-lg select2" multiple required>
                            <option value=""></option>
                            <?php foreach($tipos as $t): ?>
                            <option value="<?= $t->id ?>"
                                <?= in_array((int)$t->id, $tiposSel, true) ? 'selected' : '' ?>>
                                <?= $t->nombre ?>
                            </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <?php endif; ?>

                    <div class="mb-2">
                        <label class="form-label fw-semibold">Estatus</label>
                        <select name="activo" class="form-select form-select-lg">
                            <option value="1" <?= ((int)$usuario_edit->activo===1?'selected':'') ?>>Activo</option>
                            <option value="0" <?= ((int)$usuario_edit->activo===0?'selected':'') ?>>Inactivo</option>
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