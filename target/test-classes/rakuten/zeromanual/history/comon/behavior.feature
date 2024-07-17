@common @api
Feature: history behavior test
  Scenario: history behavior
    Given url testUrl
    And path '/historyapi/v1/ja_JP/behavior/31571?type=pageview&fromDate=${fromDate[0]}&toDate=${toDate[1]}'
    #And params {type:'#(type)',fromDate:'#()'}
    And method GET
    Then match responseStatus == refStatus

    * print karate.request.url
    * print karate.request.body
    * print karate.request.headers
    * print responseStatus
    * print response
    * print refResponse