Feature: View Projects
  In order to review chrisrhoden's credentials
  As a prospective employer
  I want to navigate a list of projects chrisrhoden has worked on
  And the tools he used for each one.

  Scenario: Listing 2 projects
    Given I have 2 projects
    When I go to "/"
    Then I should see 2 projects
    
  Scenario: Listing 5 projects
    Given I have 5 projects
    When I go to "/"
    Then I should see 5 projects
      
  Scenario: Showing project titles and descriptions
    Given I have the following projects:
      | name      | description      |
      | project 1 | a little project |
      | project 8 | a bigger project |
    When I go to "/"
    Then I should see "project 1" within "h3"
    And I should see "a little project" within "p"
    And I should see "project 8" within "h3"
    And I should see "a bigger project" within "p"
