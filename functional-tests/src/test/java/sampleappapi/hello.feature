Feature: Tests to make sure application endpoints work

Background:
  * url appUrl

Scenario: Check hello endpoint
  * configure retry = { count: 5, interval: 0 }
  Given path 'hello'
  When method get
  And retry until responseStatus == 200
  Then status 200
  And match $. == "Hello World"