@common @api
Feature: OTA_Read
  Scenario: GetBooking
    Given url testUrl
    And request requestBody
    And header Content-Type = "text/xml"
    And form field apiKey = "xr51vHHFpwCUpGSZSIdl5TkKG6waxRFk"
    When soap action "OTA_Read"
    Then match responseStatus == refStatus
    # print request info
    * print karate.request.url
    * print karate.request.body
    * print karate.request.headers
    * print responseStatus
    * print response
    * print refResponse