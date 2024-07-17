@common @api
Feature: via hostname direct test
  Scenario: health via hostname direct
    Given url testUrl
    And method GET
    Then match responseStatus == refStatus

    * print karate.request.url
    * print karate.request.body
    * print karate.request.headers
    * print responseStatus
    * print response
    * print refResponse