Feature: Check converting of arguments to floats

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "convert_arguments_to_floats" function

  # позитивный тесты:
  # преобразование одной переменной
  # нескольких переменных
  # переменных типов целые или с плавающей точкой
  # с или без знаков
  # пустого списка
  # нулей
  Scenario Outline: Converting string containing an integers or\and floats with\without sign value
    # задаем начальные данные
    Given I have a set of parameters: [<params>]
    # передаем параметры в функцию
    When I pass parameters to the function
    # сверяем результат (результат приводится перед сравнением к строке)
    Then I should get result: <result>
    And type of each result variable: float

    Examples:
      | params               | result                |
      | 10                   | [10.0]                |
      | 1.234                | [1.234]               |
      | -999                 | [-999.0]              |
      | +1000                | [1000.0]              |
      | 1, 1.5, 2, 2.0       | [1.0, 1.5, 2.0, 2.0]  |
      | -2, -1.5, -1.01      | [-2.0, -1.5, -1.01]   |
      | none                 | []                    |
      | -0, 0, +0            | [-0.0, 0.0, 0.0]      |
      | +1.2, 1.9999, 0.0001 | [1.2, 1.9999, 0.0001] |
      | 1e-06, 0.000001      | [1e-06, 1e-06]        |
      | .9, -.9              | [0.9, -0.9]           |


  Scenario Outline: Pass incorrect variables types
    # задаем начальные данные
    Given I have a set of parameters: [<params>]
    # передаем параметры в функцию
    When I pass parameters to the function
    # сверяем текст ошибки (результат приводится перед сравнением к строке)
    Then I should get result: <error>
    # сверяем тип ошибки
    And result error type should be: ValueError

    Examples:
      | params     | error                                    |
      | a          | could not convert string to float: 'a'   |
      | +-1        | could not convert string to float: '+-1' |
      | !, @, #, $ | could not convert string to float: '!'   |
      | one        | could not convert string to float: 'one' |
      | 1+1        | could not convert string to float: '1+1' |
