@rcv3 @bmc
Feature: health test
  Background:
    * def utils = Java.type("rakuten.utils.Utils")
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://provider.travel.stg.jp.local/provider//v1/providers/34cc8383-f435-48de-94c0-c48dfeb3be85"

    @provider
    Scenario: Create Provider
      * def randomHotelNumber = utils.generateRandomNumber()
      Given def createResponse = call read("common/createprovider.feature")
      Given def searchResponse = call read("common/searchprovider.feature")
      * def actualResponse = searchResponse.response
      * def hotelid = actualResponse.id
      Given def deleteResponse = call read("common/deleteprovider.feature")

    @fetchproviderv1
    Scenario: fetch1 Provider
      * def refStatus = 200
      * def refResponse = read("response/scenario1/fetchv1.json")
      Given url "http://provider.travel.stg.jp.local/provider//v1/providers/34cc8383-f435-48de-94c0-c48dfeb3be85"
      And method GET
      And match responseStatus == refStatus
      And match response == refResponse

      # print request info
      * print karate.request.url
      * print responseStatus
      * print response
      * print karate.request.headers
    @fetchproviderv2
    Scenario: fetch2 Provider
      * def refStatus = 200
      * def refResponse = read("response/scenario2/fetchv2.json")
      Given url "http://provider.travel.stg.jp.local/provider//v2/providers/34cc8383-f435-48de-94c0-c48dfeb3be85"
      And method GET
      And match responseStatus == refStatus
      And match response == refResponse

      # print request info
      * print karate.request.url
      * print responseStatus
      * print response
      * print karate.request.headers
     @searchprovider
      Scenario: Search Provider
      * def refStatus = 200
      * def refResponse = read("response/scenario3/searchproviderforget.json")
      Given url "http://provider.travel.stg.jp.local/provider//v1/providers/search/findByCategoryAndSpecificId"
      And params {category:"HOTEL",specificId:"102498"}
      And method GET
      And match responseStatus == refStatus
      And match response == refResponse

       # print request info
      * print karate.request.url
      * print responseStatus
      * print response
      * print karate.request.headers

     @RemovedistrictId
      Scenario: Remove districtId
      * def refStatus = 200
      Given url testUrl
      And request [{"op":"remove","path":"/districtId","value":"null"}]
      And header Content-Type = 'application/json'
      And header Accept = 'application/json'
      And method PATCH
      And match responseStatus == refStatus

      # print request info
      * print karate.request.url
      * print responseStatus
      * print response
      * print karate.request.headers

    @ReplacedistrictId
    Scenario: Replace districtId
      * def refStatus = 200
      Given url testUrl
      And request [{"op":"replace","path":"/districtId","value":"10873"}]
      And header Content-Type = 'application/json'
      And header Accept = 'application/json'
      And method PATCH
      And match responseStatus == refStatus

      # print request info
      * print karate.request.url
      * print responseStatus
      * print response
      * print karate.request.headers

    @Replacecurrency
    Scenario: Replace currency
      * def refStatus = 200
      Given url testUrl
      And request [{"op":"replace","path":"/currency","value":"JPY"}]
      And header Content-Type = 'application/json'
      And header Accept = 'application/json'
      And method PATCH
      And match responseStatus == refStatus

      # print request info
      * print karate.request.url
      * print responseStatus
      * print response
      * print karate.request.headers

    @Replacecompetitors
    Scenario: Replace competitors
      * def refStatus = 200
      Given url testUrl
      And request [{"op":"replace","path":"/competitors","value":["e359e794-8c6c-4fc7-b0c7-f929bd51bc88"]}]
      And header Content-Type = 'application/json'
      And header Accept = 'application/json'
      And method PATCH
      And match responseStatus == refStatus

      # print request info
      * print karate.request.url
      * print responseStatus
      * print response
      * print karate.request.headers
    @Removecompetitors
    Scenario: Remove competitors
      * def refStatus = 200
      Given url testUrl
      And request [{"op":"remove","path":"/competitors","value":["e359e794-8c6c-4fc7-b0c7-f929bd51bc88"]}]
      And header Content-Type = 'application/json'
      And header Accept = 'application/json'
      And method PATCH
      And match responseStatus == refStatus

      # print request info
      * print karate.request.url
      * print responseStatus
      * print response
      * print karate.request.headers