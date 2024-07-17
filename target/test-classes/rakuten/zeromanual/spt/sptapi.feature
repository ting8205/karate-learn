@spt
Feature: spt api
  Background:
    * def utils = Java.type("rakuten.utils.Utils")
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://stg-atrmynotify101z.stg.jp.local"

    @scenarioRate
  Scenario Outline:  <testcase>
    * def refStatus = 200
    Given def RequestWithRightRate = call read("common/spt-rate.feature")
    * def actualResponse = RequestWithRightRate.response
    Then match RequestWithRightRate.response == refResponse

    Examples:
      | read("data/spt-rate.csv") |

    @scenarioHotelAvail
  Scenario: TC004  api/hotelAvailList/31571 Request without date
    * def hotelId = read("data/spt-hotelId.csv")[0].hotelId
    * def fromDate = ""
    * def toDate = ""
    * def refStatus = 200
    * def refResponse = read("response/scenario/TC004-RequestWithoutDate.json")
    Given def RequestWithoutDate = call read("common/spt-hotelAvailList.feature")
    * def actualResponse = RequestWithoutDate.response
    And match actualResponse.results.hotelNo == 31571
    And match actualResponse.results.inventories != null
    And match actualResponse.results.inventories == '#[_ > 0]'
    ######add date format check
    And match each actualResponse.results.inventories ==
      """
      {
        date: '#string',
        allotment: '#number',
        reservation: '#number',
        totalReservations: '#number'
      }
      """
  @scenarioHotelAvail
  Scenario: TC005  api/hotelAvailList/31571 Request with dedicated date
    * def hotelId = read("data/spt-hotelId.csv")[1].hotelId
    * def fromDate = "2024-06-27T06:15:46.251Z"
    * def toDate = "2024-06-27T06:15:46.251Z"
    * def refStatus = 200
    * def refResponse = read("response/scenario/TC005-RequestWithDedicatedDate.json")
    Given def RequestWithDedicatedDate = call read("common/spt-hotelAvailList.feature")
    * def actualResponse = RequestWithDedicatedDate.response
    And match actualResponse.results.hotelNo == 31571
    And match actualResponse.results.inventories != null
    And match actualResponse.results.inventories == '#[_ > 0]'
    ######add date format check
    And match each actualResponse.results.inventories ==
      """
      {
        date: '#string',
        allotment: '#number',
        reservation: '#number',
        totalReservations: '#number'
      }
      """
  @scenarioHotelAvail
  Scenario: TC006  api/hotelAvailList/1024 Request with invalid hotelNo
    * def hotelId = read("data/spt-hotelId.csv")[2].hotelId
    * def fromDate = ""
    * def toDate = ""
    * def refStatus = 400
    * def refResponse = read("response/scenario/TC006-RequestWithInvalidHotelNo.json")
    Given def RequestWithInvalidHotelNo = call read("common/spt-hotelAvailList.feature")
    * def actualResponse = RequestWithInvalidHotelNo.response
    Then match RequestWithInvalidHotelNo.response == refResponse

  @scenarioHotelAvail
  Scenario: TC007 hotelAvailList api//104384 Request with invalid Date
    * def hotelId = read("data/spt-hotelId.csv")[3].hotelId
    * def fromDate = "2023-09-25T00:00:00"
    * def toDate = "2022-10-25T23:59:59"
    * def refStatus = 400
    * def refResponse = read("response/scenario/TC007-RequestWithInvalidDate.json")
    Given def RequestWithInvalidDate = call read("common/spt-hotelAvailList.feature")
    * def actualResponse = RequestWithInvalidDate.response
    Then match RequestWithInvalidDate.response == refResponse

  @scenarioHotelAvail
  Scenario: TC008  api/hotelAvailList/102013 Request to test room invalid status
    * def hotelId = read("data/spt-hotelId.csv")[4].hotelId
    * def fromDate = "2024-09-25T00:00:00"
    * def toDate = "2025-01-31T23:59:59"
    * def refStatus = 400
    * def refResponse = read("response/scenario/TC008-RequestToTestRoomInvalidStatus.json")
    Given def RequestToTestRoomInvalidStatus = call read("common/spt-hotelAvailList.feature")
    * def actualResponse = RequestToTestRoomInvalidStatus.response
    Then match RequestToTestRoomInvalidStatus.response == refResponse

    @scenarioError
  Scenario:  TC009 Error
    * def refStatus = 404
    Given def Error = call read("common/spt-error.feature")
    * def actualResponse = Error.response
    And match actualResponse contains '楽天トラベル : 指定されたページが見つかりません（エラー404)'





