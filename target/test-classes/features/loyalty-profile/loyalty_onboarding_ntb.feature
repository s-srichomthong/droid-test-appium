Feature: Loyalty Profile customer land on the SCB landing page can see information on their loyalty profile

  Scenario Outline: Customer with loyalty profile land on SCB easy
    Given customer with "<resourceOwnerId>" has a loyalty profile
    When customer land on the SCB landing page
    Then customer see the information on their loyalty profile
    Examples:
      | resourceOwnerId                |
      | 001400000000000022345678989011 |
      | 001400000000000022345678989022 |
      | 001400000000000022345678989033 |

  Scenario Outline: Customer with no loyalty profile land on SCB easy
    Given customer with "<resourceOwnerId>" has no loyalty profile
    When customer land on the SCB landing page
    Then customer do not see any information on their loyalty profile
    Examples:
      | resourceOwnerId                |
      | 001400000000000012345678987655 |
