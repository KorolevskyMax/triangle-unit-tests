# Created by Vika at 10.03.2019
Feature: Check that triangle could exist
  # Enter feature description here

  Scenario Outline: <Check that triangle could exist>
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>


    Examples:
      | params   | result                            | type  |

      | 3, 3, 3  | This isosceles triangle can exist | float |
      | 2, 2, 3  | This isosceles triangle can exist | float |
      | 2, 3, 3  | This isosceles triangle can exist | float |
      | 3, 2, 2  | This isosceles triangle can exist | float |
      | 4, 3, 5  | This usual triangle can exist     | float |
      | 3, 4, 5  | This usual triangle can exist     | float |
      | 5, 4, 3  | This usual triangle can exist     | float |
      | 3, 5, 4  | This usual triangle can exist     | float |
      | 4, 5, 3  | This usual triangle can exist     | float |
      | 5, 3, 4  | This usual triangle can exist     | float |
      | 1, 1, 1  | This triangle can't exist         | float |
      | 0, 10, 5 | This triangle can't exist         | float |
      | -5, 2, 3 | This triangle can't exist         | float |
