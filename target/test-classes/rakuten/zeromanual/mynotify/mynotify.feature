@mynotify
Feature: spt api
  Background:
    * def utils = Java.type("rakuten.utils.Utils")
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://stg-atrmynotify101z.stg.jp.local"

    @iosputget
    Scenario Outline:  <testcase>
      * def refStatus = 200
      * def path = "<path>"
      Given def RequestWithIosDevice = call read("common/iosputget.feature")
      * def actualResponse = RequestWithIosDevice.response
      Then match actualResponse == refResponse

      Examples:
        | read("data/iosputget.csv") |

    @iosdelete
    Scenario Outline:  <testcase>
      * def refStatus = 200
      * def path = "<path>"
      Given def RequestWithIosDevice = call read("common/iosdelete.feature")
      * def actualResponse = RequestWithIosDevice.response
      Then match actualResponse == refResponse

      Examples:
        | read("data/iosdelete.csv") |

    @androidnormal
    Scenario Outline:  <testcase>
      * def refStatus = 200
      * def path = "<path>"
      Given def RequestWithIosDevice = call read("common/androidnormal.feature")
      * def actualResponse = RequestWithIosDevice.response
      Then match actualResponse == refResponse

      Examples:
        | read("data/androidnormal.csv") |

    @androiderror
    Scenario Outline:  <testcase>
      * def refStatus = 404
      * def path = "<path>"
      Given def RequestWithIosDevice = call read("common/androiderror.feature")
      * def actualResponse = RequestWithIosDevice.response
      Then match actualResponse contains "Content-Type"
      Then match actualResponse contains "text/html; charset=UTF-8"
      Then match actualResponse contains "楽天トラベル : 指定されたページが見つかりません（エラー404）"

      Examples:
        | read("data/androiderror.csv") |