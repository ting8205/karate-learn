@common @api
Feature: create provider
  Scenario: create provider
    Given url testUrl
    Given request {"specificId":'#(randomHotelNumber)',"category":"HOTEL"}
    And method POST
    Then match responseStatus == 201

    # print request info
    * print karate.request.url
    * print karate.request.headers
    * print karate.request.body
    * print responseStatus
    * print response
