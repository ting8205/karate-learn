@common @api
Feature: Existing Client-Grant Permission Check
  Scenario: Existing Client-Grant Permission Check
    Given url testUrl
    And request requestBody
    And method POST
    Then match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response