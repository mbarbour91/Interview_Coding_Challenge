Feature: This feature contains scenarios that involve the behavior of the shopping cart

  Background: I have a dress in the shopping cart
    Given I am on the "home" page
    And I select the "dresses" link
    When I add a "dress" to the shopping cart
    Then The "dress" will appear in the cart


  Scenario: Remove a dress from customer's cart
    Given I have a "dress" in the shopping cart
    When I remove the first item from the cart
    Then The cart will be empty

  Scenario: Check out
    Given I have a "dress" in the shopping cart
    When I choose to check out
    Then I am on the "Shopping Cart Summary" page