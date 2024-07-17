@common @api
Feature: fetch provider v2
  Scenario: fetch provider v2
    Given url "http://provider.travel.stg.jp.local/provider//v2/providers/34cc8383-f435-48de-94c0-c48dfeb3be85"
    And method GET
    And match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response
    * print refResponse
