@common @api
Feature: delete provider
  Scenario: delete provider
    Given url testUrl
    And path hotelid
    And method DELETE
    Then match responseStatus == 204

    # print request info
    * print karate.request.url
    * print karate.request.headers
    * print karate.request.body
    * print responseStatus
    * print response