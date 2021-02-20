Feature: Loyalty Profile customer land on loyalty landing catalogue

  Scenario Outline: Customer land on loyalty landing catalogue for the first time
    Given customer with "<resourceOwnerId>" has loyalty profile
    When customer land on loyalty landing catalogue for the first time
    Then customer see welcome points mobile pop-up with "<welcomePoint>"
    Examples:
      | resourceOwnerId                | welcomePoint |
      | 001400000000000022345678989011 | 1000         |
      | 001400000000000022345678989022 | 1000         |
      | 001400000000000022345678989033 | 1000         |


  Scenario Outline: Customer land on loyalty landing catalogue after the first time
    Given customer with "<resourceOwnerId>" has loyalty profile after the first time
    When customer land on loyalty landing catalogue after the first time
    Then customer do not see welcome points mobile pop-up
    Examples:
      | resourceOwnerId                |
      | 001400000000000022345678989011 |
      | 001400000000000022345678989022 |
      | 001400000000000022345678989033 |
