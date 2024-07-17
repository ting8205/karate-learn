@common @api
Feature: hplan/calendar
  Scenario: hplan/calendar
    Given url testUrl
    And path "/calendar"
    And params {f_no:"#(f_no)",f_flg:"#(f_flg)",f_hizuke:"#(f_hizuke)",f_otona_su:"#(f_otona_su)",f_heya_su:"#(f_heya_su)",f_camp_id:"#(f_camp_id)",f_syu:"#(f_syu)",render:"#(render)",f_calendar:"#(f_calendar)"}
    And method Get
    Then match responseStatus == refStatus

    # print request info
    * print karate.request.url
    * print responseStatus
    * print response
    * print refResponse