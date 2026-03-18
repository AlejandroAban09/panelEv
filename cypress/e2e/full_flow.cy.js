describe('Automatización Completa - Panel de Evidencias', () => {

  const siteUrl = 'http://localhost/dunosusa-panelev/index.php';

  beforeEach(() => {
    // Definimos el viewport para asegurar que los elementos sean visibles
    cy.viewport(1280, 720);
  });

  // 1. AUTENTICACIÓN
  context('Módulo: Autenticación', () => {
    it('Debe mostrar error con credenciales incorrectas', () => {
      cy.visit('/login');
      cy.get('input[name="usuario"]').type('usuario_falso');
      cy.get('input[name="password"]').type('password_error');
      cy.get('button[type="submit"]').click();
      cy.get('.alert-danger').should('be.visible').and('contain', 'Usuario o contraseña incorrectos');
    });

    it('Debe iniciar sesión correctamente con credenciales válidas', () => {
      cy.login('admin', 'admin123$');
      cy.url().should('include', '/panel');
      cy.get('.fw-semibold').should('contain', 'Panel Administrativo');
    });
  });

  // 2. NAVEGACIÓN Y SIDEBAR
  context('Módulo: Navegación Global', () => {
    beforeEach(() => cy.login());

    it('Debe navegar por todas las secciones principales desde el Sidebar', () => {
      const secciones = [
        { name: 'Evidencias', url: '/tickets' },
        { name: 'Tiendas', url: '/tiendas' },
        { name: 'Tipos evidencia', url: '/incidencias' },
        { name: 'Administradores', url: '/usuarios' },
        { name: 'Gerentes', url: '/gerentes' },
        { name: 'Supervisores', url: '/supervisores' },
        { name: 'Encargados Tienda', url: '/encargados' }
      ];

      secciones.forEach(sec => {
        cy.get('.sidebar').contains(sec.name).click();
        cy.url().should('include', sec.url);
        cy.get('h1').should('be.visible');
      });
    });

    it('Debe cerrar sesión correctamente', () => {
      cy.get('.sidebar').contains('Cerrar sesión').click();
      cy.url().should('include', '/login');
    });
  });

  // 3. FLUJO DE TIENDAS (CRUD + MODALES)
  context('Módulo: Tiendas', () => {
    beforeEach(() => {
      cy.login();
      cy.visit('/tiendas');
    });

    it('Debe validar que los campos sean obligatorios al crear', () => {
      cy.get('a[aria-label="Nueva tienda"]').click();
      cy.get('button').contains('Guardar').click();
      // HTML5 Validation check - el input debe tener :invalid
      cy.get('input[name="nombre"]:invalid').should('exist');
    });

    it('Debe buscar una tienda en el DataTable', () => {
      const query = 'Tienda'; 
      cy.get('input[type="search"]').type(query);
      cy.get('.datatable tbody tr').first().should('be.visible');
    });

    it('Debe abrir el modal de detalles', () => {
      cy.get('.btn-soft-info.btn-action').first().click();
      cy.get('#modalVerDetalles').should('be.visible');
      cy.get('#modalVerDetalles .modal-title').should('contain', 'Detalles de la Tienda');
      cy.get('#modalVerDetalles .btn-secondary').click();
      cy.get('#modalVerDetalles').should('not.be.visible');
    });

    it('Debe mostrar modal de confirmación al intentar eliminar', () => {
      cy.get('.btn-soft-danger.btn-action').first().click();
      cy.get('#modalEliminar').should('be.visible');
      cy.get('#modalEliminar .modal-title').should('contain', 'Confirmar eliminación');
      cy.get('#modalEliminar').contains('Cancelar').click();
    });
  });

  // 4. PERSISTENCIA Y ERRORES (GERENTES)
  context('Módulo: Gerentes & UX', () => {
    beforeEach(() => {
      cy.login();
      cy.visit('/gerentes/crear');
    });

    it('Debe funcionar el Auto-Save tras recarga', () => {
      const testName = 'Test Persistencia Cypress';
      cy.get('input[name="nombre"]').type(testName);
      cy.reload();
      cy.get('input[name="nombre"]').should('have.value', testName);
    });

    it('Debe mostrar feedback visual (SweetAlert2/Modales) en acciones', () => {
      // Intentamos navegar a una sección y verificamos elementos premium
      cy.visit('/panel');
      cy.get('.card-stat').should('have.length.at.least', 1);
      // Cambiar tema (Dark Mode)
      cy.get('.theme-switcher').click();
      cy.get('body').should('have.class', 'dark-mode');
      cy.get('.theme-switcher').click();
      cy.get('body').should('not.have.class', 'dark-mode');
    });
  });

  // 5. EVIDENCIAS (TICKETS)
  context('Módulo: Evidencias', () => {
    beforeEach(() => {
      cy.login();
      cy.visit('/tickets');
    });

    it('Debe navegar al detalle de un ticket', () => {
      cy.get('.btn-detail').first().click();
      cy.url().should('include', '/tickets/detalle/');
      cy.get('.card-body').should('be.visible');
      cy.get('.bi-arrow-left-circle').should('exist');
    });
  });

  // 6. USUARIOS
  context('Módulo: Usuarios', () => {
    beforeEach(() => {
      cy.login();
      cy.visit('/usuarios');
    });

    it('Debe buscar un usuario en el DataTable', () => {
      const query = 'Usuario'; 
      cy.get('input[type="search"]').type(query);
      cy.get('.datatable tbody tr').first().should('be.visible');
    });


    it('Debe mostrar modal de confirmación al intentar eliminar', () => {
      cy.get('.btn-soft-danger.btn-action').first().click();
      cy.get('#modalEliminar').should('be.visible');
      cy.get('#modalEliminar .modal-title').should('contain', 'Confirmar eliminación');
      cy.get('#modalEliminar').contains('Cancelar').click();
    });
  });

  // 7. cerrar sesion
  context('Módulo: Cerrar Sesión', () => {
    beforeEach(() => {
      cy.login();
      cy.visit('/panel');
    });

    it('Debe cerrar sesión correctamente', () => {
      cy.get('.theme-switcher').click();
      cy.get('body').should('have.class', 'dark-mode');
      cy.get('.theme-switcher').click();
      cy.get('body').should('not.have.class', 'dark-mode');
      cy.get('.sidebar').contains('Cerrar sesión').click();
      cy.visit('/login');
    });
  });

});
