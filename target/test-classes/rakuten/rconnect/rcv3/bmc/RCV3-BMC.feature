@rcv3 @bmc
Feature: R-Connect V3 BMC Test
  Background:
    * def utils = Java.type("rakuten.utils.Utils");
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy
    * def testUrl = "http://r-connect.travel.rakuten.co.jp/rcv3/R2/"

  Scenario Outline: Traveler Book -> R-Connect GetBooking -> R-Connect SelectUnconfirmedBooking -> R-Connect GetUnconfirmedBooking -> R-Connect ConfirmUnconfirmedBooking -> Traveler Cancel
    * def checkIn = utils.getLocalDate(checkInOffset)
    * def checkOut = utils.getLocalDate(checkOutOffset)
    * def reservationRequest = call read("classpath:rakuten/ui/DomesticHotel.feature@book")
    * def reservationId = reservationRequest.reservationId
    * print reservationId

    * def requestBody = read("request/GetBookingRQ.xml")
    * def refStatus = 200
    * def bookingState = "1"
    * def refResponse = read("response/scenario1/GetBookingRS.xml")
    Given def getBooking = call read("common/GetBooking.feature")
    Then match getBooking.response == refResponse

    * def requestBody = read("request/SelectUnconfirmedBookingRQ.xml")
    * def refStatus = 200
    * def numberOfBookingData = "#? _ > 0"
    * def refResponse = read("response/scenario1/SelectUnconfirmedBookingRS.xml")
    Given def selectUnconfirmedBooking = call read("common/SelectUnconfirmedBooking.feature")
    * print refResponse
    Then match selectUnconfirmedBooking.response == refResponse
    * def actualResponse = selectUnconfirmedBooking.response
    * def sessionId = $actualResponse/Envelope/Body/SelectUnconfirmedBookingRS/sessionId

    * def requestBody = read("request/GetUnconfirmedBookingRQ.xml")
    * def refStatus = 200
    * def bookingState = "1"
    * def numberOfBookingData = "#? _ >= 0"
    * def refResponse = read("response/scenario1/GetUnconfirmedBookingRS.xml")
    Given def getUnconfirmedBooking = call read("common/GetUnconfirmedBooking.feature")
    * print refResponse
    * def actualResponse = getUnconfirmedBooking.response
    Then match $actualResponse/Envelope/Body/GetUnconfirmedBookingRS/result/status == $refResponse/Envelope/Body/GetUnconfirmedBookingRS/result/status
    And match $actualResponse/Envelope/Body/GetUnconfirmedBookingRS/hotelNo == $refResponse/Envelope/Body/GetUnconfirmedBookingRS/hotelNo
    And match $actualResponse/Envelope/Body/GetUnconfirmedBookingRS/numberOfBookingData == $refResponse/Envelope/Body/GetUnconfirmedBookingRS/numberOfBookingData
    And match $actualResponse/Envelope/Body/GetUnconfirmedBookingRS/booking contains any $refResponse/Envelope/Body/GetUnconfirmedBookingRS/booking

    * def requestBody = read("request/ConfirmUnconfirmedBookingRQ.xml")
    * def refStatus = 200
    * def refResponse = read("response/scenario1/ConfirmUnconfirmedBookingRS.xml")
    Given def confirmUnconfirmedBooking = call read("common/ConfirmUnconfirmedBooking.feature")
    Then match confirmUnconfirmedBooking.response == refResponse

    * call read("classpath:rakuten/ui/DomesticHotel.feature@cancel")

    Examples:
    | read("data/bookings.csv") |

  Scenario Outline: Traveler Book -> Traveler Cancel -> R-Connect GetBooking -> R-Connect SelectUnconfirmedBooking -> R-Connect GetUnconfirmedBooking -> R-Connect ConfirmUnconfirmedBooking
    * def checkIn = utils.getLocalDate(checkInOffset)
    * def checkOut = utils.getLocalDate(checkOutOffset)
    * def reservationRequest = call read("classpath:rakuten/ui/DomesticHotel.feature@book")
    * def reservationId = reservationRequest.reservationId
    * print reservationId

    * call read("classpath:rakuten/ui/DomesticHotel.feature@cancel")

    * def requestBody = read("request/GetBookingRQ.xml")
    * def refStatus = 200
    * def bookingState = "10"
    * def refResponse = read("response/scenario2/GetBookingRS.xml")
    Given def getBooking = call read("common/GetBooking.feature")
    Then match getBooking.response == refResponse

    * def requestBody = read("request/SelectUnconfirmedBookingRQ.xml")
    * def refStatus = 200
    * def numberOfBookingData = "#? _ > 0"
    * def refResponse = read("response/scenario2/SelectUnconfirmedBookingRS.xml")
    Given def selectUnconfirmedBooking = call read("common/SelectUnconfirmedBooking.feature")
    * print refResponse
    Then match selectUnconfirmedBooking.response == refResponse
    * def actualResponse = selectUnconfirmedBooking.response
    * def sessionId = $actualResponse/Envelope/Body/SelectUnconfirmedBookingRS/sessionId

    * def requestBody = read("request/GetUnconfirmedBookingRQ.xml")
    * def refStatus = 200
    * def bookingState = "1"
    * def numberOfBookingData = "#? _ >= 0"
    * def refResponse = read("response/scenario2/GetUnconfirmedBookingRS.xml")
    Given def getUnconfirmedBooking = call read("common/GetUnconfirmedBooking.feature")
    * print refResponse
    * def actualResponse = getUnconfirmedBooking.response
    Then match $actualResponse/Envelope/Body/GetUnconfirmedBookingRS/result/status == $refResponse/Envelope/Body/GetUnconfirmedBookingRS/result/status
    And match $actualResponse/Envelope/Body/GetUnconfirmedBookingRS/hotelNo == $refResponse/Envelope/Body/GetUnconfirmedBookingRS/hotelNo
    And match $actualResponse/Envelope/Body/GetUnconfirmedBookingRS/numberOfBookingData == $refResponse/Envelope/Body/GetUnconfirmedBookingRS/numberOfBookingData
    And match $actualResponse/Envelope/Body/GetUnconfirmedBookingRS/booking contains any $refResponse/Envelope/Body/GetUnconfirmedBookingRS/booking

    * def requestBody = read("request/ConfirmUnconfirmedBookingRQ.xml")
    * def refStatus = 200
    * def refResponse = read("response/scenario2/ConfirmUnconfirmedBookingRS.xml")
    Given def confirmUnconfirmedBooking = call read("common/ConfirmUnconfirmedBooking.feature")
    Then match confirmUnconfirmedBooking.response == refResponse

    Examples:
      | read("data/bookings.csv") |