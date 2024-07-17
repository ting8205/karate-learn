@common @api
Feature: spt api - error
  Scenario: Error
    Given url testUrl
    And path "/error"
    And method GET
    Then match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response
    * print karate.request.headers