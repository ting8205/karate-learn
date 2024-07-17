@rcv3 @bmc
Feature: health test
  Background:
    * def utils = Java.type("rakuten.utils.Utils")
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://provider.travel.stg.jp.local/provider//v1/providers"

    @tc001
    Scenario: Create Provider
      * def randomHotelNumber = utils.generateRandomNumber()
      Given def createResponse = call read("common/create-provider.feature")
      Given def searchResponse = call read("common/search-provider-for-delete.feature")
      * def actualResponse = searchResponse.response
      * def hotelid = actualResponse.id
      * def refResponse = read("response/scenario/search-provider-for-delete.json")
      And match actualResponse == refResponse
      Given def deleteResponse = call read("common/delete-provider.feature")

    @tc002
    Scenario: fetch1 Provider v1
      * def refStatus = 200
      * def refResponse = read("response/scenario/fetch-v1.json")
      Given def actualResponse = call read("common/fetch-provider-v1.feature")
      And match actualResponse.response == refResponse

    @tc003
    Scenario: fetch2 Provider
      * def refStatus = 200
      * def refResponse = read("response/scenario/fetch-v2.json")
      Given def actualResponse = call read("common/fetch-provider-v2.feature")
      And match actualResponse.response == refResponse

     @tc004
      Scenario: Search Provider Get
      * def refStatus = 200
      * def refResponse = read("response/scenario/search-provider-for-get.json")
      Given def actuallResponse = call read("common/search-provider-get.feature")
      And match actuallResponse.response == refResponse

     @tc005
      Scenario: Remove districtId
      * def refStatus = 200
       * def requestBody = read("request/remove-districtid.json")
       Given def actualResponse = call read("common/patch-remove-replace.feature")

    @tc006
    Scenario: Replace districtId
      * def refStatus = 200
      * def requestBody = read("request/replace-districtid.json")
      Given def actualResponse = call read("common/patch-remove-replace.feature")


    @tc007
    Scenario: Replace currency
    * def refStatus = 200
    * def requestBody = read("request/replace-currency.json")
    Given def actualResponse = call read("common/patch-remove-replace.feature")

    @tc008
    Scenario: Replace competitors
      * def refStatus = 200
      * def requestBody = read("request/replace-competitors.json")
      Given def actualResponse = call read("common/patch-remove-replace.feature")

    @tc009
    Scenario: Remove competitors
    * def refStatus = 200
    * def requestBody = read("request/remove-competitors.json")
    Given def actualResponse = call read("common/patch-remove-replace.feature")