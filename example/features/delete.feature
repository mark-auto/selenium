@regression

Feature: Delete

Background: Log into the database
  Given I am on the database page
    And I go to add a new computer


Scenario: Delete a record
  Given I add a computer with details:
    | Computer name | Introduced date | Discontinued date | Company    |
    | AA Computers  | 2019-01-01      | 2019-01-02        | Apple Inc. |
   Then I expect to see the computer succesfully added to the table

  Given I filter by the computer name added
   When I select to delete the computer
   Then I expect to see a confirmation of the deleted record

  Given I filter by the computer name added
   Then I expect no filter results to be returned
