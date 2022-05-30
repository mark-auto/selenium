@regression

Feature: Create

Background: Log into the database
  Given I am on the database page
    And I go to add a new computer


Scenario: Create a valid record using the minimum requirements
  Given I add a computer with details:
    | Computer name |
    | BB Computers  |
   Then I expect to see the computer succesfully added to the table


Scenario: Create a valid record using all fields
  Given I add a computer with details:
    | Computer name | Introduced date | Discontinued date | Company    |
    | CC Computers  | 2019-01-01      | 2019-01-02        | Apple Inc. |
   Then I expect to see the computer succesfully added to the table


Scenario: Create an invalid record
  Given I add a computer with details:
    | Introduced date | Discontinued date |
    | 1990-Jan-01     | 1990/01/01        |
   Then I expect to see a validation error for 'Computer name'
    And I expect to see a validation error for 'Introduced date'
    And I expect to see a validation error for 'Discontinued date'
