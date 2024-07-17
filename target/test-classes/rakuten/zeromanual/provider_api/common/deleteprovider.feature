@common @api
Feature: delete provider test
  Scenario: delete provider
    Given url "http://provider.travel.stg.jp.local/provider//v1/providers/"
    And path hotelid
    And method DELETE
    Then match responseStatus == 204

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response
    * print karate.request.headers