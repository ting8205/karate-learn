@common @api
Feature: searchdelete provider test
  Scenario: searchdelete provider
    Given url "http://provider.travel.stg.jp.local/provider//v1/providers/search/findByCategoryAndSpecificId"
    And params  {"specificId":'#(randomHotelNumber)',"category":"HOTEL"}
    And method GET
    Then match responseStatus == 200

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response
    * print karate.request.headers