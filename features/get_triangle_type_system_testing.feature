Feature: Validate get triangle type program [system_testing]

  Scenario Outline: Checks the correct parameters of a usual triangle
    Given I have a set of parameters: [<params>]
    When I pass parameters to the program
    Then I should get result: <result>
    Examples:
      | params         | result                    |
      # a + b > c Правильный неравносторонний треугольник
      # Передача целых чисел
      | 4, 3, 5        | This is a usual triangle. |
      | 3, 5, 4        | This is a usual triangle. |
      | 5, 4, 3        | This is a usual triangle. |
      | 4, 5, 3        | This is a usual triangle. |
      | 3, 4, 5        | This is a usual triangle. |
      | 5, 3, 4        | This is a usual triangle. |
      # Передача дробных чисел
      | 4.0, 3.0, 5.0  | This is a usual triangle. |
      | 3.0, 5.0, 4.0  | This is a usual triangle. |
      | 5.0, 4.0, 3.0  | This is a usual triangle. |
      | 4.0, 5.0, 3.0  | This is a usual triangle. |
      | 3.0, 4.0, 5.0  | This is a usual triangle. |
      | 5.0, 3.0, 4.0  | This is a usual triangle. |
      | 5.5, 3.2, 4.1  | This is a usual triangle. |
      | 3.2, 4.1, 5.5  | This is a usual triangle. |
      | 4.1, 5.5, 3.2  | This is a usual triangle. |
      # Дробные и целые
      | 5., 3, 4.0     | This is a usual triangle. |
      # Добавлены пробельные символы
      | 5. , 3.0 ,   4 | This is a usual triangle. |


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


  Scenario Outline: Checks the incorrect parameters of a triangle
    Given I have a set of parameters: [<params>]
    When I pass parameters to the program
    Then I should get result: <result>
    Examples:
      | params              | result                                                      |
      # Одна из сторон равна 0
      | 0, 3, 5             | This is not a triangle                                      |
      | 3, 0, 5             | This is not a triangle                                      |
      | 3, 5, 0             | This is not a triangle                                      |
      # Две стороны равны 0
      | 0, 0, 5             | This is not a triangle                                      |
      | 0, 5, 0             | This is not a triangle                                      |
      | 5, 0, 0             | This is not a triangle                                      |
      # Три стороны равны 0
      | 0, 0, 0             | This is not a triangle                                      |
      # Одна из сторон отрицательна
      | 3, 4, -5            | This is not a triangle                                      |
      | 4, -5, 3            | This is not a triangle                                      |
      | -5, 3, 4            | This is not a triangle                                      |
      # Две стороны отрицательны
      | -5, -3, 4           | This is not a triangle                                      |
      | -5, 3, -4           | This is not a triangle                                      |
      | 5, -3, -4           | This is not a triangle                                      |
      # Три стороны отрицательны
      | -5, -3, -4          | This is not a triangle                                      |
      # сумма 2-х сторон равна 3-ей
      | 1, 2, 3             | This is not a triangle                                      |
      | 2, 3, 1             | This is not a triangle                                      |
      | 3, 1, 2             | This is not a triangle                                      |
      # сумма двух сторон меньше третьей
      | 12, 15, 30          | This is not a triangle                                      |
      | 15, 30, 12          | This is not a triangle                                      |
      | 30, 12, 15          | This is not a triangle                                      |
      # Передаем не float
      | #, 1, s             | ValueError: could not convert string to float: '#'          |
      | False, False, False | ValueError: could not convert string to float: 'False'      |
      # Запятая-разделитель вместо десятичной точки
      | 3,0, 5, 0           | This is not a triangle                                      |
      # Передаем неправильное колич аргументов
      | 1                   | ValueError: not enough values to unpack (expected 3, got 1) |
      | 1, 1                | ValueError: not enough values to unpack (expected 3, got 2) |
      | 1, 1, 1, 1          | ValueError: too many values to unpack (expected 3)          |
