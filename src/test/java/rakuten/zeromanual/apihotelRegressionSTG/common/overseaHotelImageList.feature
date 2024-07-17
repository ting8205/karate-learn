@common @api
Feature: overseaImage data

  Scenario: oversea

    Given url overseaSPHotelUrl

    And method GET


    Then match responseStatus == refStatus


      # print request info
    * print karate.request.url
    * print responseStatus
    * print response
     # * print refResponse