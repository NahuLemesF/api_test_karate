Feature: POST - Buscar producto por nombre
  Valida que el endpoint POST /api/searchProduct permita
  buscar productos enviando un término de búsqueda.

  Background:
    * url baseUrl

  Scenario: Buscar productos con un término válido
    Given path '/searchProduct'
    And form field search_product = 'top'
    When method POST
    Then status 200
    And match response.responseCode == 200
    And match response.products == '#notnull'
    And match response.products == '#[_ > 0]'
    And match each response.products contains { id: '#number', name: '#string' }
