@rcv3 @bmc
Feature: R-Connect Maintenance page → R-Connect API
  Background:
    * def utils = Java.type("rakuten.utils.Utils")
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://r-connect.travel.rakuten.co.jp/rcv3/R2/"



  @tc002
  Scenario: R-Connect Maintenance page → R-Connect API
    * def refStatus = 200
    * def requestBody = read("request/GetHotelInformationRQ.xml")
    Given def requestResponse = call read("common/existing-client.feature")

