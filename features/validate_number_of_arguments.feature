Feature: Check validate number of arguments function

  Scenario Outline: Retrieving 3 variables
    Given list of variables
      | first | second | third |
      | 1     | 2      | 3     |
      | 2     | 3      | 1     |
      | 3     | 1      | 2     |

    When I pass variables to function
    Then 1st variable equals <first>
    And 2nd variable equals <second>
    And 3nd variable equals <third>
    Examples:
      | first | second | third |
      | 1     | 2      | 3     |
      | 2     | 3      | 1     |
      | 3     | 1      | 2     |
