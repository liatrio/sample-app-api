Feature: Tests to make sure application endpoints work

Background:
  * url appUrl

Scenario: Check hello endpoint
  Given path 'hello'
  When method get
  And retry until responseStatus == 200 && response.id > 3
  Then status 200
  And match $. == "Hello World"