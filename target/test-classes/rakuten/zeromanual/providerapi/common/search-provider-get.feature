@common @api
Feature: search provider get
  Scenario: search provider get
    Given url testUrl
    And path "/search/findByCategoryAndSpecificId"
    And params {category:"HOTEL",specificId:"102498"}
    And method GET
    And match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response
    * print refResponse
