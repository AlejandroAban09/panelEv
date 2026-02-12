<nav class="top-navbar d-flex justify-content-between align-items-center" id="top-navbar">
    <span class="btn-toggle-sidebar" onclick="toggleSidebar()">☰</span>
    <div class="fw-semibold">Tiendas | Editar</div>
    <div><?= $usuario['usuario_nombre'] ?></div>
</nav>

<div class="content" id="main-content">
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
                        <label class="form-label fw-semibold">Nombre de la tienda</label>
                        <input type="text" name="nombre" class="form-control form-control-lg"
                            value="<?= $tienda->nombre ?>" required>
                    </div>

                    <div class="row g-3 mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Centro de costo</label>
                            <input type="text" name="centro_costo" class="form-control form-control-lg"
                                value="<?= $tienda->centro_costo ?>" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Estatus</label>
                            <select name="activo" class="form-select form-select-lg">
                                <option value="1" <?= ((int)$tienda->activo === 1 ? 'selected' : '') ?>>Activo</option>
                                <option value="0" <?= ((int)$tienda->activo === 0 ? 'selected' : '') ?>>Inactivo</option>
                            </select>
                        </div>
                    </div>

                    <div class="row g-3 mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Gerente asignado</label>
                            <select name="gerente_id" class="form-select form-select-lg select2">
                                <option value="">-- Seleccionar --</option>
                                <?php foreach ($gerentes as $g): ?>
                                    <option value="<?= $g->id ?>"
                                        <?= ((string)$tienda->gerente === (string)$g->id ? 'selected' : '') ?>>
                                        <?= $g->nombre ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Supervisor asignado</label>
                            <select name="supervisor_id" class="form-select form-select-lg select2">
                                <option value="">-- Seleccionar --</option>
                                <?php foreach ($supervisores as $s): ?>
                                    <option value="<?= $s->id ?>"
                                        <?= ((string)$tienda->supervisor === (string)$s->id ? 'selected' : '') ?>>
                                        <?= $s->nombre ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
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