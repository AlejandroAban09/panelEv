<nav class="top-navbar d-flex justify-content-between align-items-center" id="top-navbar">
    <div class="d-flex align-items-center gap-3">
        <span class="btn-toggle-sidebar" onclick="toggleSidebar()">☰</span>
        <div class="fw-semibold">Panel Administrativo</div>
    </div>

    <div class="d-flex align-items-center gap-3">
        <!-- Dark Mode Toggle -->
        <?php $themeMode = get_cookie('theme_mode'); ?>
        <a href="#" class="text-white theme-switcher" style="font-size: 1.2rem;">
            <i class="bi <?= ($themeMode === 'dark') ? 'bi-sun-fill' : 'bi-moon-fill' ?>"></i>
        </a>

        <div>
            <?= isset($usuario['usuario_nombre']) ? $usuario['usuario_nombre'] : '' ?>
        </div>
    </div>
</nav>

<div class="content" id="main-content">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold" style="color: #040051;"><span> <img class="img-fluid" src="assets/images/home.png" alt="" width="35" style="margin-top: -11px;"> </span>Panel</h2>
    </div>

    <div class="row g-4">

        <div class="col-md-3">
            <div class="card shadow-sm border-0 p-3" style="background: #cae4ed;">
                <h5 class="" style="color: #040051;">Encargados</h5>
                <h2 class="fw-bold" style="color: #040051;"><?= $tot_encargados ?></h2>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow-sm border-0 p-3" style="background: #cae4ed;">
                <h5 class="" style="color: #040051;">Tiendas</h5>
                <h2 class="fw-bold" style="color: #040051;"><?= $tot_tiendas ?></h2>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow-sm border-0 p-3" style="background: #cae4ed;">
                <h5 class="" style="color: #040051;">Tipos de evidencia</h5>
                <h2 class="fw-bold" style="color: #040051;"><?= $tot_tipos ?></h2>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow-sm border-0 p-3" style="background: #cae4ed;">
                <h5 class="" style="color: #040051;">Evidencias registradas</h5>
                <h2 class="fw-bold" style="color: #040051;"><?= $tot_tickets ?></h2>
            </div>
        </div>

    </div>

</div> <!-- /#main-content -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        let formChanged = true; // Activo por defecto para probar

        // 1. Detectar navegación interna voluntaria (Clics en enlaces)
        // Si el usuario hace clic en cualquier enlace del sitio, DESACTIVAMOS la alerta.
        document.body.addEventListener('click', function(e) {
            // Buscamos si el clic fue en un enlace <a> o un elemento dentro de él
            let link = e.target.closest('a');

            // Si es un enlace real y no un ancla vacía o javascript
            if (link && link.href && !link.href.startsWith('javascript:') && link.getAttribute('href') !== '#') {
                formChanged = false; // "Perdonamos" la alerta
            }
        });

        // 2. Alerta Nativa (Solo se activará en F5, Cerrar Pestaña o Botones Atrás/Adelante)
        // porque en esos casos NO hubo un evento 'click' en un enlace que desactivara la bandera.
        window.addEventListener('beforeunload', function(e) {
            if (formChanged) {
                e.preventDefault();
                e.returnValue = '';
            }
        });
    });
</script>