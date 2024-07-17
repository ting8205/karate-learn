@invcore
Feature: Invcore Plan Test
  Background:
    * def utils = Java.type("rakuten.utils.Utils");
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://inventory.core.travel-com.stg.jp.local"

  Scenario Outline: Get Plan Info
    * def apiRequestString = read("request/PlanGetInfoApiRequestString.json")
    * def refStatus = 200
    * def refResponse = read("response/scenario1/PlanGetInfoResponse.json")
    Given def getPlanInfo = call read("common/PlanGetInfo.feature")
    Then match getPlanInfo.response == refResponse

    Examples:
    | read("data/plans.csv") |