Feature: Session Management
  In order to protect my online identity
  As a security nut
  I want to prevent certain actions on the site from being accessed by random people
  
  Scenario: Logging in with an incorrect password
    Given I am at "/login"
    When I fill in "username" with "chrisrhoden"
    And I fill in "password" with "a-bad-password"
    And I press "Login"
    Then I should be on "/login"
    And I should not be logged in
    
  Scenario: Logging in with a correct password
    Given I am at "/login"
    When I fill in "username" with "chrisrhoden"
    And I fill in "password" with "mypass"
    And I press "Login"
    Then I should be on "/"
    And I should be logged in