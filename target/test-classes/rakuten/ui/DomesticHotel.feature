@ui
Feature: Domestic hotel UI operation
  Background:
    * def utils = Java.type("rakuten.utils.Utils")
    * def driverUtils = Java.type("rakuten.utils.CleanUpHook")
    * def userName = credential.cpTraveler.username
    * def password = credential.cpTraveler.password
    * configure afterScenario =
    """
      function() {
        if(karate.info.errorMessage) {
          driver.screenshot();
        }
        driver.close();
      }
    """

  @book
  Scenario: Make reservation from UI
    * def targetUrl = `https://hotel.travel.rakuten.co.jp/hotelinfo/plan/${hotelId}?f_flg=PLAN&f_teikei=&f_hizuke=&f_hak=&f_dai=japan&f_chu=tokyo&f_shou=miyake&f_sai=&f_tel=&f_target_flg=&f_tscm_flg=&f_p_no=&f_custom_code=&f_search_type=&f_camp_id=&f_static=1&f_squeezes=&f_rm_equip=&f_hi1=${checkIn[2]}&f_tuki1=${checkIn[1]}&f_nen1=${checkIn[0]}&f_hi2=${checkOut[2]}&f_tuki2=${checkOut[1]}&f_nen2=${checkOut[0]}&f_heya_su=1&f_otona_su=1&f_kin2=0&f_kin=&f_s1=0&f_s2=0&f_y1=0&f_y2=0&f_y3=0&f_y4=0`
    * def clickReservePlanPage =
    """
      function(planId, roomId) {
        let targetElement = "li[id='" + planId + "-" + roomId + "']";
        try {
            driver.waitFor(targetElement);
        } catch (e) {
            karate.logger.warn("Plan and item not found on this page");
        }
        if (driver.exists(targetElement)) {
            driver.click(targetElement + " .yoyakulLink");
            return;
        }
        if (driver.exists(".plan-pagination__next-page")) {
            driver.click(".plan-pagination__next-page");
            clickReservePlanPage(planId, roomId);
        }
      }
    """
    Given driver targetUrl
    * driverUtils.collectDrivers(driver)
    * clickReservePlanPage(planId, roomId)
    Then waitFor("#user_id")

    Given input("#user_id", userName)
    When click("#cta001")
    Then waitFor("#password_current")

    Given input("#password_current", password)
    When click("#cta011")
    Then waitFor("#demoLastname1")

    Given clear("#demoLastname1")
    And input("#demoLastname1", lastName)
    And clear("#demoFirstname1")
    And input("#demoFirstname1", firstName)
    And clear("#demoPhone")
    And input("#demoPhone", phone)
    And select("#demoCheckin", checkInTime)
    And scroll("#cancel-insurance")
    And click("#cancel-insurance")
    When submit().click(".reserveButton > .TransitionButtons")
    Then waitFor(".rsv-complete__rsv-id")
    And match text(".rsv-complete__rsv-id > p:last-child") != ""
    * def reservationId = text(".rsv-complete__rsv-id > p:last-child").trim()
    * print reservationId
    And close()

  @cancel
  Scenario: Cancel reservation <reservationId> from UI
    * def targetUrl = `https://travel.rakuten.co.jp/`
    * def goToCancelPage =
    """
      function(reservationId) {
        let elements = driver.locateAll(".reservationCard_container__iYihR");
        for (let i = 0; i < elements.length; i++) {
            if (elements[i].getText().contains(reservationId)) {
                elements[i].locate("span[data-object-id='Booking_List.Reservation_Summary.Navigation.Cancel']").click();
                return;
            }
        }
      }
    """

    Given driver targetUrl
    * driverUtils.collectDrivers(driver)
    * print reservationId
    And waitFor(".rt-btn-login")
    When click(".rt-btn-login > a")
    Then waitFor("#user_id")

    When input("#user_id", userName)
    And click("#cta001")
    Then waitFor("#password_current")

    When input("#password_current", password)
    And click("#cta011")
    Then waitFor(".rt-mytrv")
    * sleep(10)

    When click(".rt-mytrv > a")
    Then waitFor(".reservationCard_container__iYihR")

    * goToCancelPage(reservationId)
    Given waitFor("input[value='一室キャンセル']")
    When click("input[value='一室キャンセル']")
    Then waitFor("#comment")
    And match text("#comment").trim() == "宿泊予約をキャンセルしました。"
    And close()