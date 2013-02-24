Feature: Start screen
  As a user I want to start the game already
  
  Scenario: All present and correct
    Given I am on the start screen
    Then I should see the start button

  Scenario: Starting the game
    Given I am on the start screen
    And I press the start button
    Then I should see the setup screen
