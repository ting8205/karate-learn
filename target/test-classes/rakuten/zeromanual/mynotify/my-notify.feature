@mynotify
Feature: spt api
  Background:
    * def utils = Java.type("rakuten.utils.Utils")
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://stg-atrmynotify101z.stg.jp.local"

  @tc001
  Scenario Outline:  <testcase>
    * def refStatus = 200
    * def path = "<path>"
    Given def requestWithIosDevice = call read("common/ios-put.feature")
    * def actualResponse = requestWithIosDevice.response
    Then match actualResponse == refResponse

    Examples:
      | read("data/ios-put.csv") |

    @tc002
    Scenario Outline:  <testcase>
      * def refStatus = 200
      * def path = "<path>"
      Given def requestWithIosDevice = call read("common/ios-get.feature")
      * def actualResponse = requestWithIosDevice.response
      Then match actualResponse == refResponse

      Examples:
        | read("data/ios-get.csv") |

    @tc003
    Scenario Outline:  <testcase>
      * def refStatus = 200
      * def path = "<path>"
      Given def requestWithIosDevice = call read("common/ios-delete.feature")
      * def actualResponse = requestWithIosDevice.response
      Then match actualResponse == refResponse

      Examples:
        | read("data/ios-delete.csv") |

    @tc004
    Scenario:  TC001-AndroidDevicewithputNormalPattern
      * def refStatus = 200
      * def akey = "iv6k8rA"
      * def apiClientId = "travel_android"
      * def easyId = "39209872"
      * def refResponse = read("response/scenario/TC007-AndroidDeviceNormalPattern.json")
      Given def requestWithIosDevice = call read("common/android-put.feature")
      * def actualResponse = requestWithIosDevice.response
      Then match actualResponse == refResponse

    @tc005
    Scenario:  TC002-AndroidDevicewithputErrorPattern
      * def refStatus = 404
      * def akey = "iv6k8rA"
      * def apiClientId = "travel_android"
      * def easyId = "aaa"
      * def refResponse = read("response/scenario/TC008-AndroidDeviceErrorPattern.html")
      Given def requestWithIosDevice = call read("common/android-put.feature")
      * def actualResponse = requestWithIosDevice.response
      Then match actualResponse contains "Content-Type"
      Then match actualResponse contains "text/html; charset=UTF-8"
      Then match actualResponse contains "楽天トラベル : 指定されたページが見つかりません（エラー404）"

    @tc006
    Scenario:  TC003-AndroidDevicewithindexNormalPattern
      * def refStatus = 200
      * def rakuten_oauth_api = "rakutentravel_myapi"
      * def akey = "aLknnlK"
      * def apiClientId = "travel_android"
      * def easyId = "39209872"
      * def method = "put"
      * def refResponse = read("response/scenario/TC007-AndroidDeviceNormalPattern.json")
      Given def requestWithIosDevice = call read("common/android-index.feature")
      * def actualResponse = requestWithIosDevice.response
      Then match actualResponse == refResponse

    @tc007
    Scenario:  TC004-AndroidDevicewithindexErrorPattern
      * def refStatus = 404
      * def rakuten_oauth_api = "rakutentravel_myapi"
      * def akey = "aLknnlK"
      * def apiClientId = "travel_android"
      * def easyId = "Ab"
      * def method = "put"
      * def refResponse = read("response/scenario/TC008-AndroidDeviceErrorPattern.html")
      Given def requestWithIosDevice = call read("common/android-index.feature")
      * def actualResponse = requestWithIosDevice.response
      Then match actualResponse contains "Content-Type"
      Then match actualResponse contains "text/html; charset=UTF-8"
      Then match actualResponse contains "楽天トラベル : 指定されたページが見つかりません（エラー404）"

    @tc008
    Scenario:  TC005-AndroidDevicewithdeleteNormalPattern
      * def refStatus = 200
      * def rakuten_oauth_api = "rakutentravel_myapi"
      * def akey = "aLknnlK"
      * def apiClientId = "travel_android"
      * def easyId = "39209872"
      * def method = "delete"
      * def refResponse = read("response/scenario/TC007-AndroidDeviceNormalPattern.json")
      Given def requestWithIosDevice = call read("common/android-delete.feature")
      * def actualResponse = requestWithIosDevice.response
      Then match actualResponse == refResponse

    @tc009
    Scenario:  TC006-AndroidDevicewithdeleteErrorPattern
      * def refStatus = 404
      * def rakuten_oauth_api = "rakutentravel_myapi"
      * def akey = "aLknnlK"
      * def apiClientId = "travel_android"
      * def easyId = "aaa"
      * def method = "delete"
      * def refResponse = read("response/scenario/TC008-AndroidDeviceErrorPattern.html")
      Given def requestWithIosDevice = call read("common/android-delete.feature")
      * def actualResponse = requestWithIosDevice.response
      Then match actualResponse contains "Content-Type"
      Then match actualResponse contains "text/html; charset=UTF-8"
      Then match actualResponse contains "楽天トラベル : 指定されたページが見つかりません（エラー404）"