@rcv3 @bmc
Feature: health test
  Background:
    * def utils = Java.type("rakuten.utils.Utils")
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://provider.travel.stg.jp.local/provider//v1/providers/34cc8383-f435-48de-94c0-c48dfeb3be85"


  Scenario: puls date test
    #* def nowdate = utils.getFormattedDate()
    #* def test = ""
    #* print nowdate

    #* def plusdate = utils.getFormattedPulsDate(nowdate)
    #* print plusdate

    #* def plusdate1 = utils.getFormattedPulsDate(plusdate)
    #* print plusdate1

    Given  def test = "0000"
    * def test1 = "00:00"
    #Then match test == /^[0-9]{1}$/
    Then match test == "#regex [0]{2}[:]{0,1}[0]{2}"

    * print test
   # * print test2

  Scenario: html extract by regex
    * def text = karate.readAsString('request/test.html')
    * def Rz = karate.extract(text,'Rz.+value.+\\"([^\\"]+)', 1)
    * print "Rz=========",Rz