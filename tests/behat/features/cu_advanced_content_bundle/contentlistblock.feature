@AdvContentBundle
Feature: the Content List block
In order to create a block with a list of nodes
As a user with the proper role
I should be able to access and use the Content List Block

Scenario Outline: A user with the proper role should be able to access the form for adding a content list block
  Given  I am logged in as a user with the <role> role
  When I go to "block/add/content-list"
  Then I should see <message>

  Examples:
  | role            | message         |
  | edit_my_content | "Access denied" |
  | edit_only       | "Access denied" |
  | site_owner      | "Create Content List block" |
  | administrator   | "Create Content List block" |
  | developer       | "Create Content List block" |


Scenario: An anonymous user should not be able to access the form
  Given I go to "block/add/content-list"
  Then I should see "Access denied"

Scenario: A user with the proper role should see a number of Sort options
Given I am logged in as a user with the "site_owner" role
And am on "block/add/content-list"
When I select "_none" from "edit-field-content-list-sort-und"
When I select "Custom" from "edit-field-content-list-sort-und"
When I select "Date Created" from "edit-field-content-list-sort-und"
When I select "Date Created Reverse" from "edit-field-content-list-sort-und"
When I select "Alphabetical" from "edit-field-content-list-sort-und"

Scenario: A user with the proper role should see a number of Display options
Given I am logged in as a user with the "site_owner" role
And am on "block/add/content-list"
When I select "Teaser" from "edit-field-content-list-display-und"
When I select "Embed" from "edit-field-content-list-display-und"
When I select "Title" from "edit-field-content-list-display-und"
When I select "Sidebar" from "edit-field-content-list-display-und"

Scenario: A simple Content List block can be created
Given I am logged in as a user with the "site_owner" role
# CREATE A BASIC PAGE TO LOAD INTO THE LIST
#And I am on "node/add/page"
#And fill in "edit-title" with "Ducks"
# And I follow "Disable rich-text"
#And I fill in "Body" with "Ducks can fly and swim"
#When I uncheck "edit-menu-enabled"
#And I press "Save"
#Then I should see "Ducks"
And I go to "block/add/content-list"
And I fill in "edit-label" with "My Content List Block Label"
And I fill in "edit-title" with "My Content List Block Title"
And I fill in "edit-field-content-list-reference-und-0-target-id" with "TestBasicPage"
And I press "Add another item"
# And I wait for the ".ajax-new-content" element to appear
And I press "Save"
Then I should see "My Content List Block Title"
And I should see "This is a Basic Page"

Scenario: An EditOnly can edit but not delete a Content List Block
Given I am logged in as a user with the "edit_only" role
And am on "block/my-content-list-block-label/view"
Then I should see the link "Edit Block"
And I follow "Edit Block"
Then I should see "Edit Content List: My Content List Block Label"
And I should not see an "edit-delete" element
