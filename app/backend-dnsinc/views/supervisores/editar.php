<nav class="top-navbar d-flex justify-content-between align-items-center" id="top-navbar">
    <span class="btn-toggle-sidebar" onclick="toggleSidebar()">☰</span>
    <div class="fw-semibold">Supervisores | Editar</div>
    <div><?= $usuario['usuario_nombre'] ?? 'Usuario' ?></div>
</nav>

<div class="content" id="main-content">
    <div class="mx-auto" style="max-width: 780px;">

        <div class="card shadow-lg border-0 rounded-4">
            <div class="card-body p-4 p-md-5">

                <?php if (!empty($error) || !empty(validation_errors())): ?>
                    <div class="alert alert-danger rounded-4">
                    <?php endif; ?>

                    <!-- Formulario con Auto-Save JS (ID único por registro) -->
                    <form action="<?= $action ?>" method="post" class="auto-save" data-autosave-id="supervisor_<?= $supervisor->id ?>">


                        <div class="mb-4">
                            <label class="form-label fw-semibold">Nombre Completo</label>
                            <input type="text" name="nombre" class="form-control form-control-lg"
                                value="<?= $supervisor->nombre ?>" required>
                        </div>

                        <div class="row g-3 mb-4">
                            <div class="col-md-7">
                                <label class="form-label fw-semibold">Teléfono (<i class="bi bi-whatsapp"></i> WhatsApp)</label>

                                <!-- INPUT GROUP CON PREFIJO +52 -->
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
                                        title="Ingresa los 10 dígitos de tu número celular"
                                        value="<?= $telefono_show ?>"
                                        required>
                                </div>

                            </div>

                            <div class="col-md-5">
                                <label class="form-label fw-semibold">Estatus</label>
                                <select name="activo" class="form-select form-select-lg">
                                    <option value="1" <?= ((int)$supervisor->activo === 1 ? 'selected' : '') ?>>Activo</option>
                                    <option value="0" <?= ((int)$supervisor->activo === 0 ? 'selected' : '') ?>>Inactivo</option>
                                </select>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-semibold">Correo Electrónico</label>
                            <input type="email" name="email" class="form-control form-control-lg"
                                value="<?= $supervisor->email ?>">
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
    <!-- funcion para detectar cambios en el formulario y mandar un modal de advertencia-->