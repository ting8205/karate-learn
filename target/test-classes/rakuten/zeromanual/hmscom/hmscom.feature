@rcv3 @bmc
Feature: health test
  Background:
    * def utils = Java.type("rakuten.utils.Utils");
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy

    @viaGateway
    Scenario: via gateway
      * def refStatus = 403
      * def testUrl = "https://manage.travel.rakuten.co.jp/hmscom/chk/health.do"
      * def refResponse = read("response/scenario/viagateway.html")
      Given def Requestwithviagateway = call read("common/viagateway.feature")
      * def actualResponse = Requestwithviagateway.response
      And match actualResponse contains ("楽天トラベル : 指定されたページはアクセスが制限されています（エラー403）")
      And match actualResponse contains ("Content-Type")
      And match actualResponse contains ("text/html")

    @viaHostnameDirect
    Scenario: via hostname direct
      * def refStatus = 200
      * def testUrl = "http://stg-wtrhmscom101z.stg.jp.local/hmscom/chk/health.do"
      * def refResponse = read("response/scenario/health (via hostname direct).json")
      Given def Requestwithviagateway = call read("common/viahostnamedirect.feature")
      * def actualResponse = Requestwithviagateway.response
      And match actualResponse == refResponse
      And match karate.header.Content-Type == "application/json;charset=UTF-8"
     #And match actualResponse contains ("application/json;charset=UTF-8")




