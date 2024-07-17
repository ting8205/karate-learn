@common @api
Feature: oversea data

  Scenario: oversea

    Given url overseaUrl

    And method GET


    Then match responseStatus == refStatus


      # print request info
    * print karate.request.url
    * print responseStatus
    #* print response
     # * print refResponse




