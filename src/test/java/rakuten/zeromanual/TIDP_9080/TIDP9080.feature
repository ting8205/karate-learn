@TIDP_9080
Feature: TIDP-9080_Add "Meal information" in OTA_Read API
  Background:
    * def utils = Java.type("rakuten.utils.Utils");
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "https://api.travel.rakuten.com/everest/reservation-search/R-Connect/OTA_Read"
  Scenario Outline: <testcase>
    * def requestBody = read("request/OTA_Read.xml")
    * def refStatus = 200
    Given def actual = call read("common/OTA_Read.feature")
    Then match actual.response == refResponse

    Examples:
      | read("data/booking.csv") |

