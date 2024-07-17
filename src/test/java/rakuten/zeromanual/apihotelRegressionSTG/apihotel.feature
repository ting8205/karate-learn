@apihotelRegressionSTG

Feature: domestic data test
  Background:
    * def utils = Java.type("rakuten.utils.Utils")
    * configure proxy = apiProxy
    * configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'assert', 'status'] }
    * print apiProxy

    @tc001
    Scenario: domestic data

      * def domesticUrl = `http://apihotel.travel.stg.jp.local/apihotel/hoteldata.do?f_no=31571&f_petFlg=1&f_refreshFlg=0&f_onsenFlg=1`
      * def refStatus = 200
      * def refResponse = read("response/scenario/domestic.xml")
      Given def RequestDomesticData = call read("common/domesticdata.feature")
      * def actualResponse = RequestDomesticData.response
      * def containResponse = RequestDomesticData.response
      * xmlstring xml = containResponse

      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/@PrimaryLangID == "JP"
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/@Version == "0.0"
      Then match xml contains 'TimeStamp'
      Then match xml contains 'xmlns="http://www.opentravel.org/OTA/2003/05"'
      Then match xml contains 'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'
      Then match xml contains 'xsi:schemaLocation="http://www.opentravel.org/OTA/2003/05 ../xsd/OTA_HotelDescriptiveInfoRS.xsd "'

      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/Descriptions == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/Descriptions
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/HotelFeatures == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/HotelFeatures
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/Position == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/Position
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/Groups == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/Groups
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/Services == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/Services
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/Privileges == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/Privileges
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/MealPlaces == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/MealPlaces
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/Cards == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/Cards
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/AttentionDatas == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/HotelInfo/AttentionDatas
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/FacilityInfo == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/FacilityInfo
      #Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/Policies == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/Policies
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/AreaInfo == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/AreaInfo
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/MultimediaDescriptions == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/MultimediaDescriptions
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/ContactInfos == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/ContactInfos
      #Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/Promotions == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/Promotions
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/PetInfos == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/PetInfos
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/SpaInfos == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/SpaInfos
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/SustainableCertification == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/SustainableCertification
      Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/SustainableGroupDescription == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/SustainableGroupDescription
     # Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/SustainableInfos == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/SustainableInfos

      #Then match $actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/SustainablePreviews == $refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/SustainablePreviews

  @tc002
    Scenario: getSPHotel test
    * def refStatus = 200
    * def SPHotelUrl = `http://apihotel.travel.stg.jp.local/apihotel/getSPHotelImageList?f_no=31571`
    Given def RequestDomesticData = call read("common/getSPHotelImageList.feature")
    * def actualReaponse = RequestDomesticData.response
    * def refResponse = read("response/scenario/getSPHotelImageList.json")
    Then match actualReaponse == refResponse


  @tc003
  Scenario: APP test
    * def refStatus = 200
    * def appURL = `http://apihotel.travel.stg.jp.local/apihotel/hoteldataForApp.do?applicationId=travel_ios&hotelNo=31571`
    Given def RequestDomesticData = call read("common/hotelDataForAPP.feature")
    * def actualResponse = RequestDomesticData.response
    * def refResponse = read("response/scenario/hotelDataForAPP.json")
    Then match actualResponse == refResponse


  @tc004
  Scenario: oversea data

    * def overseaUrl = `http://apihotel.travel.stg.jp.local/apihotel/hoteldata.do?f_no=96526&f_petFlg=1&f_refreshFlg=0&f_onsenFlg=1`
    * def refStatus = 200
    * def refResponse = read("response/scenario/oversea.xml")
    Given def RequestDomesticData = call read("common/overseadata.feature")
    * def actualResponse = RequestDomesticData.response
    * def outResponse = RequestDomesticData.response


   # * xmlstring xml = actualResponse

    #* def test = 'xmlns="http://www.opentravel.org/OTA/2003/05" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opentravel.org/OTA/2003/05 ../xsd/OTA_HotelDescriptiveInfoRS.xsd "'

   Then match karate.get('$actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/AreaInfo') == karate.get('$refResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/AreaInfo')
   # * print actualResponse
    #* def result = karate.get('$actualResponse/OTA_HotelDescriptiveInfoRS/HotelDescriptiveContents/HotelDescriptiveContent/FacilityInfo')
    #* print 'result is ',result



  @tc005
  Scenario: oversea test
    * def refStatus = 200
    * def overseaSPHotelUrl = `http://apihotel.travel.stg.jp.local/apihotel/getSPHotelImageList?f_no=96526`
    Given def RequestDomesticData = call read("common/overseaHotelImageList.feature")
    * def actualReaponse = RequestDomesticData.response
    * def refResponse = read("response/scenario/overseaHotelImageList.json")
    Then match actualReaponse == refResponse


  @tc006
  Scenario: overseaAPP test
    * def refStatus = 200
    * def overseaappURL = `http://apihotel.travel.stg.jp.local/apihotel/hoteldataForApp.do?applicationId=travel_ios&hotelNo=96526`
    Given def RequestDomesticData = call read("common/overseaForAPP.feature")
    * def actualResponse = RequestDomesticData.response
    * def refResponse = read("response/scenario/overseaForAPP.json")
    Then match actualResponse == refResponse