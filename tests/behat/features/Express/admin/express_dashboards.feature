@admin @dashboard @core
Feature: The Web Express Dashboard
When I login to a Web Express website
As an authenticated user
I am redirected to my dashboard

  Scenario Outline: An authenticated user should see Who's Online, System Status, and username blocks.
    Given  I am logged in as a user with the <role> role
    Then I should be on "admin/dashboard/user"
    Then I should see "Dashboard"
    And I should see "Who's online"
    And I should see "User since:"
    And I should see "Roles:"
    And I should see "System Status"
    And I should see a ".status-message" element

    Examples:
      | role            |
      | developer       |
      | administrator   |
      | site_owner      |
      | site_editor     |
      | edit_my_content |


  @usertabs
  Scenario Outline: Authenticated users should see three tabs on their dashboard
    Given I am logged in as a user with the <role> role
    When I go to "admin/dashboard"
    Then I should see the link "User"
    And I should see the link "Authored Content"
    And I should see the link "Edited Content"

    Examples:
      | role             |
      | developer        |
      | administrator    |
      | site_owner       |
      | site_editor      |
      | edit_my_content  |
