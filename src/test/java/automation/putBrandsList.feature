Feature: PUT - Intentar actualizar lista de marcas
  Valida que el endpoint PUT /api/brandsList rechace la solicitud
  porque el método PUT no está soportado en este recurso.
  Corresponde al escenario API 4 de Automation Exercise.

  Background:
    * url baseUrl

  Scenario: Verificar que PUT no está soportado en brandsList
    Given path '/brandsList'
    When method PUT
    Then status 200
    And match response.responseCode == 405
    And match response.message == 'This request method is not supported.'
