Feature: point management This feature is to manage the point balance of all loyalty products performed by earning and burning transaction

  Scenario Outline: Display total point balance
    Given a customer existing "<resourceOwnerId>" to D-Bank
    And his products has registered for the loyalty program
    When customer lands on my loyalty account page
    Then customer will see total active point balance
    Examples:
      | resourceOwnerId                |
      | 001400000000000022345678989011 |
      | 001400000000000022345678989022 |
      | 001400000000000022345678989033 |

  Scenario Outline: Display total products registered to loyalty program
    Given a customer existing "<resourceOwnerId>" to D-Bank
    And his products has registered for the loyalty program
    When customer lands on my loyalty account page
    Then customer will see list of loyalty product holding in loyalty program
    Examples:
      | resourceOwnerId                |
      | 001400000000000022345678989011 |
      | 001400000000000022345678989022 |
      | 001400000000000022345678989033 |

  Scenario Outline: Cannot display products registered to loyalty program due to all products are inactive
    Given a customer existing "<resourceOwnerId>" to D-Bank
    And his all products registered for the loyalty program are inactive
    When customer lands on my loyalty account page
    Then customer will see message that you do not have any SCB product eligible for loyalty program
    Examples:
      | resourceOwnerId                |
      | 001400000000000022345678989044 |
      | 001400000000000022345678989055 |
      | 001400000000000022345678989066 |


#  You do not have any SCB product eligible for loyalty programme
