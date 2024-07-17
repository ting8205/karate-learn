@common @api
Feature: fetch provider v1
  Scenario: fetch provider v1
    Given url testUrl
    And path "/34cc8383-f435-48de-94c0-c48dfeb3be85"
    And method GET
    And match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response
    * print refResponse
