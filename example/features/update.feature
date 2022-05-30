@regression

Feature: Update

Background: Log into the database
  Given I am on the database page

Scenario: Update an existing record with valid data
  Given I filter by computer name "ASCI Blue Pacific"
   When I open the details for "ASCI Blue Pacific"
    And I update the computer details to be:
    | Computer name | Introduced date | Discontinued date | Company |
    | DE Computers  | 2019-01-02      | 2019-01-03        | IBM     |

  Given I filter by the computer name added
   Then I expect the computer details to be updated accordingly

  # Reverting the changes..
   When I open the details for "DE Computers"
    And I update the computer details to be:
    | Computer name     | Introduced date | Discontinued date | Company |
    | ASCI Blue Pacific | 2019-01-02      | 2019-01-03        | IBM     |


Scenario: Update an existing record with invalid data
  Given I filter by computer name "ASCI Blue Pacific"
   When I open the details for "ASCI Blue Pacific"
    And I update the computer details to be:
    | Introduced date | Discontinued date |
    | 1990-Jan-01     | 1990/01/01        |

    And I expect to see a validation error for 'Introduced date'
    And I expect to see a validation error for 'Discontinued date'
