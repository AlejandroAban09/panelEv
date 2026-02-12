$(document).ready(function () {

  // Helper para leer cookies de forma segura
  const getCookie = (name) => {
      let match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
      if (match) return match[2];
      return null;
  }

  // Leer preferencia guardada
  let savedLength = getCookie('table_rows');
  console.log("Cookie 'table_rows' leída:", savedLength); // Debug

  let pageLength = savedLength ? parseInt(savedLength) : 10;

  $('.datatable').each(function () {

    // Evita reinicializar si vuelves a cargar la vista
    if ($.fn.DataTable.isDataTable(this)) return;

    var table = $(this).DataTable({
      pageLength: pageLength,
      responsive: {
        details: {
          type: 'inline' // en móvil muestra detalle abajo (muy limpio)
        }
      },
      order: [
        [0, 'desc']
      ],
      language: {
        url: "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-MX.json"
      },
      // Esto ayuda mucho en pantallas pequeñas
      autoWidth: false,

      // Layout Bootstrap friendly
      dom:
        "<'row g-2 align-items-center'<'col-12 col-md-6'l><'col-12 col-md-6'f>>" +
        "<'row'<'col-12'tr>>" +
        "<'row g-2 align-items-center'<'col-12 col-md-5'i><'col-12 col-md-7'p>>"
    });

    // Guardar preferencia al cambiar longitud
    table.on('length.dt', function (e, settings, len) {
        console.log("Guardando preferencia table_rows:", len); // Debug
        if(typeof saveConfig === 'function') {
            saveConfig('table_rows', len);
        } else {
            console.warn("saveConfig no está definida");
        }
    });

  });

});
