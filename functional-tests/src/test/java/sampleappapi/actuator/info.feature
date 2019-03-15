Feature: Tests to make actuator is configured

Background:
  * url appUrl

Scenario: Check info actuator
  Given path 'actuator/info'
  When method get
  Then status 200
  And match $.build.artifact == "sample-app-api"