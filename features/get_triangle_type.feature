Feature: Validate get triangle type function

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "get_triangle_type" function

  # позитивные тесты:
  Scenario Outline: Check function result with correct parameters
    Given I have 3 parameters: <a>, <b>, <c>
    And I cast every parameter to: <type>
    When I pass parameters to the function
    Then I should get result: <result>
    And type of each result variable: float

    Examples:
      | params  | result                          | type  |
      | 4, 3, 5 | This is a usual triangle.       | int   |
      | 3, 5, 4 | This is a usual triangle.       | int   |
      | 5, 4, 3 | This is a usual triangle.       | int   |
      | 4, 5, 3 | This is a usual triangle.       | int   |
      | 3, 4, 5 | This is a usual triangle.       | int   |
      | 5, 3, 4 | This is a usual triangle.       | int   |
      | 4, 3, 5 | This is a usual triangle.       | float |
      | 3, 5, 4 | This is a usual triangle.       | float |
      | 5, 4, 3 | This is a usual triangle.       | float |
      | 4, 5, 3 | This is a usual triangle.       | float |
      | 3, 4, 5 | This is a usual triangle.       | float |
      | 5, 3, 4 | This is a usual triangle.       | float |
      | 3, 3, 3 | This is a equilateral triangle. | int   |
      | 3, 3, 3 | This is a equilateral triangle. | float |
      | 2, 2, 3 | This is a isosceles triangle.   | int   |
      | 2, 3, 2 | This is a isosceles triangle.   | int   |
      | 3, 2, 2 | This is a isosceles triangle.   | int   |
      | 2, 2, 3 | This is a isosceles triangle.   | float |
      | 2, 3, 2 | This is a isosceles triangle.   | float |
      | 3, 2, 2 | This is a isosceles triangle.   | float |

# негативные тесты:
  Scenario Outline: Check function result with incorrect parameters
    Given I have 3 parameters: <a>, <b>, <c>
    And I cast every parameter to: <type>
    When I pass parameters to the function
    Then I should get result: <result>
    And type of each result variable: float

    Examples:
      | params      | result                 | type  |
      | 0, 3, 5     | This is not a triangle | float |
      | 3, 0, 5     | This is not a triangle | float |
      | 3, 5, 0     | This is not a triangle | float |
      | 3, 4, -5    | This is not a triangle | float |
      | 4, -5, 3    | This is not a triangle | float |
      | -5, 3, 4    | This is not a triangle | float |
    # сумма 2-х чисел равна 3-му
      | 1, 2, 3     | This is not a triangle | float |
      | 2, 3, 1     | This is not a triangle | float |
      | 3, 1, 2     | This is not a triangle | float |
    # сумма двух чисел меньше третьего
      | 12, 15, 30  | This is not a triangle | float |
      | 15, 30, 12  | This is not a triangle | float |
      | 30, 12, 15  | This is not a triangle | float |
      | 0, 0, 0     | This is not a triangle | float |
