@common @api
Feature: create provider test
  Scenario: create provider
    Given url "http://provider.travel.stg.jp.local/provider//v1/providers"
    Given request {"specificId":'#(randomHotelNumber)',"category":"HOTEL"}
    And method POST
    Then match responseStatus == 201

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response
    * print karate.request.headers