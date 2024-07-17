@common @api
Feature: spt api -hotelAvailList
  Scenario: spt-hotelAvailList
    Given url testUrl
    And path "/spt/api/hotelAvailList/", hotelId
    And params {from:'#(fromDate)',to:'#(toDate)'}
    And method GET
    Then match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response
    * print refResponse
