@ignore

Feature: Redeem SCB points cashback to CASA

  Scenario Outline: Successfully redeem SCB points cashback to CASA
    Given ETB SCB customer "<rmId>" with CASA "<referenceNumber>" has loyalty points "<loyaltyPoints>" AND eligibility "<ruleEligible>" according to the campaign "<ruleName>","<ruleId>" that marketer condition set up "<cashbackRate>"
    When customer make the bill payment transaction "<transactionId>","<transactionEligibile>","<transactionType>","<transactionAmount>","<transactionDate>" equal to redeem cashback "<redempLoyaltyPoints>" from CASA
    Then customer successfully make the bill payment transaction of CASA
    And  will be deducted points for cashback redemption
    And receive cashback "<redempCashback>" to "<referenceNumber>"

    Examples:
      |                          rmId|   referenceNumber|loyaltyPoints|      ruleEligible|            ruleName|    ruleId|cashbackRate| transactionId|transactionEligibile|  transactionType|transactionAmount|          transactionDate|redempLoyaltyPoints|redempCashback|
      |001400000000000022345678989011|     085-3-67085-3|         5000|                 Y|       electric bill|      5321|        0.05|1186KX18100b11|                   Y|     bill payment|             2000|2018-04-10T23:17:18+00:00|               2000|           100|
      |001400000000000022345678989022|     085-3-67085-4|         5000|                 Y|       electric bill|      5321|        0.05|1186KX18100b22|                   Y|     bill payment|             2000|2018-04-15T23:17:18+00:00|               2000|           100|
      |001400000000000022345678989033|     085-3-67085-5|         5000|                 Y|       electric bill|      5321|        0.05|1186KX18100b33|                   Y|     bill payment|             2000|2018-04-20T23:17:18+00:00|               2000|           100|

  Scenario Outline: Unsuccessfully redeem SCB points cashback to CASA due to insufficient points  
    Given ETB SCB customer "<rmId>" with CASA "<referenceNumber>" has loyalty points "<loyaltyPoints>" AND eligibility "<ruleEligible>" according to the campaign "<ruleName>","<ruleId>" that marketer condition set up "<cashbackRate>"
    When customer make the bill payment transaction "<transactionId>","<transactionEligibile>","<transactionType>","<transactionAmount>","<transactionDate>" equal to redeem cashback "<redempLoyaltyPoints>" from CASA
    Then customer see the "<redempLoyaltyPoints>" and "<loyaltyPoints>"
    And there cannot process redeem cashback due to insufficient points

    Examples:
      |                          rmId|   referenceNumber|loyaltyPoints|      ruleEligible|            ruleName|    ruleId|cashbackRate| transactionId|transactionEligibile|  transactionType|transactionAmount|          transactionDate|redempLoyaltyPoints|
      |001400000000000022345678989077|     085-3-67085-6|         5000|                 Y|       electric bill|      4321|        0.05|1186KX18100b77|                   Y|     bill payment|            10000|2018-04-12T23:17:18+00:00|              10000|
      |001400000000000022345678989088|     085-3-67085-7|         5000|                 Y|       electric bill|      4321|        0.05|1186KX18100b88|                   Y|     bill payment|            10000|2018-04-22T23:17:18+00:00|              10000|
      |001400000000000022345678989099|     085-3-67085-8|         5000|                 Y|       electric bill|      4321|        0.05|1186KX18100b99|                   Y|     bill payment|            10000|2018-04-24T23:17:18+00:00|              10000|
