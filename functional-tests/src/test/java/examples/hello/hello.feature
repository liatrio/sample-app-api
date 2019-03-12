Feature: Tests to make sure app is up

  Scenario: get all users and then get the first user by id
    Given url  'http://localhost:8080'
    Given path 'hello'
    When method get
    Then status 200
    And match $ == "Hello World"