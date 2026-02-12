describe('Prueba de Acceso y Estilo del Login', () => {
  beforeEach(() => {
    cy.visit('/login');
  });

  it('Debe cargar la página de login correctamente', () => {
    // Verificar título o texto principal
    cy.contains('Iniciar sesión').should('be.visible');
    
    // Verificar inputs
    cy.get('input[name="usuario"]').should('be.visible');
    cy.get('input[name="password"]').should('be.visible');
    
    // Verificar botón con estilo (según tus reglas de estilo: color #de2b09 opcional verificar CSS)
    cy.get('button[type="submit"]')
      .should('contain', 'Iniciar sesión')
      .and('be.visible');
  });

  it('Debe manejar credenciales incorrectas (Test de Seguridad/UX)', () => {
    cy.get('input[name="usuario"]').type('adm');
    cy.get('input[name="password"]').type('admi');
    cy.get('button[type="submit"]').click();

    // Verificamos si aparece una alerta de Bootstrap (según login.php línea 124)
    cy.get('.alert-danger').should('be.visible')
      .and('contain', 'Usuario o contraseña incorrectos');
  });

  it('Debe iniciar sesión correctamente (Happy Path)', () => {
    // ------------------------------------------------------------
    const USUARIO_REAL = 'admin';
    const PASS_REAL    = 'admin123$';

    // Variables para datos aleatorios
    const randomId = Math.floor(Math.random() * 100000);
    const superName = `Sup Cypress`;
    const gerenteName = `Gerente Cypress`;
    const tiendaName = `Tienda Cypress`;
    const emailSuffix = `test@test.com`;

    cy.get('input[name="usuario"]').type(USUARIO_REAL);
    cy.get('input[name="password"]').type(PASS_REAL);
    cy.get('button[type="submit"]').click();

    // Verificaciones de éxito
    cy.url().should('include', '/panel'); 
    cy.get('nav, .sidebar, #sidebar').should('exist');
    /**
     * TODO: Verificar que el usuario esté logueado Y Comenzar a probar la navegación
     * ? ¿Qué más pruebas se pueden hacer?
     * !cuidado con el orden de las pruebas
     */

    // 1. ENCARGADOS (Solo navegación por ahora)
    cy.contains('Encargados').should('be.visible').click();
    cy.contains('Encargados').should('be.visible');
    cy.get('a.btn-primary, button.btn-primary').contains('Nuevo').click(); 
    cy.url().should('include', '/crear'); 
    cy.contains('Regresar').click();
    cy.url().should('not.include', '/nuevo');

    // 2. SUPERVISORES (Crear uno nuevo)
    cy.contains('Supervisores').click();
    cy.contains('Supervisores').should('be.visible'); 
    cy.get('a.btn-primary, button.btn-primary').contains('Nuevo').click(); 
    
    // Formulario Supervisor
    cy.url().should('include', '/crear'); 
    cy.get('input[name="nombre"]').type(superName);
    cy.get('input[name="telefono_sin_prefijo"]').type('9991234561');
    cy.get('input[name="email"]').type(`sup${randomId}${emailSuffix}`);
    cy.get('button.btn-primary').contains('Guardar').click();

    // Validar creación
    cy.url().should('not.include', '/crear');
    cy.contains(superName).should('be.visible');

    // 3. GERENTES (Crear uno nuevo - Moviendo antes de tiendas para asignarlo)
    cy.contains('Gerentes').click();
    cy.contains('Gerentes').should('be.visible');
    cy.get('a.btn-primary, button.btn-primary').contains('Nuevo').click();

    // Formulario Gerente
    cy.url().should('include', '/crear');
    cy.get('input[name="nombre"]').type(gerenteName);
    cy.get('input[name="telefono_sin_prefijo"]').type('9997654331');
    cy.get('input[name="email"]').type(`ger${randomId}${emailSuffix}`);
    cy.get('button.btn-primary').contains('Guardar').click();

    // Validar creación
    cy.url().should('not.include', '/crear');
    cy.contains(gerenteName).should('be.visible');

    // 4. TIENDAS (Crear una nueva y asignar gerente/supervisor)
    cy.contains('Tiendas').click();
    cy.contains('Tiendas').should('be.visible');
    cy.get('a.btn-primary, button.btn-primary').contains('Nueva').click();

    // Formulario Tienda
    cy.url().should('include', '/crear');
    cy.get('input[name="nombre"]').type(tiendaName);
    cy.get('input[name="centro_costo"]').type(`CC-${randomId}`);
    
    // Selección de Gerente y Supervisor
    // Nota: Al usar Select2, el select original estat oculto/cubierto. Usamos force:true para obligar la selección o simulamos click en UI.
    cy.get('select[name="gerente_id"]').select(gerenteName, { force: true });
    cy.get('select[name="supervisor_id"]').select(superName, { force: true });

    cy.get('button.btn-primary').contains('Guardar').click();

    // Validar creación
    cy.url().should('not.include', '/crear');
    // Es posible que la tienda aparezca en la tabla. Verificamos texto visible.
    cy.contains(tiendaName).should('be.visible');

    // 5. OTRAS SECCIONES
    cy.contains('Evidencias').click();
    cy.contains('Evidencias').should('be.visible');

    cy.contains('Tipos evidencia').click();
    
    // CERRAR SESIÓN
    cy.contains('Cerrar sesión').click(); 
    cy.url().should('include', '/login');
    cy.contains('Iniciar sesión').should('be.visible');
  });
});
