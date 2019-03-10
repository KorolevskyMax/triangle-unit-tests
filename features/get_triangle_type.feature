Feature: Validate get triangle type function

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "get_triangle_type" function

  # позитивные тесты:
  Scenario Outline: <Check that triangle is equilateral triangle>
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    Examples:
      | params           | result                          | type  |
      | 1, 1, 1          | This is a equilateral triangle. | int   |
      | 3, 3, 3          | This is a equilateral triangle. | int   |
      | +4, +4, +4       | This is a equilateral triangle. | int   |
      | 3, 3, 3          | This is a equilateral triangle. | float |
      | 2.9, 2.9, 2.9    | This is a equilateral triangle. | float |
      | .9, .9, .9       | This is a equilateral triangle. | float |
      | 00.9, 00.9, 00.9 | This is a equilateral triangle. | float |
      | 9999, 9999, 9999 | This is a equilateral triangle. | float |

  Scenario Outline: <Check that triangle is isosceles triangle>
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    Examples:
      | params        | result                        | type  |
      | 2, 2, 3       | This is a isosceles triangle. | int   |
      | 2, 3, 2       | This is a isosceles triangle. | int   |
      | 3, 2, 2       | This is a isosceles triangle. | int   |
      | 3, 3, 1       | This is a isosceles triangle. | float |
      | 2.5, 2.5, 4   | This is a isosceles triangle. | float |
      | 2.9, 2.9, 5.0 | This is a isosceles triangle. | float |

  Scenario Outline: <Check that triangle is usual triangle>
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    Examples:
      | params           | result                    | type  |
      | 2, 3, 4          | This is a usual triangle. | int   |
      | 4, 3, 2          | This is a usual triangle. | int   |
      | 4, 2, 3          | This is a usual triangle. | int   |
      | +4, 2, 3         | This is a usual triangle. | int   |
      | 4, +2, 3         | This is a usual triangle. | int   |
      | 4, 2, +3         | This is a usual triangle. | int   |
      | 2.0, 3.0, 4.0    | This is a usual triangle. | float |
      | 3, 3.9, 2        | This is a usual triangle. | float |
      | 0.56, 0.88, 0.44 | This is a usual triangle. | float |
      | 2.9, 3.9, 5.0    | This is a usual triangle. | float |


  Scenario Outline: <Check that figure is not triangle>
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    Examples:
      | params         | result                 | type  |
      | 2, -2, 3       | This is not a triangle | int   |
      | -2, 3, 2       | This is not a triangle | int   |
      | 3, 4, -2       | This is not a triangle | int   |
      | 5, 5, 10       | This is not a triangle | int   |
      | 5, 10, 5       | This is not a triangle | int   |
      | 10, 5, 5       | This is not a triangle | int   |
      | 5, 10, 5       | This is not a triangle | int   |
      | 5, 5, 10       | This is not a triangle | int   |
      | -2, -2, 4      | This is not a triangle | int   |
      | -2, 4, -2      | This is not a triangle | int   |
      | -4, -2, 2      | This is not a triangle | int   |
      | 5.5, 5.5, 11.0 | This is not a triangle | float |
      | 3, 3, 0        | This is not a triangle | float |
      | 0, 3, 3        | This is not a triangle | float |
      | 3, 0, 3        | This is not a triangle | float |
      | 2.5, 0, 0      | This is not a triangle | float |
      | 0.0, 0.0, 0.0  | This is not a triangle | float |
      | 1, 2, 3        | This is not a triangle | float |
      | 2, 3, 1        | This is not a triangle | float |
      | 3, 2, 1        | This is not a triangle | float |
      | 12, 15, 30     | This is not a triangle | float |


  """Scenario Outline: <Check figure with incorrect parameters>
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <msg_exception>
    And result error type should be: <exception>

    Examples:
      | params     | type | msg_exception               | exception  |
      | 15, 7,     | int  | can't be empty              | ValueError |
      | 7          | int  | can't be empty              | ValueError |
      | 15, 7, a   | int  | can't be str                | ValueError |
      | a, 7, 9    | int  | can't be str                | ValueError |
      | 15, a, 9   | int  | can't be str                | ValueError |
      | 15, 7, 1/2 | int  | can't be special characters | ValueError |
      | 15, 7, #   | int  | can't be special characters | ValueError |
      | 15, 7, %   | int  | can't be special characters | ValueError |"""
