Feature: Setup screen
  I want to see the weather conditions, my financials
  and pick a price to sell at

  Scenario: All present and correct
    Given I am on the setup screen
#    Then I should see the weather report
    Then I should see my balance
    And I should see the price chooser
    And I should see the sell button

  Scenario: Choosing the price
    Given I am on the setup screen
    Then I should be able to change the price down to £0.00 and not further
    And I should be able to change the price up to £5 and not further

  Scenario: Loading up
    Given I am on the setup screen
    Then I should have the starting balance of £10
    And I should be able to fill 5 pitchers of lemonade and no more
    And I should be able to fill 0 pitchers of lemonade and no less

  Scenario: Sell, sell, sell!
    Given I am on the setup screen
    And I make my choices
    And I choose to sell
    Then I should be taken to the sales report
