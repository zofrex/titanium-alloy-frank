Feature: Start screen
  As a user I want to start the game already
  
  Scenario: All present and correct
    Given I am on the start screen
    Then I should see the start button
    And I should see the quit button

  Scenario: Quit
    Given I am on the start screen
    And I press the quit button
    Then the app should quit

  Scenario: Starting the game
    Given I am on the start screen
    And I press the start button
    Then I should see the setup screen
