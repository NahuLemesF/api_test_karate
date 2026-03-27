# API Test Karate

Proyecto de pruebas automatizadas sobre la API pública de [Automation Exercise](https://automationexercise.com/api_list), utilizando **Karate Framework** y **Maven**.

## Tecnologías utilizadas

- [Karate Framework 1.4.1](https://github.com/karatelabs/karate)
- [Maven 3.x](https://maven.apache.org/)
- Java 21
- JUnit 5

## Requisitos previos

- **Java 21** instalado (`java -version`) — Se recomienda Java 21 LTS. Java 25+ puede presentar incompatibilidades con GraalVM JS.
- **Maven 3.x** instalado (`mvn -version`)
- Conexión a internet (la API es pública)

## Estructura del proyecto

```
api_test_karate/
├── pom.xml                          # Configuración Maven y dependencias
├── README.md                        # Este archivo
├── .gitignore                       # Archivos ignorados por Git
└── src/
    └── test/
        └── java/
            ├── karate-config.js     # Configuración global de Karate
            └── automation/
                ├── ApiTestRunnerTest.java         # Runner JUnit 5
                ├── getProducts.feature           # Escenario GET
                ├── postSearchProduct.feature      # Escenario POST
                ├── putBrandsList.feature          # Escenario PUT
                └── deleteVerifyLogin.feature      # Escenario DELETE
```

## Cómo ejecutar las pruebas

### Ejecutar todos los escenarios

```bash
mvn test
```

### Ejecutar un escenario específico

```bash
mvn test -Dkarate.options="classpath:automation/getProducts.feature"
mvn test -Dkarate.options="classpath:automation/postSearchProduct.feature"
mvn test -Dkarate.options="classpath:automation/putBrandsList.feature"
mvn test -Dkarate.options="classpath:automation/deleteVerifyLogin.feature"
```

### Ver reporte de resultados

Después de ejecutar las pruebas, el reporte HTML se genera automáticamente en:

```
target/karate-reports/karate-summary.html
```

## Escenarios de prueba

| Método | Endpoint             | Escenario                                     | Resultado esperado |
|--------|----------------------|-----------------------------------------------|-------------------|
| GET    | `/api/productsList`  | Obtener lista completa de productos           | `responseCode: 200` con array de productos |
| POST   | `/api/searchProduct` | Buscar productos con término "top"            | `responseCode: 200` con productos filtrados |
| PUT    | `/api/brandsList`    | Intentar PUT sobre recurso de solo lectura    | `responseCode: 405` método no soportado |
| DELETE | `/api/verifyLogin`   | Intentar DELETE sobre recurso de verificación | `responseCode: 405` método no soportado |

### Nota sobre los escenarios PUT y DELETE

Los endpoints PUT `/api/brandsList` y DELETE `/api/verifyLogin` están diseñados por la API de Automation Exercise para **rechazar** esos métodos HTTP devolviendo `responseCode: 405`. Esto corresponde a los **escenarios API 4 y API 9** de la [documentación oficial](https://automationexercise.com/api_list). Validar que una API rechaza métodos no soportados es una práctica común en testing de APIs.

> **Nota técnica:** La API de Automation Exercise siempre retorna HTTP status `200`. El código real de respuesta se encuentra dentro del campo `responseCode` del JSON. Por eso en los `.feature` se usa `status 200` junto con la validación del `responseCode` interno.

## Referencia

- [Documentación de la API](https://automationexercise.com/api_list)
- [Documentación de Karate](https://github.com/karatelabs/karate)

---

## Autores

[Nahuel Lemes](https://github.com/NahuLemesF) - [Santiago Angarita](https://github.com/sanavi01)
