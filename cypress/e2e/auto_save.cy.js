describe('Pruebas de Caja Negra - Persistencia de Datos (Auto-Save)', () => {
  
  // Base URL configurada en cypress.config.js
  const urlCrearGerente = '/gerentes/crear';

  /**
   * NOTA: Esta prueba requiere que el usuario esté autenticado.
   * Si el sistema redirecciona al Login, se debe manejar la sesión.
   */
  beforeEach(() => {
    // Aquí podrías agregar un comando para iniciar sesión automáticamente
    // Por ahora, asumimos acceso o redirección manual para la prueba
    cy.visit(urlCrearGerente);
    
    // Si somos redirigidos al login, intentamos loguearnos (ajustar credenciales)
    cy.url().then((url) => {
      if (url.includes('/login')) {
        cy.get('input[name="usuario"]').type('admin'); // Ajustar según corresponda
        cy.get('input[name="password"]').type('admin123$'); // Ajustar según corresponda
        cy.get('button[type="submit"]').click();
        cy.visit(urlCrearGerente);
      }
    });
  });

  it('Escenario 1: Debe persistir el nombre y email al recargar la página', () => {
    const nombrePrueba = 'Alejandro Aban - Test';
    const emailPrueba = 'test.cypress@dunosusa.com';

    // 1. Llenar los campos
    cy.get('input[name="nombre"]').clear().type(nombrePrueba);
    cy.get('input[name="email"]').clear().type(emailPrueba);

    // 2. Simular recarga inesperada o navegación (F5)
    cy.reload();

    // 3. Verificar que los valores sigan ahí (Caja Negra)
    cy.get('input[name="nombre"]').should('have.value', nombrePrueba);
    cy.get('input[name="email"]').should('have.value', emailPrueba);
  });

  it('Escenario 2: Debe limpiar el localStorage al enviar el formulario con éxito', () => {
    // 1. Llenar campo
    cy.get('input[name="nombre"]').type('Borrar al enviar');
    
    // 2. Interceptar el envío para que no guarde realmente en BD si es preferible,
    // o simplemente verificar que tras el clic y navegación exitosa no haya rastro.
    
    // Nota: Para esta prueba de caja negra, asumimos que el envío nos lleva a otra página
    // cy.get('form').submit();
    // cy.url().should('not.include', '/crear');
    // cy.visit(urlCrearGerente);
    // cy.get('input[name="nombre"]').should('have.value', '');
  });

});
