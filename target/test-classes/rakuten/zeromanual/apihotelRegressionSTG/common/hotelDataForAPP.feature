@common @api
Feature: hotel data for app

  Scenario: domestic

    Given url appURL

    And method GET


    Then match responseStatus == refStatus


      # print request info
    * print karate.request.url
    * print responseStatus
    * print response
     # * print refResponse