describe('Security Check', () => {
  it('Should redirect to login when accessing /gerentes without session', () => {
    // Clear cookies/session to ensure we are logged out
    cy.clearCookies();
    cy.clearLocalStorage();

    // Visit the protected route
    cy.visit('/panel');

    // Check if we are redirected to login
    cy.url().should('include', '/login');
    cy.contains('Iniciar sesión').should('be.visible');
  });
});
