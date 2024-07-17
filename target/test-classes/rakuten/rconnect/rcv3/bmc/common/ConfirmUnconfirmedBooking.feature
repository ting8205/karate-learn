@common @api
Feature: R-Connect V3 BMC - ConfirmUnconfirmedBooking Test
  Scenario: ConfirmUnconfirmedBooking
    Given url testUrl
    And request requestBody
    And header Content-Type = "text/xml"
    When soap action "ConfirmUnconfirmedBooking"
    Then match responseStatus == refStatus
    # print request info
    * print karate.request.url
    * print karate.request.body
    * print karate.request.headers
    * print responseStatus
    * print response
    * print refResponse