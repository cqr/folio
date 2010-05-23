Feature: Manage Projects
  In order to get a job
  As an independent contractor
  I want to manage a listing of my previous projects on the internet for potential employers
  
  Scenario: Creating a new project
    Given I am logged in
    When I go to "/"
    And I follow "New Project"
    And I fill in the following:
      | Name        | new project                |
      | Url         | http://google.com/         |
      | Tools       | magic horse duck unicorn   |
      | Description | a short little description |
    And I press "Create"
    Then I should be on "/projects/new_project"
    
    When I go to "/"
    Then I should see "new project" within "h3"
    And I should see "a short little description" within "p"
    
    When I follow "new project"
    Then I should see "magic" within "a"
    And I should see "horse" within "a"
    And I should see "unicorn" within "a"
    
    When I follow "horse"
    Then I should be on "/tools/horse"
    And I should see "Projects using horse" within "h2"
    And I should see "new project" within "a"