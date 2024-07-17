@common @api
  Feature: domestic data

    Scenario: domestic

      Given url domesticUrl

      And method GET


      Then match responseStatus == refStatus


      # print request info
      * print karate.request.url
      * print responseStatus
      * print response
      * print refResponse




