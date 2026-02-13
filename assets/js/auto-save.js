/**
 * Auto-Save en Formularios
 * Permite que los formularios con la clase 'auto-save' persistan sus datos localmente mientras se editan.
 * Se restauran automáticamente al cargar la página si no se han enviado.
 */
document.addEventListener('DOMContentLoaded', function() {
    const forms = document.querySelectorAll('form.auto-save');

    forms.forEach(form => {
        const uniqueId = form.getAttribute('data-autosave-id');
        if (!uniqueId) {
            console.warn('Formulario con clase .auto-save no tiene atributo data-autosave-id. Ignorando.');
            return;
        }

        const inputs = form.querySelectorAll('input:not([type="hidden"]):not([type="password"]), select, textarea');

        // 1. RESTAURAR DATOS AL CARGAR
        // Solo restaurar si el usuario NO ha enviado datos por POST (error de validación)
        // Si hay error de validación, CodeIgniter ya repone los valores con set_value, no queremos sobreescribir eso.
        // Podríamos detectar si hay valores, pero asumiremos que si localStorage existe, es más reciente.
        // MEJORA: Solo restaurar si el input está vacío o es el valor por defecto.
        
        inputs.forEach(input => {
            const key = `autosave_${uniqueId}_${input.name}`;
            const savedValue = localStorage.getItem(key);

            if (savedValue !== null) {
                // Solo aplicar si el campo está "vacío" o coincide con el valor por defecto para no pisar ediciones del servidor
                // Ojo: En este caso, queremos que el borrador local GANE si el usuario regresa.
                
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
        form.addEventListener('input', (e) => {
            saveInput(e.target, uniqueId);
        });
        
        form.addEventListener('change', (e) => {
            saveInput(e.target, uniqueId);
        });

        // 3. BORRAR DATOS AL ENVIAR EXITOSAMENTE
        form.addEventListener('submit', () => {
             // Limpiamos todo el storage asociado a este form
             inputs.forEach(input => {
                const key = `autosave_${uniqueId}_${input.name}`;
                localStorage.removeItem(key);
            });
        });

        function saveInput(input, formId) {
            if (!input.name || input.type === 'password' || input.type === 'hidden') return;
            
            const key = `autosave_${formId}_${input.name}`;
            let valueToSave = input.value;

            if (input.type === 'checkbox' || input.type === 'radio') {
                if (input.checked) {
                    valueToSave = input.value;
                } else {
                    // Si es checkbox y se desmarca, ¿borramos? Depende.
                    // Para radio buttons, solo guardamos el marcado.
                    return; 
                }
            }

            localStorage.setItem(key, valueToSave);
        }
    });
});
