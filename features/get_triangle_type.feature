Feature: Validate get triangle type function

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "get_triangle_type" function

  # позитивные тесты:
  Scenario Outline: Check type of triangle
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    #examples for different types of triangle
    Examples:
      | params     | result                          | type  |
      | 2, 2, 3    | This is a isosceles triangle.   | int   |
      | 3, 2, 2    | This is a isosceles triangle.   | int   |
      | 2, 3, 2    | This is a isosceles triangle.   | int   |
      | 2., 2., 3. | This is a isosceles triangle.   | float |
      | 3., 2., 2. | This is a isosceles triangle.   | float |
      | 2, 2, 2    | This is a equilateral triangle. | int   |
      | 2., 2., 2. | This is a equilateral triangle. | float |
      | 4, 3, 5    | This is a usual triangle.       | int   |
      | 4, 5, 3    | This is a usual triangle.       | int   |
      | 3, 4, 5    | This is a usual triangle.       | int   |
      | 3, 5, 4    | This is a usual triangle.       | int   |
      | 5, 4, 3    | This is a usual triangle.       | int   |
      | 5, 3, 4    | This is a usual triangle.       | int   |
      | 4., 3., 5. | This is a usual triangle.       | float |
      | 4., 5., 3. | This is a usual triangle.       | float |
      | 3., 4., 5. | This is a usual triangle.       | float |
      | 3., 5., 4. | This is a usual triangle.       | float |
      | 5., 4., 3. | This is a usual triangle.       | float |
      | 5., 3., 4. | This is a usual triangle.       | float |
      | 1, 2, 3    | This is not a triangle          | int   |
      | 1, 3, 2    | This is not a triangle          | int   |
      | 2, 1, 3    | This is not a triangle          | int   |
      | 2, 3, 1    | This is not a triangle          | int   |
      | 3, 1, 2    | This is not a triangle          | int   |
      | 3, 2, 1    | This is not a triangle          | int   |
      | 1., 2., 3. | This is not a triangle          | float |
      | 1., 3., 2. | This is not a triangle          | float |
      | 2., 1., 3. | This is not a triangle          | float |
      | 2., 3., 1. | This is not a triangle          | float |
      | 3., 1., 2. | This is not a triangle          | float |
      | 3., 2., 1. | This is not a triangle          | float |
      | 2, 1, 1    | This is not a triangle          | int   |
      | 1, 2, 1    | This is not a triangle          | int   |
      | 1, 1, 2    | This is not a triangle          | int   |
      | 2., 1., 1. | This is not a triangle          | float |
      | 1., 2., 1. | This is not a triangle          | float |
      | 1., 1., 2. | This is not a triangle          | float |
      | 1, 1, 3    | This is not a triangle          | int   |
      | 1, 3, 1    | This is not a triangle          | int   |
      | 3, 1, 1    | This is not a triangle          | int   |
      | 1., 1., 3. | This is not a triangle          | float |
      | 1., 3., 1. | This is not a triangle          | float |
      | 3., 1., 1. | This is not a triangle          | float |

