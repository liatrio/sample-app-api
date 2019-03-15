Feature: Tests to make sure app is up

  Background:
    * url baseUrl
  Scenario: Check app for hello World route
    Given url  apiUrl
    Given path 'hello'
    When method get
    Then status 200
    And match $ == "Hello World"