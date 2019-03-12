Feature: Tests to make sure app is up

  Scenario: Check app for hello World route
    Given url  'http://localhost:8080'
    Given path 'hello'
    When method get
    Then status 200
    And match $ == "Hello World"