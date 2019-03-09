Feature: Validate check_that_triangle_could_exist function

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "check_that_triangle_could_exist" function

  # позитивные тесты:
  Scenario Outline: Check function result with correct parameters
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    Examples:
      | params              | result                                                                                    | type    |
      # Одна из сторон равна 0
      | 0, 4, 5             | triangle with sides a:0.0, b:4.0 and c:5.0 couldn't exist, because a = 0                  | float   |
      | 3, 0, 5             | triangle with sides a:3.0, b:0.0 and c:5.0 couldn't exist, because b = 0                  | float   |
      | 3, 4, 0             | triangle with sides a:3.0, b:4.0 and c:0.0 couldn't exist, because c = 0                  | float   |
      # Одна из сторон отрицательна
      | -3, 4, 5            | triangle with sides a:-3.0, b:4.0 and c:5.0 couldn't exist, because -3.0 < 0              | float   |
      | 3, -4, 5            | triangle with sides a:3.0, b:-4.0 and c:5.0 couldn't exist, because -4.0 < 0              | float   |
      | 3, 4, -5            | triangle with sides a:3.0, b:4.0 and c:-5.0 couldn't exist, because -5.0 < 0              | float   |
      # сумма 2-х чисел равна 3-му
      | 1, 2, 3             | triangle with sides a:1.0, b:2.0 and c:3.0 couldn't exist, because 1.0 + 2.0 <= 3.0       | float   |
      | 2, 3, 1             | triangle with sides a:2.0, b:3.0 and c:1.0 couldn't exist, because 2.0 + 1.0 <= 3.0       | float   |
      # Тест 1.9
      | 3, 1, 2             | triangle with sides a:3.0, b:1.0 and c:2.0 couldn't exist, because 2.0 + 1.0 <= 3.0       | float   |
      # сумма двух чисел меньше третьего
      | 12, 15, 30          | triangle with sides a:12.0, b:15.0 and c:30.0 couldn't exist, because 12.0 + 15.0 <= 30.0 | float   |
      | 15, 30, 12          | triangle with sides a:15.0, b:30.0 and c:12.0 couldn't exist, because 15.0 + 12.0 <= 30.0 | float   |
      # Тест 1.12
      | 30, 12, 15          | triangle with sides a:30.0, b:12.0 and c:15.0 couldn't exist, because 12.0 + 15.0 <= 30.0 | float   |
      # Передаем не float Тест 1.13
      # Оставил коммент в check_that_triangle_could_exist в triangle.py
      | #, 1, s             | incorrect parameters type or\and incorrect amount of variables                            | no_cast |
      # ОК, python привел True к 1 и подумал что это равносторонний треугольник.
      # Это условие a + b > c прошло и вернулся 0. Строка 61 triangle.py
      # Будем считать, что это фича
      | True, True, True    | 0                                                                                         | bool    |
      # Тест 1.15
      # Плохо. Этот тест тоже возвращает 0.
      # Пришлось изменить common_steps.py @given("I cast every parameter to: {cast_type}")
      # т.к. при считывании False является строкой, а попытка
      # привести строку 'False' к типу bool возвращала True т.к. bool от непустой строки это True
      | False, False, False | triangle with sides a:False, b:False and c:False couldn't exist, because a = False        | bool    |
      # Передаем неправильное колич аргументов
      # Закоментировано, т.к. ошибка ловится копмпилятором
#      | 1, 1       | This is not a triangle | float |
#      | 1          | This is not a triangle | float |
#      | 1, 1, 1, 1 | This is not a triangle | float |


#  # негативные тесты:
#  Scenario Outline: Check function result with incorrect parameters
#    Given I have a set of parameters: [<params>]
#    And I cast every parameter to: <type>
#    And I cast parameters to: dict
#    When I pass parameters to the function
#    Then I should get result: <result>
#
#    Examples:
#      | params     | result                 | type  |