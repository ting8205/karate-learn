@common @api
Feature: calendar/check
  Scenario: calendar/check
    Given url testUrl
    And path "/calendar/check"
    And method Get
    Then match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response
    * print refResponse