@rcv3 @bmc
Feature: health test
  Background:
    * def utils = Java.type("rakuten.utils.Utils");
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://history.api.travel.stg.jp.local"

  @behavior
  Scenario: via gateway
    * def refStatus = 200
    * def providerId = 31571
    * def type = "pageview"
    * def toDate = utils.getFormattedDate()
    * def fromDate = utils.getFormattedDate(toDate)
    * def refResponse = read("response/scenario/history.json")
    Given def Requestwithviagateway = call read("common/behavior.feature")
    * def actualResponse = Requestwithviagateway.response
    And match actualResponse == refResponse