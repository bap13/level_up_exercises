Feature: The bomb has a usable interface
  In order to destroy my enemies and not myself
  As an evildoer
  I want my bomb to have controls
  
  Scenario: Interface has an activation field
    Given the bomb has not been activated
    When I visit the homepage
    Then I should see an activation field