Feature: Validate get triangle type function

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "get_triangle_type" function

  # позитивные тесты:
  Scenario Outline: Check function result with correct parameters
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    Examples:
      | params              | result                          | type  |
      # a + b > c Правильный неравносторонний треугольник
      | 4, 3, 5             | This is a usual triangle.       | int   |
      | 3, 5, 4             | This is a usual triangle.       | int   |
      | 5, 4, 3             | This is a usual triangle.       | int   |
      | 4, 5, 3             | This is a usual triangle.       | int   |
      | 3, 4, 5             | This is a usual triangle.       | int   |
      | 5, 3, 4             | This is a usual triangle.       | int   |
      | 4, 3, 5             | This is a usual triangle.       | float |
      | 3, 5, 4             | This is a usual triangle.       | float |
      | 5, 4, 3             | This is a usual triangle.       | float |
      | 4, 5, 3             | This is a usual triangle.       | float |
      | 3, 4, 5             | This is a usual triangle.       | float |
      | 5, 3, 4             | This is a usual triangle.       | float |
      # правильный равносторонний треугольник
      | 3, 3, 3             | This is a equilateral triangle. | int   |
      | 3, 3, 3             | This is a equilateral triangle. | float |
      | 1e+10, 1e+10, 1e+10 | This is a equilateral triangle. | float |
      | 1e-10, 1e-10, 1e-10 | This is a equilateral triangle. | float |
      # ОК, python привел True к 1 и подумал что это равносторонний треугольник,
      | True, True, True    | This is a equilateral triangle. | bool  |
      # правильный равнобедренный треугольник
      | 2, 2, 3             | This is a isosceles triangle.   | int   |
      | 2, 3, 2             | This is a isosceles triangle.   | int   |
      | 3, 2, 2             | This is a isosceles triangle.   | int   |
      | 2, 2, 3             | This is a isosceles triangle.   | float |
      | 2, 3, 2             | This is a isosceles triangle.   | float |
      | 3, 2, 2             | This is a isosceles triangle.   | float |
      | 3e+10, 2e+10, 2e+10 | This is a isosceles triangle.   | float |
      | 3e-10, 2e-10, 2e-10 | This is a isosceles triangle.   | float |


# негативные тесты:
  Scenario Outline: Check function result with incorrect parameters
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    Examples:
      | params              | result                 | type    |
      # Одна из сторон равна 0
      | 0, 3, 5             | This is not a triangle | float   |
      | 3, 0, 5             | This is not a triangle | float   |
      | 3, 5, 0             | This is not a triangle | float   |
      # Две стороны равны 0
      | 0, 0, 5             | This is not a triangle | float   |
      | 0, 5, 0             | This is not a triangle | float   |
      | 5, 0, 0             | This is not a triangle | float   |
      # Три стороны равны 0
      | 0, 0, 0             | This is not a triangle | float   |
      # Одна из сторон отрицательна
      | 3, 4, -5            | This is not a triangle | float   |
      | 4, -5, 3            | This is not a triangle | float   |
      | -5, 3, 4            | This is not a triangle | float   |
      # Две стороны отрицательны
      | -5, -3, 4           | This is not a triangle | float   |
      | -5, 3, -4           | This is not a triangle | float   |
      | 5, -3, -4           | This is not a triangle | float   |
      # Три стороны отрицательны
      | -5, -3, -4          | This is not a triangle | float   |
      # сумма 2-х сторон равна 3-ей
      | 1, 2, 3             | This is not a triangle | float   |
      | 2, 3, 1             | This is not a triangle | float   |
      | 3, 1, 2             | This is not a triangle | float   |
      # сумма двух сторон меньше третьей
      | 12, 15, 30          | This is not a triangle | float   |
      | 15, 30, 12          | This is not a triangle | float   |
      | 30, 12, 15          | This is not a triangle | float   |
      # Передаем не float     Тест номер 1.21
      | #, 1, s             | This is not a triangle | no_cast |
      | False, False, False | This is not a triangle | bool    |
      # Передаем неправильное колич аргументов
      # Закоментировано, т.к. ошибка ловится копмпилятором
#      | 1, 1       | This is not a triangle | float |
#      | 1          | This is not a triangle | float |
#      | 1, 1, 1, 1 | This is not a triangle | float |
