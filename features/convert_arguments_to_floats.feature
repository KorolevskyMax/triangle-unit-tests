#Feature: Check converting of arguments to floats
#
#  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
#    Given I have to test "convert_arguments_to_floats" function
#
#  # позитивные тесты:
#  # преобразование одной переменной
#  # нескольких переменных
#  # переменных типов целые или с плавающей точкой
#  # с или без знаков
#  # пустого списка
#  # нулей
#  Scenario Outline: Converting string containing an integers or\and floats with\without sign value
#    # задаем начальные данные
#    Given I have a set of parameters: [<params>]
#    And I cast parameters to: <type>
#    # передаем параметры в функцию
#    When I pass parameters to the function
#    # сверяем результат (результат приводится перед сравнением к строке)
#    Then I should get result: <result>
#    And type of each result variable: float
#
#    Examples:
#      | params               | result                | type    |
#      | 10                   | [10.0]                | no_cast |
#      | 1.234                | [1.234]               | no_cast |
#      | -999                 | [-999.0]              | no_cast |
#      | +1000                | [1000.0]              | no_cast |
#      | 1, 1.5, 2, 2.0       | [1.0, 1.5, 2.0, 2.0]  | no_cast |
#      | -2, -1.5, -1.01      | [-2.0, -1.5, -1.01]   | no_cast |
#      | none                 | []                    | no_cast |
#      | -0, 0, +0            | [-0.0, 0.0, 0.0]      | no_cast |
#      | +1.2, 1.9999, 0.0001 | [1.2, 1.9999, 0.0001] | no_cast |
#      | 1e-06, 0.000001      | [1e-06, 1e-06]        | no_cast |
#      | .9, -.9              | [0.9, -0.9]           | no_cast |
#
#
#  Scenario Outline: Pass incorrect variables types
#    # задаем начальные данные
#    Given I have a set of parameters: [<params>]
#    And I cast parameters to: <type>
#    # передаем параметры в функцию
#    When I pass parameters to the function
#    # сверяем текст ошибки (результат приводится перед сравнением к строке)
#    Then I should get result: <error>
#    # сверяем тип ошибки
#    And result error type should be: <error_type>
#
#    Examples:
#      | params     | error                                                      | type  | error_type |
#      | a          | could not convert string to float: 'a'                     | str   | ValueError |
#      | +-1        | could not convert string to float: '+-1'                   | str   | ValueError |
#      | !, @, #, $ | could not convert string to float: '!'                     | str   | ValueError |
#      | one        | could not convert string to float: 'one'                   | str   | ValueError |
#      | 1+1        | could not convert string to float: '1+1'                   | str   | ValueError |
#      | word       | float() argument must be a string or a number, not 'list'  | list  | TypeError  |
#      | word       | float() argument must be a string or a number, not 'tuple' | tuple | TypeError  |
