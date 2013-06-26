Feature: Registering on our Web site
  Scenario:
    Given an event named "Super Event"
    And a non profit named "Super Non Profit"
    When I go to the user registration page
    And I fill out my profile information
    And I go to the next step
    And I fill out my home address
    And I fill out my work address
    And I go to the next step
    And I select non profit "Super Non Profit"
    And I go to the next step
    And I select event "Super Event"
    And I submit the user registration form
    Then it should create a new user
