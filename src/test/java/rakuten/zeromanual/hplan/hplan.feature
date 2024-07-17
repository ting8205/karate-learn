@hplan
Feature: hplan test
  Background:
    * def utils = Java.type("rakuten.utils.Utils")
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://hotel.travel.stg.jp.local/hplan"

  @tc001
  Scenario:  hplan/calendar
    * def refStatus = 200
    * def f_no = 101102
    * def f_flg = "PLAN"
    * def f_hizuke = "20250515"
    * def f_otona_su = 1
    * def f_heya_su = 1
    * def f_camp_id = 2496405
    * def f_syu = "few"
    * def render = "jsonp"
    * def f_calendar = "20250515"
    * def refResponse = read("response/scenario/hplan-calendar.json")
    Given def requestResponse = call read("common/hplan-calendar.feature")
    * def actualResponse = requestResponse.response
    Then match actualResponse == refResponse

  @tc002
  Scenario:  calendar/check
    * def refStatus = 200
    * def refResponse = ''
    Given def requestResponse = call read("common/calendar-check.feature")
    * def actualResponse = requestResponse.response
    Then match actualResponse == refResponse

  @tc003
  Scenario:  /monitor/check
    * def refStatus = 200
    * def refResponse = read("response/scenario/monitor-check.json")
    Given def requestResponse = call read("common/monitor-check.feature")
    * def actualResponse = requestResponse.response
    Then match actualResponse == refResponse