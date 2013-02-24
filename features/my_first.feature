Feature: 
  As an iOS developer
  I want to have a sample feature file
  So I can see what my next step is in the wonderful world of Frank/Cucumber testing

  Scenario: Touching the button
    Given I touch hello
    Then I should see an alert

  Scenario: Clearing the alert
    Given I am viewing the alert
    And I clear it
    Then I should not see an alert
