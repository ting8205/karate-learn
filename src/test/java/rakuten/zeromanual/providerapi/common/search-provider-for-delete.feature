@common @api
Feature: search-provider-for-delete
  Scenario: search-provider-for-delete
    Given url testUrl
    And path "/search/findByCategoryAndSpecificId"
    And params  {"specificId":'#(randomHotelNumber)',"category":"HOTEL"}
    And method GET
    Then match responseStatus == 200

    # print request info
    * print karate.request.url
    * print karate.request.headers
    * print karate.request.body
    * print responseStatus
    * print response
