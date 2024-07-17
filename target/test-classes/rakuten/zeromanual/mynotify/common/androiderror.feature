@common @api
Feature: android device test
  Scenario: android error device
    Given url testUrl
    And path path
    And params {rakuten_oauth_api:'#(rakuten_oauth_api)',akey:'#(akey)',apiClientId:'#(apiClientId)',easyId:'#(easyId)',method:'#(method)'}
    And method POST
    Then match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response