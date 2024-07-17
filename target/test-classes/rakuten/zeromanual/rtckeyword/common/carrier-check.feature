@common @api
Feature: carrier-check
  Scenario: carrier-check
    Given url testUrl
    And params {keyword:"#(keyword)",carrier:"#(carrier)",responseType:"#(responseType)"}
    And method Get
    Then match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response