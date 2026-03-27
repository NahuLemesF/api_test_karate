Feature: DELETE - Intentar eliminar verificación de login
  Valida que el endpoint DELETE /api/verifyLogin rechace la solicitud
  porque el método DELETE no está soportado en este recurso.
  Corresponde al escenario API 9 de Automation Exercise.

  Background:
    * url baseUrl

  Scenario: Verificar que DELETE no está soportado en verifyLogin
    Given path '/verifyLogin'
    When method DELETE
    Then status 200
    And match response.responseCode == 405
    And match response.message == 'This request method is not supported.'
