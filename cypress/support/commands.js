// -- Comando personalizado de Login --
Cypress.Commands.add('login', (user = 'admin', pass = 'admin123$') => {
  cy.visit('/login');
  cy.get('input[name="usuario"]').type(user);
  cy.get('input[name="password"]').type(pass);
  cy.get('button[type="submit"]').click();
  // Verificar que entramos al panel
  cy.url().should('not.include', '/login');
});
