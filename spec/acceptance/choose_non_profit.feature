Feature: Selecting a non profit
  Scenario:
    Given a non profit named "Super Non Profit"
    And I am logged in
    When I go to choose a non profit
    And I select non profit "Super Non Profit"
    Then my non profit should be "Super Non Profit"
