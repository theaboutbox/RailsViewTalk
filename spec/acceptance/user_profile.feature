Feature: User Fundraising Page
  Scenario:
    Given I am a user competing in the "Super 1K" raising money for "Save the Pine Beetles"
    When I go to my fundraising page
    Then I should see my name
    And I should see my event info
    And I should see my non profit info
    And I should be able to donate
