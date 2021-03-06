Feature: Check converting of arguments to floats

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "convert_arguments_to_floats" function

  # позитивные тесты:
  # преобразование одной переменной
  # нескольких переменных
  # переменных типов целые или с плавающей точкой
  # с или без знаков
  # пустого списка
  # нулей
  Scenario Outline: Converting string containing an integers or\and floats with\without sign value
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    When I pass parameters to the function
    Then I should get result: <result>
    And type of each result variable: float

    Examples:
      | params               | result                | type    |
      | 10                   | [10.0]                | no_cast |
      | 1.234                | [1.234]               | no_cast |
      | -999                 | [-999.0]              | no_cast |
      | +1000                | [1000.0]              | no_cast |
      | 1, 1.5, 2, 2.0       | [1.0, 1.5, 2.0, 2.0]  | no_cast |
      | -2, -1.5, -1.01      | [-2.0, -1.5, -1.01]   | no_cast |
      | -0, 0, +0            | [-0.0, 0.0, 0.0]      | no_cast |
      | +1.2, 1.9999, 0.0001 | [1.2, 1.9999, 0.0001] | no_cast |
      | 1e-06, 0.000001      | [1e-06, 1e-06]        | no_cast |
      | .9, -.9              | [0.9, -0.9]           | no_cast |


  Scenario Outline: Pass incorrect variables types
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    When I pass parameters to the function
    Then I should get result: <error>
    And result error type should be: <error_type>

    Examples:
      | params     | error                                                      | type  | error_type |
      | a          | could not convert string to float: 'a'                     | str   | ValueError |
      | +-1        | could not convert string to float: '+-1'                   | str   | ValueError |
      | !, @, #, $ | could not convert string to float: '!'                     | str   | ValueError |
      | one        | could not convert string to float: 'one'                   | str   | ValueError |
      | 1+1        | could not convert string to float: '1+1'                   | str   | ValueError |
      | word       | float() argument must be a string or a number, not 'list'  | list  | TypeError  |
      | word       | float() argument must be a string or a number, not 'tuple' | tuple | TypeError  |
      | word       | float() argument must be a string or a number, not 'tuple' | tuple | TypeError  |


  Scenario Outline: Pass other variable types instead of list
    Given I have a set of parameters: <params>
    And I cast parameters to: <type>
    When I pass parameters to the function
    Then I should get result: <result>
    And result type should be: <result_type>
    Examples:
      | params | result                            | type  | result_type |
      | None   | 'NoneType' object is not iterable | None  | TypeError   |
      | 123    | [1.0, 2.0, 3.0]                   | str   | list        |
      | 123    | 'float' object is not iterable    | float | TypeError   |
      | 123    | 'int' object is not iterable      | int   | TypeError   |
