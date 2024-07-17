@common @api
Feature: via gateway test
  Scenario: health via gateway
    Given url testUrl
    And method GET
    Then match responseStatus == refStatus

    * print karate.request.url
    * print karate.request.body
    * print karate.request.headers
    * print responseStatus
    * print response
    * print refResponse