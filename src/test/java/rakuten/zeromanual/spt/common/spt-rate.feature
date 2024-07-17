@common @api
Feature: spt api - Request with right rate
  Scenario: Request with right rate
    Given url testUrl
    And path "/spt/api/rate",fromRate,toRate
    And method GET
    Then match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response
    * print refResponse
