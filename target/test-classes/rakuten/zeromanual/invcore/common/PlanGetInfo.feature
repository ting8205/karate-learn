@common @api
Feature: Invcore - Plan - GetInfo Test
  Scenario: GetInfo
    Given url testUrl
    And path "invcore/2/plan/getInfo"
    And form field apiRequestString = apiRequestString
    And form field version = 20120628
    And form field apiClientId = "hmsari"
    And header Content-Type = "application/x-www-form-urlencoded"
    And method POST
    Then match responseStatus == refStatus
    # print request info
    * print karate.request.url
    * print karate.request.body
    * print karate.request.headers
    * print responseStatus
    * print response
    * print refResponse