Feature: This feature contains scenarios that involve verifying that the products on the website appear as expected

  Background: Navigate to dresses page
    Given I am on the "home" page
    And I select the "dresses" link

  Scenario: Default dress display is as expected
    Then All available "dresses" are displayed

  Scenario Outline: Filter dresses by color
    When I filter dresses by the color(s) "<color>"
    Then I see only "<color>" dresses are displayed

    Examples:
      | color |
      | blue  |
      | green |
      | beige |
      | white |
      | black |

  Scenario: Filter by multiple colors
    When I filter dresses by the color(s) "white, orange"
    Then I see only "white, orange" dresses are displayed


