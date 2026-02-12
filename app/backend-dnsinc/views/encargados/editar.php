<nav class="top-navbar d-flex justify-content-between align-items-center" id="top-navbar">
    <span class="btn-toggle-sidebar" onclick="toggleSidebar()">☰</span>
    <div class="fw-semibold">Encargados | Editar</div>
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
                        <label class="form-label fw-semibold">Nombre del encargado de tienda</label>
                        <input type="text" name="nombre" class="form-control form-control-lg"
                            value="<?= $encargado->nombre ?>" required>
                    </div>

                    <div class="row g-3 mb-3">
                        <div class="col-md-7">
                            <label class="form-label fw-semibold">Teléfono (<i class="bi bi-whatsapp"></i> WhatsApp)</label>
                            <div class="input-group input-group-lg">
                                <span class="input-group-text bg-white text-muted fw-bold border-end-0">
                                    <img src="https://flagcdn.com/w20/mx.png" width="20" class="me-2" alt="MX">
                                    +52
                                </span>
                                <input type="text"
                                    name="telefono_sin_prefijo"
                                    class="form-control border-start-0 ps-0"
                                    placeholder="9999999999"
                                    minlength="10" maxlength="10"
                                    pattern="\d{10}"
                                    value="<?= substr($encargado->telefono, 0, 2) == '52' ? substr($encargado->telefono, 2) : $encargado->telefono ?>"
                                    title="Ingresa los 10 dígitos de tu número celular"
                                    required>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <label class="form-label fw-semibold">Estatus</label>
                            <select name="activo" class="form-select form-select-lg">
                                <option value="1" <?= ((int)$encargado->activo === 1 ? 'selected' : '') ?>>Activo</option>
                                <option value="0" <?= ((int)$encargado->activo === 0 ? 'selected' : '') ?>>Inactivo</option>
                            </select>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Email</label>
                        <input type="email" name="email" class="form-control form-control-lg"
                            value="<?= $encargado->email ?>">
                    </div>

                    <div class="mb-2">
                        <label class="form-label fw-semibold">Tienda asignada</label>
                        <select name="tienda_id" class="form-select form-select-lg select2" required>
                            <option value=""></option>
                            <?php foreach ($tiendas as $t): ?>
                                <option value="<?= $t->id ?>"
                                    <?= ((int)$encargado->tienda_id === (int)$t->id ? 'selected' : '') ?>>
                                    <?= $t->nombre ?> (<?= $t->centro_costo ?>)
                                </option>
                            <?php endforeach; ?>
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