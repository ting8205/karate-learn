@common @api
  Feature: SPHelper request api
    Scenario: get request
      Given url testUrl
      And path "/sphelper/verify/commonMaster/",cdCountry,mailAddr,sendMailFlag,hideDetail
      And method GET
      Then match responseStatus == refStatus

      # print request info
      * print karate.request.url
      * print responseStatus
      * print response
      * print refResponse