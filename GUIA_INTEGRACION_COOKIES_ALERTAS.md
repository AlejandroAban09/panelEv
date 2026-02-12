# Guía de Implementación: Cookies de Configuración y Alertas de Navegación

Esta guía técnica explica cómo implementar un sistema de **preferencias de usuario persistentes mediante cookies** (como el estado del menú lateral, el modo oscuro y el número de filas en tablas) y cómo gestionar las **advertencias de navegación nativas** del navegador para evitar la pérdida de datos en formularios.

El enfoque está diseñado para ser replicable en cualquier proyecto web basado en PHP (CodeIgniter) y JavaScript/jQuery.

---

## 1. Sistema de Cookies de Configuración

Este sistema permite guardar preferencias de la interfaz de usuario directamente en el navegador del cliente por un periodo definido (ej. 30 días), sin necesidad de crear tablas adicionales en la base de datos.

### A. Configuración del Entorno (Backend)

Para que el servidor pueda leer y crear cookies fácilmente, es necesario cargar el asistente (helper) correspondiente en la configuración.

**Archivo:** `application/config/autoload.php`

Busque la línea `$autoload['helper']` y asegúrese de incluir `cookie`.

```php
$autoload['helper'] = array('url', 'file', 'cookie'); 
```

### B. Controlador Universal (Backend)

En lugar de crear una función específica para cada configuración (como `guardar_tema`, `guardar_menu`), utilizaremos un único método genérico capaz de recibir cualquier par **clave-valor**.

**Archivo:** `controllers/Panel.php` (o su controlador principal)

```php
    // Método genérico para guardar preferencias de usuario
    public function save_preference()
    {
        // Recibe el nombre de la configuración (ej: 'theme_mode')
        $key   = $this->input->post('key');
        // Recibe el valor (ej: 'dark')
        $value = $this->input->post('value');

        if (!empty($key)) {
            // Crea la cookie con una duración de 30 días (segundos)
            set_cookie($key, $value, 2592000);
        }
    }
```

### C. Función Auxiliar JavaScript (Frontend)

Para enviar las configuraciones desde el navegador al servidor sin recargar la página, crearemos una función JavaScript global.

**Ubicación:** Un archivo JS común (ej. `footer.php`) o un archivo `.js` incluido en todas las páginas.

```javascript
    // Función para guardar preferencias vía AJAX
    function saveConfig(key, value) {
        // La URL debe apuntar al método creado en el paso anterior
        $.post('ruta_base/panel/save_preference', {
            key: key,
            value: value
        });
    }
```

---

## 2. Casos de Uso Implementados

A continuación se detallan los tres ejemplos prácticos implementados en este proyecto.

### Caso 1: Menú Lateral Colapsable (Sidebar)

**Objetivo:** Recordar si el usuario prefiere ver el menú expandido o colapsado.

1.  **Guardado (JS):** Al hacer clic en el botón del menú, se alterna una clase CSS y se llama a `saveConfig`.
    ```javascript
    function toggleSidebar() {
        document.body.classList.toggle("sidebar-toggled");
        // Determina el estado actual
        let state = document.body.classList.contains("sidebar-toggled") ? "toggled" : "";
        saveConfig('sidebar_state', state);
    }
    ```

2.  **Lectura (PHP):** Antes de mostrar la página, se verifica la cookie para aplicar el estado correcto desde el inicio.
    **Archivo:** `views/layout/header.php`
    ```php
    $sidebarState = get_cookie('sidebar_state');
    // Si la cookie indica 'toggled', agrega la clase que oculta el menú
    $bodyClass = ($sidebarState === 'toggled') ? 'sidebar-toggled' : '';
    echo '<body class="' . $bodyClass . '">';
    ```

### Caso 2: Modo Oscuro (Dark Mode)

**Objetivo:** Cambiar el esquema de colores y recordarlo.

1.  **Guardado (JS):**
    ```javascript
    $('.theme-switcher').on('click', function() {
        $('body').toggleClass('dark-mode');
        let theme = $('body').hasClass('dark-mode') ? 'dark' : '';
        saveConfig('theme_mode', theme);
    });
    ```

2.  **Lectura (PHP):**
    **Archivo:** `views/layout/header.php`
    ```php
    $themeMode = get_cookie('theme_mode');
    if ($themeMode === 'dark') {
        $bodyClass .= ' dark-mode';
    }
    ```

