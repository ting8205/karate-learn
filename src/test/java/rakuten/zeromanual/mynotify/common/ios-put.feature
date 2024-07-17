@common @api
Feature: ios device test
  Scenario: ios put and get device
    Given url testUrl
    And path path
    And params {rakuten_oauth_api:'#(rakuten_oauth_api)',akey:'#(akey)',apiClientId:'#(apiClientId)',easyId:'#(easyId)',deviceToken:'#(deviceToken)',pushType:'#(pushType)'}
    And method POST
    Then match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print karate.request.body
    * print karate.request.header
    * print responseStatus
    * print response
    * print refResponse