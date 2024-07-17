@common @api
Feature: android device test
  Scenario: android index device
    Given url testUrl
    And header cookie = "Rz=Ay4inSYE4NfG_KnHGHLwA-pn5oJBAjZ1vc3eEuf_SO-k_mcGcIGnHPlmkALAHHbi2yFui1sYIFDrirGHQi6c9qkoHGtgZxbKKNVAUaKjs6TyOQzgO6XOObKvnUDvixA79zjKItW5UY3U"
    And path "/mynotify/deviceLogin/index"
    And params {rakuten_oauth_api:'#(rakuten_oauth_api)',akey:'#(akey)',apiClientId:'#(apiClientId)',easyId:'#(easyId)',method:'#(method)'}
    And method POST
    Then match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print karate.request.body
    * print karate.request.header
    * print responseStatus
    * print response
    * print refResponse