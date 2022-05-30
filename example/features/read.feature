@regression

Feature: Read

Background: Log into the database
  Given I am on the database page


Scenario: Table data contains only valid information
  Given I make note of the table data
   Then I expect the table content to be valid


Scenario: Table count and record count match
  Given I make note of the number of computers found
    And I make note of the number of computers in the table
   Then I expect the number of computers to match


Scenario: Filter by a valid name that returns a single result
  Given I filter by computer name "ASCI Blue Pacific"
   Then I expect a single result to be returned


Scenario: Filter by a valid name that returns a number of results
  Given I filter by computer name "Test"
   Then I expect a multiple results to be returned


Scenario: Filter by a non-existant name
  Given I filter by computer name "???"
   Then I expect no results to be found