### Caso 3: Filas por Página en Tablas (DataTables)

**Objetivo:** Mantener el número de registros que el usuario prefiere ver (10, 25, 50, etc.).

**Archivo:** `assets/js/datatable-init.js`

1.  **Lectura (JS):** Dado que este script se ejecuta en el navegador, leemos la cookie directamente usando Expresiones Regulares.
    ```javascript
    const getCookie = (name) => {
        let match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
        return match ? match[2] : null;
    };
    
    // Si existe cookie, usa ese número. Si no, usa 10 por defecto.
    let savedLength = getCookie('table_rows');
    let pageLength = savedLength ? parseInt(savedLength) : 10;
    
    var table = $(this).DataTable({
        pageLength: pageLength,
        // ... otras configuraciones
    });
    ```

2.  **Guardado (JS):** Escuchamos el evento de cambio de longitud de la tabla.
    ```javascript
    table.on('length.dt', function (e, settings, len) {
        saveConfig('table_rows', len);
    });
    ```

---

## 3. Alertas de Navegación Nativas (Anti-Pérdida de Datos)

Este sistema previene que el usuario pierda información no guardada si intenta cerrar la pestaña, recargar la página o navegar a otra sección por error.

### Funcionamiento

Utilizamos el evento estándar del navegador `beforeunload`. Cuando este evento detecta que hay "cambios sin guardar", interrumpe la acción y muestra un cuadro de diálogo nativo preguntando al usuario si está seguro de querer salir.

**Nota Importante:** Los navegadores modernos (Chrome, Edge, Firefox) **no permiten personalizar el mensaje** de esta alerta por razones de seguridad. Siempre mostrarán un texto genérico como *"Es posible que los cambios no se guarden"*.

### Implementación Técnica

**Archivo:** `views/layout/footer.php` (o script global)

```javascript
/* --- PROTECCIÓN DE NAVEGACIÓN GLOBAL --- */

// Bandera global que indica si hay cambios sin guardar
window.formHasChanged = false;

// Evento: Alerta Nativa
window.addEventListener('beforeunload', function(e) {
    if (window.formHasChanged) {
        // Esta línea es necesaria para activar la alerta en navegadores modernos
        e.preventDefault();
        // El valor asignado es ignorado por el navegador, pero es requerido por el estándar
        e.returnValue = ''; 
    }
});
```

### Excepción: Navegación Interna Segura

Si deseamos que el usuario pueda navegar libremente por los enlaces del propio menú sin que aparezca la alerta (asumiendo que es una acción voluntaria), podemos desactivar la bandera automáticamente al hacer clic en enlaces internos.

```javascript
// Detectar clics en enlaces válidos
document.body.addEventListener('click', function(e) {
    let link = e.target.closest('a');
    
    // Si el clic fue en un enlace real (no javascript o anclas vacías)
    if (link && link.href && !link.href.startsWith('javascript:') && link.getAttribute('href') !== '#') {
        // Desactivamos la alerta temporalmente para permitir la navegación
        window.formHasChanged = false; 
    }
});
```

### Uso en Formularios

Para activar esta protección en una página específica (como "Crear Usuario"), solo debe cambiar el valor de la bandera global cuando detecte interacción.

```javascript
// Al cargar la página, inicie la bandera en falso
window.formHasChanged = false;

// Active la bandera cuando el usuario escriba en cualquier campo
$('form :input').on('change input', function() {
    window.formHasChanged = true;
});

// Desactive la bandera al enviar el formulario correctamente
$('form').on('submit', function() {
    window.formHasChanged = false;
});
```

### Limitaciones a Considerar

1.  **Interacción Requerida:** Para evitar abusos, los navegadores **no mostrarán ninguna alerta** si el usuario no ha interactuado con la página al menos una vez (un clic, tecla o toque). Si un usuario entra y sale inmediatamente sin tocar nada, la alerta no aparecerá. Esto es un comportamiento normal y esperado.


2. **Rutilizar el script de alerta de navegación global en todas las páginas** para que las alertas se muestren en todas las páginas. unicamente necesitas agregar la variable global window.formHasChanged = false; en cada página y utilizar los eventos de cambio de formulario para establecerla en true.
```javascript
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
```


3.  **Mensajes Estándar:** No intente modificar el texto de la ventana emergente de confirmación. Cualquier intento será ignorado por el navegador.
