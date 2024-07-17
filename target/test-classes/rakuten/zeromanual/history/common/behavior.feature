@common @api
Feature: history behavior test
  Scenario: history behavior
    Given url testUrl
    And path '/historyapi/v1/ja_JP/behavior/'
    And params {providerId:'#(providerId)',type:'#(type)',fromDate:'#(fromDate)',toDate:'#(toDate)'}
    And method GET
    Then match responseStatus == refStatus

    * print karate.request.url
    * print karate.request.body
    * print karate.request.headers
    * print responseStatus
    * print response
    * print refResponse