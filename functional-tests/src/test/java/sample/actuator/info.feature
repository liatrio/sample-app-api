Feature: Tests to make sure app is up

Background:
  * url baseUrl

Scenario: Check info actuator
  Given path 'actuator/info'
  When method get
  Then status 200
  And match $.build.artifact == "sample-app-api"