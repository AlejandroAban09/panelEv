# Documentación Técnica: Sistema de Persistencia de Formularios

**Proyecto:** PanelEv - Dunosusa  
**Módulo:** Core / UI UX  
**Fecha de Actualización:** 13 de Febrero de 2026  
**Estatus:** Implementado en Producción (Módulo Supervisores)

---

## 1. Introducción y Contexto

El objetivo de este componente es resolver una fricción crítica en la experiencia de usuario (UX): **la pérdida de datos en formularios extensos**.

Los usuarios operativos a menudo son interrumpidos, pierden conexión o recargan la página accidentalmente. La solución implementada garantiza que el progreso de captura se guarde localmente en tiempo real, restaurándose automáticamente al regresar, sin intervención del servidor.

---

## 2. Arquitectura de la Solución (Modelo Híbrido)

Se decidió utilizar una arquitectura híbrida para manejar la persistencia, dividiendo la responsabilidad entre el Navegador (Cliente) y CodeIgniter (Servidor).

### 2.1. Capa Cliente: Autoguardado (Drafts)
**Tecnología:** JavaScript + LocalStorage API.  
**Responsabilidad:** Persistencia inmediata de borradores *no enviados*.

**Implementación (Código JS):**
El script escucha eventos `input` y guarda en `localStorage`.
```javascript
// Ubicación: views/layout/footer.php (antes del </body>)
const forms = document.querySelectorAll('form.auto-save');
forms.forEach(form => {
    // Restaurar al cargar
    const savedValue = localStorage.getItem(`autosave_${uniqueId}_${input.name}`);
    if (savedValue) input.value = savedValue;

    // Guardar al escribir
    form.addEventListener('input', (e) => {
        localStorage.setItem(`autosave_${uniqueId}_${e.target.name}`, e.target.value);
    });
});
```

### 2.2. Capa Servidor: Recuperación de Errores
**Tecnología:** PHP (CodeIgniter Standard, Form Validation).  
**Responsabilidad:** Persistencia de datos tras un intento de envío fallido (Error de Validación).

**Implementación (Controlador):**
```php
// Ubicación: controllers/Supervisores.php
public function guardar() {
    $this->form_validation->set_rules('nombre', 'Nombre', 'required');

    if ($this->form_validation->run() == FALSE) {
        // ERROR: La validación falló.
        // CodeIgniter mantiene los datos del POST en memoria temporalmente.
        $this->layout->view('supervisores/crear'); 
    } else {
        // ÉXITO: Guardar en BD.
        $this->msupervisores->insert($data);
        // El script JS detectará el 'submit' exitoso y borrará el localStorage.
    }
}
```

---

## 3. Detalles de Implementación (Dónde y Cómo)

### 3.1. Núcleo del Sistema (`assets/js/auto-save.js`)
El script lógico no reside en cada vista, sino que se ha centralizado para facilitar el mantenimiento.
*   **Ubicación:** Inyectado directamente en `views/layout/footer.php` (para asegurar carga global).
*   **Selector:** Actúa sobre cualquier `<form>` que tenga la clase `.auto-save`.
*   **Manejo de IDs:** Usa el atributo `data-autosave-id` para generar claves únicas.

### 3.2. Integración en Vistas (HTML + PHP)
Para activar la funcionalidad en un nuevo formulario, se requieren dos configuraciones simultáneas:

**Ejemplo Completo - Formulario de Creación (`crear.php`):**
```php
<!-- 1. class="auto-save": Activa el script JS -->
<!-- 2. data-autosave-id="...": Identificador único para el localStorage -->
<form action="<?= $action ?>" method="post" class="auto-save" data-autosave-id="supervisor_nuevo">

    <label>Nombre</label>
    <!-- 3. set_value(): Recupera el valor si falló la validación PHP -->
    <!-- El JS recuperará el valor si se cerró la pestaña (localStorage) -->
    <input type="text" name="nombre" value="<?= set_value('nombre') ?>" required>

</form>
```

**Ejemplo Completo - Formulario de Edición (`editar.php`):**
Es vital usar un ID dinámico para evitar mezclar datos de distintos registros.
```php
<!-- ID Dinámico: supervisor_15, supervisor_16, etc. -->
<form method="post" class="auto-save" data-autosave-id="supervisor_<?= $supervisor->id ?>">

    <label>Nombre</label>
    <!-- set_value() con segundo parámetro para el valor actual de la BD -->
    <input type="text" name="nombre" value="<?= set_value('nombre', $supervisor->nombre) ?>">

</form>
```

---

## 4. Estrategia de Cookies y Futuras Implementaciones

Para funcionalidades futuras, se recomienda el uso de **Cookies de Servidor (PHP Helper)** en estos escenarios:

### 4.1. Escenario A: Preferencias de Usuario (Persistentes)
Configuraciones como "Tema Oscuro" o "Sidebar Colapsado".

```php
// SET (Controlador)
$this->input->set_cookie([
    'name'   => 'theme_mode',
    'value'  => 'dark',
    'expire' => 31536000 // 1 año
]);

// GET (Vista/Controlador)
$theme = $this->input->cookie('theme_mode', TRUE);
```

### 4.2. Escenario B: Seguridad y Sesiones
Para datos sensibles, usar siempre Sesiones.

```php
// SET
$this->session->set_userdata('user_id', 123);

// GET
$user_id = $this->session->userdata('user_id');
```

---

## 5. Guía de Mantenimiento y Troubleshooting

### 5.1. Limpieza de Datos
*   **Problema:** El usuario guarda, pero al volver a entrar ve los datos viejos.
*   **Causa:** El JS borra el `localStorage` solo en el evento `submit`. Si envías el formulario por AJAX manual, debes borrarlo tú mismo.
*   **Solución:**
    ```javascript
    // Si usas AJAX manual:
    localStorage.removeItem('autosave_supervisor_nuevo_nombre');
    ```

### 5.2. Colisiones
*   **Problema:** Al editar a "Juan" aparecen los datos de "Pedro".
*   **Solución:** Verificar que en `editar.php` el ID sea dinámico:
    ```html
    <!-- INCORRECTO -->
    <form data-autosave-id="supervisor_editar">
    
    <!-- CORRECTO -->
    <form data-autosave-id="supervisor_<?= $id ?>">
    ```

---

**Autor:** Equipo de Desarrollo PanelEv  
**Documentación para:** Transferencia de Proyecto (Handover)
