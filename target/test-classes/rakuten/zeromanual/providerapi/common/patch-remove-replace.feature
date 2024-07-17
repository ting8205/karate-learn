@common @api
Feature: remove districtId
  Scenario: remove districtId
    Given url testUrl
    And path "/34cc8383-f435-48de-94c0-c48dfeb3be85"
    And request requestBody
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And method PATCH
    And match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print karate.request.body
    * print karate.request.headers
    * print responseStatus
    * print response
