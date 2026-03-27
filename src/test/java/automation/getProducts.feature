Feature: GET - Obtener lista de productos
  Valida que el endpoint GET /api/productsList retorne
  la lista completa de productos con sus datos.

  Background:
    * url baseUrl

  Scenario: Obtener todos los productos exitosamente
    Given path '/productsList'
    When method GET
    Then status 200
    And match response.responseCode == 200
    And match response.products == '#notnull'
    And match response.products == '#[_ > 0]'
    And match each response.products contains { id: '#number', name: '#string', price: '#string', brand: '#string' }
