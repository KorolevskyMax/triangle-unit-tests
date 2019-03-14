Feature: Validate get triangle type program [system_testing]
""" The program should be able to:
    Accept through command line arguments 3 variables, which the program must then interpret as the sides of a triangle
    and give one of the answers as a message:
        - This is a equilateral triangle.
        - This is a isosceles triangle.
        - This is a triangle.
        - TypeError: ...
"""

  @go
  Scenario Outline: Checks the correct parameters of a usual triangle
    Given I have a set of parameters: [<params>]
    When I pass parameters to the program
    Then I should get result: <result>
    Examples:
      | params        | result                    |
      # a + b > c Правильный неравносторонний треугольник
      # Передача целых чисел
      | 4, 3, 5       | This is a usual triangle. |
      | 3, 5, 4       | This is a usual triangle. |
      | 5, 4, 3       | This is a usual triangle. |
      | 4, 5, 3       | This is a usual triangle. |
      | 3, 4, 5       | This is a usual triangle. |
      | 5, 3, 4       | This is a usual triangle. |
      # Передача дробных чисел
      | 4.0, 3.0, 5.0 | This is a usual triangle. |
      | 3.0, 5.0, 4.0 | This is a usual triangle. |
      | 5.0, 4.0, 3.0 | This is a usual triangle. |
      | 4.0, 5.0, 3.0 | This is a usual triangle. |
      | 3.0, 4.0, 5.0 | This is a usual triangle. |
      | 5.0, 3.0, 4.0 | This is a usual triangle. |
      | 5.5, 3.2, 4.1 | This is a usual triangle. |
      | 3.2, 4.1, 5.5 | This is a usual triangle. |
      | 4.1, 5.5, 3.2 | This is a usual triangle. |
      # Дробные и целые
      | 5., 3, 4.0    | This is a usual triangle. |
      # Добавлены пробельные символы
      | 5. , 3.0 ,   4   | This is a usual triangle. |


  Scenario Outline: Checks the correct parameters of a equilateral triangle
    Given I have a set of parameters: [<params>]
    When I pass parameters to the program
    Then I should get result: <result>
    Examples:
      | params              | result                          |
      # правильный равносторонний треугольник
      | 3, 3, 3             | This is a equilateral triangle. |
      | 3.0, 3.0, 3.0       | This is a equilateral triangle. |
      | 1e+10, 1e+10, 1e+10 | This is a equilateral triangle. |
      | 1e-10, 1e-10, 1e-10 | This is a equilateral triangle. |

  Scenario Outline: Checks the correct parameters of a isosceles triangle
    Given I have a set of parameters: [<params>]
    When I pass parameters to the program
    Then I should get result: <result>
    Examples:
      | params              | result                        |
      # правильный равнобедренный треугольник
      | 2, 2, 3             | This is a isosceles triangle. |
      | 2, 3, 2             | This is a isosceles triangle. |
      | 3, 2, 2             | This is a isosceles triangle. |
      | 2., 2., 3.          | This is a isosceles triangle. |
      | 2.0, 3.0, 2.0       | This is a isosceles triangle. |
      | 3.0, 2., 2          | This is a isosceles triangle. |
      | 3e+10, 2e+10, 2e+10 | This is a isosceles triangle. |
      | 3e-10, 2e-10, 2e-10 | This is a isosceles triangle. |

