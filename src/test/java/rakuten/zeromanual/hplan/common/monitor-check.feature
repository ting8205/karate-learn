@common @api
Feature: monitor/check
  Scenario: /monitor/check
    Given url testUrl
    And path "/monitor/check"
    And method Get
    Then match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response
    * print refResponse