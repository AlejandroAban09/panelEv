<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>

<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

<script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>

<script src="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap5.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- GLOBAL ALERT MODAL -->
<div class="modal fade" id="globalAlertModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg rounded-4 overflow-hidden">
            <div class="modal-header text-white border-0" id="globalModalHeader" style="background-color: #040051;">
                <h5 class="modal-title fw-bold" id="globalModalTitle">
                    <i class="bi" id="globalModalIcon"></i> <span id="globalModalLabel">Notificación</span>
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-4 text-center">
                <div class="mb-3">
                    <i class="bi" id="globalModalBodyIcon" style="font-size: 3.5rem;"></i>
                </div>
                <h4 class="fw-bold mb-2" id="globalModalBodyTitle" style="color: #040051;"></h4>
                <div class="text-muted fs-5 mb-0" id="globalModalMessage"></div>
            </div>
            <div class="modal-footer border-0 justify-content-center pb-4">
                <button type="button" class="btn btn-primary rounded-pill px-5 py-2 fw-semibold" data-bs-dismiss="modal" style="background-color: #040051; border-color: #040051;">
                    Entendido
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    // Función Global para mostrar el modal
    function showGlobalAlert(type, message) {
        const modalEl = document.getElementById('globalAlertModal');
        const header = document.getElementById('globalModalHeader');
        const icon = document.getElementById('globalModalIcon');
        const bodyIcon = document.getElementById('globalModalBodyIcon');
        const label = document.getElementById('globalModalLabel');
        const bodyTitle = document.getElementById('globalModalBodyTitle');
        const msgText = document.getElementById('globalModalMessage');
        const bsModal = new bootstrap.Modal(modalEl);

        // Reset classes
        header.className = 'modal-header text-white border-0';
        icon.className = 'bi me-2';
        bodyIcon.className = 'bi';

        if (type === 'error') {
            header.style.backgroundColor = '#dc3545'; // Rojo Bootstrap
            icon.classList.add('bi-exclamation-triangle-fill');
            bodyIcon.classList.add('bi-x-circle-fill', 'text-danger');
            label.textContent = 'Error Detectado';
            bodyTitle.textContent = '¡Ups! Algo salió mal';
        } else if (type === 'success') {
            header.style.backgroundColor = '#198754'; // Verde Bootstrap
            icon.classList.add('bi-check-circle-fill');
            bodyIcon.classList.add('bi-check-circle-fill', 'text-success');
            label.textContent = 'Operación Exitosa';
            bodyTitle.textContent = '¡Todo salió bien!';
        } else {
            // Info / Default (#040051)
            header.style.backgroundColor = '#040051';
            icon.classList.add('bi-info-circle-fill');
            bodyIcon.classList.add('bi-info-circle-fill');
            bodyIcon.style.color = '#040051';
            label.textContent = 'Información';
            bodyTitle.textContent = 'Aviso del Sistema';
        }

        msgText.innerHTML = message;
        bsModal.show();
    }

    <?php
    $alertType = '';
    $alertMsg = '';

    // Prioridad de detección de mensajes
    if (isset($error) && !empty($error)) {
        $alertType = 'error';
        $alertMsg = $error;
    } elseif (function_exists('validation_errors') && !empty(validation_errors())) {
        $alertType = 'error';
        $alertMsg = validation_errors();
    } elseif (isset($_SESSION['error']) && !empty($_SESSION['error'])) {
        //$alertType = 'error';
        //$alertMsg = $_SESSION['error'];
        // Usando flashdata de CI3 style si session directo falla, 
        // pero $this->session->flashdata('error') es preferible si session library cargada
    }

    // Check CodeIgniter Flashdata via instance access in View is tricky depending on context, 
    // better to rely on what Controllers pass or global session access.
    // Assuming standard CI3 $this->session is available in views usually.
    /* 
    // DESACTIVADO: Se usará SweetAlert2 (Toasts) en su lugar para mensajes de sesión.
    if (empty($alertMsg) && isset($this->session)) {
        if ($this->session->flashdata('error')) {
            $alertType = 'error';
            $alertMsg = $this->session->flashdata('error');
        } elseif ($this->session->flashdata('success')) {
            $alertType = 'success';
            $alertMsg = $this->session->flashdata('success');
        }
    } 
    */

    if (!empty($alertType) && !empty($alertMsg)) {
        $jsMsg = json_encode($alertMsg);
        echo "document.addEventListener('DOMContentLoaded', function() { showGlobalAlert('$alertType', $jsMsg); });";
    }
    ?>
</script>

<script src="<?= base_url('assets/js/datatable-init.js') ?>"></script>

