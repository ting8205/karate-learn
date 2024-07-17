@SPHelper
Feature: SPHelper api
  Background:
    * def utils = Java.type("rakuten.utils.Utils")
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://stg-atrsphelper101z.stg.jp.local"
  Scenario: SPHelper test
    * def refStatus = 200
    * def cdCountry = "AD"
    * def mailAddr = "yanni.dong@rakuten.com"
    * def sendMailFlag = "false"
    * def hideDetail = "false"
    * def refResponse = read("response/scenario/SPHelper.json")
    Given def RequestResponse = call read("common/SPHelper-common.feature")
    * def actualResponse = RequestResponse.response
    And match actualResponse == refResponse

