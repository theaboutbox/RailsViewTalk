Feature: Selecting an event
  Scenario:
    Given an event named "Super Event"
    And I am logged in
    When I go to choose an event
    And I select event "Super Event"
    And I update the user
    Then my event should be "Super Event"
