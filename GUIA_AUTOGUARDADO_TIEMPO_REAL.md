# Guía de Implementación: Autoguardado en Formularios


El sistema detecta automáticamente cuando un usuario escribe en un formulario marcado y guarda sus datos en el navegador en tiempo real. Si el usuario interrumpe su sesión y vuelve más tarde, los campos se restauran automáticamente. Al guardar el formulario exitosamente, los datos temporales se limpian.

### Diferencias Clave: ¿Por qué PHP (Cookies) no funcionó?

Es importante entender la diferencia entre las dos aproximaciones que intentamos:

| Característica | **Método PHP (Cookies)** | **Método JS (LocalStorage)** |
| :--- | :--- | :--- |
| **Cuándo Guarda** | Solo al **ENVIAR** (Submit) el formulario al servidor. | Al **ESCRIBIR** (Input/Change) en tiempo real. |
| **Persistencia** | Requiere una recarga de página para "recordar". | Persiste instantáneamente sin recargar. |
| **Caso de Uso** | Recordar preferencias (Filtros, Tema Oscuro). | Recordar borradores no enviados (Autoguardado). |
| **Problema** | Si el usuario escribe y cierra la pestaña *sin enviar*, **se pierde todo**, porque el servidor nunca recibió los datos. | Si el usuario escribe y cierra la pestaña, el navegador ya lo guardó localmente. **No se pierde nada.** |

---

##  Cómo Implementarlo en Otros Proyectos

Para replicar esta funcionalidad en cualquier otro formulario o proyecto, sigue estos 3 pasos sencillos.

### Paso 1: Incluir el Script Global (Una vez por proyecto)

Asegúrate de tener este script en tu **Footer** o archivo JS principal (`layout/footer.php` o `assets/js/main.js`).

```javascript
/* assets/js/auto-save.js */
document.addEventListener('DOMContentLoaded', function() {
    // 1. Detectar formularios con la clase .auto-save
    const forms = document.querySelectorAll('form.auto-save');

    forms.forEach(form => {
        // 2. Obtener ID único (Vital para no mezclar datos de distintos forms)
        const uniqueId = form.getAttribute('data-autosave-id');
        if (!uniqueId) return;

        const inputs = form.querySelectorAll('input:not([type="hidden"]):not([type="password"]), select, textarea');

        // 3. RESTAURAR DATOS AL CARGAR (Recuperar del LocalStorage)
        inputs.forEach(input => {
            const key = `autosave_${uniqueId}_${input.name}`;
            const savedValue = localStorage.getItem(key);

            if (savedValue) {
                if (input.type === 'checkbox' || input.type === 'radio') {
                    if (input.value === savedValue) input.checked = true;
                } else {
                    input.value = savedValue;
                }
            }
        });

        // 4. GUARDAR DATOS AL ESCRIBIR (Input / Change)
        const saveHandler = (e) => {
            const input = e.target;
            // Ignorar passwords y campos ocultos por seguridad
            if (!input.name || input.type === 'password' || input.type === 'hidden') return;
            
            const key = `autosave_${uniqueId}_${input.name}`;
            let valueToSave = input.value;

            // Manejo especial para Checkboxes/Radios
            if (input.type === 'checkbox' || input.type === 'radio') {
                if (input.checked) valueToSave = input.value;
                else return; 
            }
            
            localStorage.setItem(key, valueToSave); // ¡Guardado!
        };

        form.addEventListener('input', saveHandler);
        form.addEventListener('change', saveHandler);

        // 5. LIMPIEZA: BORRAR DATOS AL ENVIAR EXITOSAMENTE
        form.addEventListener('submit', () => {
             inputs.forEach(input => {
                const key = `autosave_${uniqueId}_${input.name}`;
                localStorage.removeItem(key);
            });
        });
    });
});
```

### Paso 2: Marcar el Formulario HTML

En tu vista (ej. `crear.php`), solo necesitas agregar dos atributos a la etiqueta `<form>`:

1.  **Clase:** `class="auto-save"`
2.  **ID Único:** `data-autosave-id="nombre_unico_del_form"`

**Ejemplo de Implementación:**

```html
<!-- Formulario de Creación -->
<form action="ruta/guardar" method="post" class="auto-save" data-autosave-id="producto_nuevo">
    <!-- Tus inputs normales -->
    <input type="text" name="nombre" required>
</form>
```

### Paso 3: Considerar IDs Dinámicos (Para Edición)

Si estás en un formulario de **Edición**, el ID debe ser único para ese registro específico. De lo contrario, si editas el "Producto A" y luego el "Producto B", verás los datos del A en el B.

**Ejemplo PHP para Edición:**

```php
<!-- Usamos el ID del registro dentro del ID del autosave -->
<form action="..." method="post" class="auto-save" data-autosave-id="producto_<?= $producto->id ?>">
    <input type="text" name="nombre" value="<?= $producto->nombre ?>">
</form>
```

---

##  Aspectos Importantes a Considerar

1.  **Seguridad (Passwords):**
    *   El script está configurado para **ignorar** inputs de tipo `password`. Nunca se deben guardar contraseñas en `localStorage` o Cookies inseguras, ya que son texto plano accesible desde la consola del navegador.

2.  **Campos Ocultos (Hidden):**
    *   También se ignoran los `input type="hidden"`. Generalmente estos contienen IDs o tokens que no deben ser manipulados o persistidos manualmente por el usuario.

3.  **Limpieza Automática:**
    *   Es crucial que el script limpie el almacenamiento al hacer `submit`. Si no lo hace, el usuario guardará el formulario, y al volver a entrar para crear otro registro nuevo, verá los datos del anterior. (Nuestro script ya maneja esto en el evento `submit`).

4.  **Colisiones de Nombres:**
    *   Usamos un prefijo `autosave_` + `ID_DEL_FORM` + `NAME_DEL_INPUT`. Esto asegura que un input llamado `nombre` en el formulario de "Clientes" no sobrescriba al input `nombre` del formulario de "Productos".
    *   **Condición:** Asegúrate de que tus inputs tengan el atributo `name="..."`.

##  Conclusión

Este sistema proporciona una experiencia de usuario (UX) mucho más robusta y "a prueba de fallos", salvando el trabajo del usuario en el navegador localmente sin necesidad de peticiones al servidor ni bases de datos temporales complejas.
