Feature: Check converting of arguments to floats (my)

  Background:
    Given I have to test "convert_arguments_to_floats" function

  Scenario Outline: String converting with numbers to the list
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <cast_type>
    When I pass parameters to the function
    Then I should get result: <expected_result>
    Examples:
      | params            | expected_result      | cast_type |
      | 1                 | [1.0]                | float     |
      | 1                 | [1.0]                | int       |
      | 1                 | [1.0]                | str       |
      | .5                | [0.5]                | float     |
      | .5                | [0.5]                | str       |
      | +9999             | [9999.0]             | float     |
      | -9999             | [-9999.0]            | float     |
      | +9999             | [9999.0]             | int       |
      | -9999             | [-9999.0]            | int       |
      | +9999             | [9999.0]             | str       |
      | -9999             | [-9999.0]            | str       |
      | 1e-05             | [1e-05]              | float     |
      | 1e-05             | [1e-05]              | str       |
      | 1e+5              | [100000.0]           | float     |
      | 1e+5              | [100000.0]           | str       |
      | 1, 2              | [1.0, 2.0]           | float     |
      | 1, 2              | [1.0, 2.0]           | str       |
      | 1, 2, 3           | [1.0, 2.0, 3.0]      | float     |
      | 1, 2, 3           | [1.0, 2.0, 3.0]      | str       |
      | 1, 2, 3, 4        | [1.0, 2.0, 3.0, 4.0] | float     |
      | 1, 2, 3, 4        | [1.0, 2.0, 3.0, 4.0] | str       |
      | 0, +0, -0         | [0.0, 0.0, -0.0]     | float     |
      | 0, +0, -0         | [0.0, 0.0, -0.0]     | str       |
      | 0.5, -2, +3.2     | [0.5, -2.0, 3.2]     | float     |
      | 0.5, -2, +3.2     | [0.5, -2.0, 3.2]     | str       |
      | 0.00001, -0.00001 | [1e-05, -1e-05]      | float     |
      | 0.00001, -0.00001 | [1e-05, -1e-05]      | str       |
      | 00                | [0.0]                | float     |
      | 00                | [0.0]                | str       |

#  Scenario Outline: Empty collections converting to the list of floats
#    Given I have a set of parameters: <params>
#    Examples:
#      | params |


  Scenario Outline: Pass parameters with incorrect type
    Given I have a set of parameters: <params>
    And I cast parameters to: <cast_type>
    When I pass parameters to the function
    Then I should get result: <msg_exception>
    And result error type should be: <exception>
    Examples:
      | params     | cast_type | exception   | msg_exception                                    |
      | None       | None      | TypeError   | 'NoneType' object is not iterable                |
      | str        | str       | ValueError  | could not convert string to float: 's'           |
      | True       | bool      | TypeError  | 'bool' object is not iterable                     |
      | +-1        | str       | ValueError  | could not convert string to float: '+'           |
      | # $ % ^    | list      | ValueError  | could not convert string to float: '#'           |
      | # $ % ^    | str       | ValueError  | could not convert string to float: '#' |
      | str        | tuple     | ValueError   | could not convert string to float: 's'          |
      | str        | list      | ValueError   | could not convert string to float: 's'          |
#      | 0b11       | int       | ValueError  | invalid literal for int() with base 10: '0b11' |
#      | 0x13       | int       | ValueError  | invalid literal for int() with base 10: '0x13' |
#      | 0o23       | int       | ValueError  | invalid literal for int() with base 10: '0o23' |
      | Ⅻ         | str       | ValueError  | could not convert string to float: 'Ⅻ'          |
      | ⅓          | str       | ValueError  | could not convert string to float: '⅓'           |
      | ¹          | str       | ValueError  | could not convert string to float: '¹'           |


