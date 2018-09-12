Feature: This feature contains scenarios that have to do with verifying the navigation works as expected

  Scenario: Return to homepage
    Given I am on the "home" page
    And I select the "dresses" link
    When I select the logo image
    Then I am on the "home" page
