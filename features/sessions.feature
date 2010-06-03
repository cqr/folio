Feature: Session Management
  In order to protect my online identity
  As a security nut
  I want to prevent certain actions on the site from being accessed by random people
  
  Background:
    Given there is one user "a_username:a_password"
  
  Scenario: Logging in with an incorrect password
    Given I am at "/login"
    When I fill in "username" with "a_username"
    And I fill in "password" with "a-bad-password"
    And I press "Login"
    Then I should be on "/login"
    And I should not be logged in
    
  Scenario: Logging in with a correct password
    Given I am at "/login"
    When I fill in "username" with "a_username"
    And I fill in "password" with "a_password"
    And I press "Login"
    Then I should be on "/"
    And I should be logged in