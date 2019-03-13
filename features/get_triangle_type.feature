Feature: Validate get triangle type function

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "get_triangle_type" function

  # позитивные тесты:
  Scenario Outline: Check correct parameters for various triangles
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    Examples:
      | params                 | result                          | type  |
      | 6, 6, 7                | This is a isosceles triangle.   | int   |
      | 6, 7, 6                | This is a isosceles triangle.   | int   |
      | 7, 6, 6                | This is a isosceles triangle.   | int   |
      | 5.0, 5, 7              | This is a isosceles triangle.   | float |
      | 5, 7.0, 5              | This is a isosceles triangle.   | float |
      | 7, 5, 5.0              | This is a isosceles triangle.   | float |
      | 3, 4, 6                | This is a usual triangle.       | int   |
      | 3, 6, 4                | This is a usual triangle.       | int   |
      | 6, 4, 3                | This is a usual triangle.       | int   |
      | 3000, 4000.0, 8000.1   | This is a usual triangle.       | float |
      | 1, 1, 1                | This is a equilateral triangle. | int   |
      | 9999.0, 9999.0, 9999.0 | This is a equilateral triangle. | float |

   #негативные тесты:
  Scenario Outline: Check incorrect parameters
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    Examples:
      | params           | result                 | type  |
      | 0, 0, 0          | This is not a triangle | int   |
      | 1, 2, 3          | This is not a triangle | int   |
      | 3, 2, 1          | This is not a triangle | int   |
      | 2, 3, 1          | This is not a triangle | int   |
      | 1.0, 1.0, 7.0    | This is not a triangle | float |
      | 1.0, 7.0, 1.0    | This is not a triangle | float |
      | 7.0, 1.0, 1.0    | This is not a triangle | float |
      | 2, 2, -3         | This is not a triangle | int   |
      | 2, -3, 2         | This is not a triangle | int   |
      | -3, 2, 2         | This is not a triangle | int   |
      | 2, 5, 0          | This is not a triangle | int   |
      | 2, 0, 5          | This is not a triangle | int   |
      | 0, 2, 5          | This is not a triangle | int   |
      | -5, -5, -5       | This is not a triangle | int   |
      | -5.0, -4.0, -4.0 | This is not a triangle | float |

