@common @api
Feature: overseahotel data for app

  Scenario: domestic

    Given url overseaappURL

    And method GET


    Then match responseStatus == refStatus


      # print request info
    * print karate.request.url
    * print responseStatus
    * print response
     # * print refResponse