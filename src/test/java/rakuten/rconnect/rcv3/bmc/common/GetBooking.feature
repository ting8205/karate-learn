@common @api
Feature: R-Connect V3 BMC - GetBooking Test
  Scenario: GetBooking
    Given url testUrl
    And request requestBody
    And header Content-Type = "text/xml"
    When soap action "GetBooking"
    Then match responseStatus == refStatus
    # print request info
    * print karate.request.url
    * print karate.request.body
    * print karate.request.headers
    * print responseStatus
    * print response
    * print refResponse