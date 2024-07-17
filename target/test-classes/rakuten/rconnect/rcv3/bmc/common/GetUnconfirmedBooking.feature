@common @api
Feature: R-Connect V3 BMC - GetUnconfirmedBooking Test
  Scenario: GetUnconfirmedBooking
    Given url testUrl
    And request requestBody
    And header Content-Type = "text/xml"
    When soap action "GetUnconfirmedBooking"
    Then match responseStatus == refStatus
    # print request info
    * print karate.request.url
    * print karate.request.body
    * print karate.request.headers
    * print responseStatus
    * print response
    * print refResponse