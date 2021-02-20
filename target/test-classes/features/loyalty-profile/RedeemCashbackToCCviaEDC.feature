@ignore

Feature: Redeem SCB points cashback to credit card via EDC

  Scenario Outline: Successfully redeem SCB points cashback to credit card via EDC
    Given ETB SCB customer <rmId> with SCB M product <referenceNumber> has loyalty points <loyaltyPoints> AND eligibility <campaignEligible> according to the campaign <campaignName>,<campaignId>,<merchantId> that marketer condition set up <cashbackRate>
    When customer do the transaction <transactionId>,<transactionEligibile>,<transactionType>,<transactionAmount>,<transactionDate> equal to redeem cashback <redempLoyaltyPoints> from credit card
    Then customer successfully make the transaction
    And  will be deducted points for cashback redemption
    And receive direct to the bill of credit card <redempCashback>

    Examples:
      |                          rmId| referenceNumber|loyaltyPoints| campaignEligible |        campaignName|campaignId|cashbackRate| transactionId|merchantId|transactionEligibile|  transactionType|transactionAmount|transactionDate|redempLoyaltyPoints|redempCashback|
      |001400000000000032345678987654|      0000321321|         5000|                 Y| yarkginmomoparadise|      4321|        0.25|1186KX18100b57|      4444|      successful trx|   Food&beverages|             2000|     14-02-2021|               2000|           500|

  Scenario Outline: Unsuccessfully redeem SCB points cashback to credit card via EDC due to insufficient points  
    Given ETB SCB customer <rmId> with SCB M product <referenceNumber> has loyalty points <loyaltyPoints> AND eligibility <campaignEligible> according to the campaign <campaignName>,<campaignId>,<merchantId> that marketer condition set up <cashbackRate>
    When customer do the transaction <transactionId>,<transactionEligibile>,<transactionType>,<transactionAmount>,<transactionDate> equal to redeem cashback <redempLoyaltyPoints> from credit card
    Then customer successfully make the transaction of credit card
    And the system will be displayed response HTTP 409 and response code BU021 due to insufficient points
      |                          rmId| referenceNumber|loyaltyPoints| campaignEligible |        campaignName|campaignId|cashbackRate| transactionId|merchantId|transactionEligibile|  transactionType|transactionAmount|transactionDate|redempLoyaltyPoints|     errorCode|
      |001400000000000032345678987655|      0000321321|          200|                 Y| yarkginmomoparadise|      4321|        0.25|1186KX18100b58|      4444|      successful trx|   Food&beverages|             2000|     13-01-2021|               2000|           400|
