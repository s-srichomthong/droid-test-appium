@ignore

Feature: Redeem SCB points cashback to credit card via EDC

  Scenario Outline: Successfully login to DroidTest application
    Given I'm a application user I login with "<email>" and password "<password>"
    When I click to login
    Then I should successfully loin to the application and see the Main page
    And  I will see welcome text of my "<name>"

    Examples:
      |             email|       password |         name      |
      |  email@email.com |      password  |      Welcome email|
      |jaylers@email.com |      password  |      Welcome jaylers|
      |  preaw@email.com |      password  |      Welcome preaw|
      |  test@email.com  |      password  |      Welcome test|