<script>
    // Generic function to save preferences via AJAX
    function saveConfig(key, value) {
        $.post('<?= base_url('panel/save_preference') ?>', {
            key: key,
            value: value
        });
    }

    function toggleSidebar() {
        document.body.classList.toggle("sidebar-toggled");
        let state = document.body.classList.contains("sidebar-toggled") ? "toggled" : "";

        saveConfig('sidebar_state', state);

        // Función auxiliar para recalcular DataTables
        const recalcTables = () => {
            window.dispatchEvent(new Event('resize'));
            if ($.fn.DataTable) {
                $.fn.dataTable.tables({
                        visible: true,
                        api: true
                    })
                    .columns.adjust()
                    .responsive.recalc()
                    .draw(false);
            }
        };

        // Disparar varias veces para asegurar que se ajuste al ancho final exacto
        setTimeout(recalcTables, 300);
        setTimeout(recalcTables, 450);
        setTimeout(recalcTables, 600);
    }

    // Toggle Dark Mode Logic
    $(document).on('click', '.theme-switcher', function(e) {
        e.preventDefault();
        $('body').toggleClass('dark-mode');

        let theme = $('body').hasClass('dark-mode') ? 'dark' : '';
        saveConfig('theme_mode', theme);

        // Update icon globally (if multiple exist, update all)
        $('.theme-switcher i').removeClass('bi-moon-fill bi-sun-fill')
            .addClass(theme === 'dark' ? 'bi-sun-fill' : 'bi-moon-fill');
    });

    $(function() {

        var seccion = '<?php echo $this->uri->segment(1); ?>';

        var placeholder = '';
        if (seccion == 'encargados') {
            placeholder = 'Seleccione una tienda...';
        } else if (seccion == 'usuarios') {
            placeholder = 'Seleccione un tipo de evidencia...';
        }

        $('.select2').select2({
            width: '100%',
            placeholder: placeholder,
            allowClear: true
        });

    });

    document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach(el => {
        new bootstrap.Tooltip(el);
    });
</script>
<script>
    // Configuración base de SweetAlert para Toasts
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 1500,
        timerProgressBar: true,
        background: '#fff',
        color: '#333',
        iconColor: '#ffc107', // Amarillo primario
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    });

    <?php if ($successMsg = $this->session->flashdata('success')): ?>
        Toast.fire({
            icon: 'success',
            title: '<?= $successMsg; ?>'
        });
        <?php $this->session->set_flashdata('success', false); ?>
    <?php endif; ?>

    <?php if ($errorMsg = $this->session->flashdata('error')): ?>
        Toast.fire({
            icon: 'error',
            title: '<?= $errorMsg; ?>'
        });
        <?php $this->session->set_flashdata('error', false); ?>
    <?php endif; ?>
</script>

<script>
    /**
     * Auto-Save en Formularios
     * Permite que los formularios con la clase 'auto-save' persistan sus datos localmente mientras se editan.
     * Se restauran automáticamente al cargar la página si no se han enviado.
     */
    document.addEventListener('DOMContentLoaded', function() {
        const forms = document.querySelectorAll('form.auto-save');
        // console.log("Auto-Save System: Detectados " + forms.length + " formularios.");

        forms.forEach(form => {
            const uniqueId = form.getAttribute('data-autosave-id');
            if (!uniqueId) {
                console.warn('Formulario con clase .auto-save no tiene atributo data-autosave-id. Ignorando.');
                return;
            }

            const inputs = form.querySelectorAll('input:not([type="hidden"]):not([type="password"]), select, textarea');

            // 1. RESTAURAR DATOS AL CARGAR
            inputs.forEach(input => {
                const key = `autosave_${uniqueId}_${input.name}`;
                const savedValue = localStorage.getItem(key);

                if (savedValue !== null && savedValue !== "") {
                    // console.log("Restaurando " + input.name + ": " + savedValue);
                    if (input.type === 'checkbox' || input.type === 'radio') {
                        if (input.value === savedValue) {
                            input.checked = true;
                        }
                    } else {
                        input.value = savedValue;
                    }
                }
            });

            // 2. GUARDAR DATOS AL ESCRIBIR (Input / Change)
            const saveHandler = (e) => {
                const input = e.target;
                if (!input.name || input.type === 'password' || input.type === 'hidden') return;

                const key = `autosave_${uniqueId}_${input.name}`;
                let valueToSave = input.value;

                if (input.type === 'checkbox' || input.type === 'radio') {
                    if (input.checked) {
                        valueToSave = input.value;
                    } else {
                        // Si es checkbox y se desmarca, podríamos borrar o guardar vacío.
                        // Para radio, solo guardamos el seleccionado.
                        return;
                    }
                }

                // console.log("Guardando " + input.name + ": " + valueToSave);
                localStorage.setItem(key, valueToSave);
            };

            form.addEventListener('input', saveHandler);
            form.addEventListener('change', saveHandler);

            // 3. BORRAR DATOS AL ENVIAR EXITOSAMENTE
            form.addEventListener('submit', () => {
                // Limpiamos todo el storage asociado a este form
                inputs.forEach(input => {
                    const key = `autosave_${uniqueId}_${input.name}`;
                    localStorage.removeItem(key);
                });
            });
        });
    });
</script>
</body>

</html>