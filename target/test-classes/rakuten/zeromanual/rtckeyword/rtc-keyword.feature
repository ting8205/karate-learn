@rcv3 @bmc
Feature: health test
  Background:
    * def utils = Java.type("rakuten.utils.Utils")
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://kw.travel.rakuten.co.jp/keyword/ApiSearch.do"

  @tc001
  Scenario: Carrier = 1
    * def refStatus = 200
    * def keyword = "tokyo"
    * def carrier = 1
    * def responseType = "large"
    Given def requestResponse = call read("common/carrier-check.feature")
    * def actualResponse = requestResponse.response
    And match actualResponse.header.status == "Success"



  @tc002
  Scenario: Carrier = 0
    * def refStatus = 200
    * def keyword = "tokyo"
    * def carrier = 0
    * def responseType = "small"
    Given def requestResponse = call read("common/carrier-check.feature")
    * def actualResponse = requestResponse.response
    And match actualResponse.header.status == "Success"


