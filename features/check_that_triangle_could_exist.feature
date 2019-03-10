# Created by Aaaaa at 3/10/2019
Feature: Validate check_that_triangle_could_exists function
  # Enter feature description here
  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "check_that_triangle_could_exist" function


  Scenario Outline: <The triangle exists>
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    Examples:
      | params                 | result | type  |
      | 2, 3, 4                | 0      | int   |
      | 3, 2, 4                | 0      | int   |
      | 4, 3, 2                | 0      | int   |
      | 5, 7, +9               | 0      | int   |
      | 5, +7, 9               | 0      | int   |
      | +2, 3, 2               | 0      | int   |
      | 2.5, 3.5, 4.3          | 0      | float |
      | .5, .5, .9             | 0      | float |
      | 10, 10, 10             | 0      | float |
      | 0.0001, 0.0001, 0.0001 | 0      | float |
      | 9999, 1, 9999          | 0      | float |
      | 9999, 9999, 1          | 0      | float |
      | 9999, 9999, 1          | 0      | float |


  Scenario Outline: <The triangle does not exist>

    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <msg_exception>
    And result error type should be: <exception>

    Examples:
      | params            | type  | msg_exception                                                                       | exception      |
      | 0, 2, 3           | int   | triangle with sides a:0, b:2 and c:3 couldn't exist, because 0 = 0                  | AssertionError |
      | 2, 0, 3           | int   | triangle with sides a:2, b:0 and c:3 couldn't exist, because 0 = 0                  | AssertionError |
      | 3, 2, 0           | int   | triangle with sides a:3, b:2 and c:0 couldn't exist, because 0 = 0                  | AssertionError |
      | 3, 0, 0           | int   | triangle with sides a:3, b:0 and c:0 couldn't exist, because 0 = 0                  | AssertionError |
      | 0, 0, 0           | int   | triangle with sides a:0, b:0 and c:0 couldn't exist, because 0 = 0                  | AssertionError |
      | 0, 3, 0           | int   | triangle with sides a:0, b:3 and c:0 couldn't exist, because 0 = 0                  | AssertionError |
      | 2, -1, 4          | int   | triangle with sides a:2, b:-1 and c:4 couldn't exist, because -1 < 0                | AssertionError |
      | -2, 1, 4          | int   | triangle with sides a:-2, b:1 and c:4 couldn't exist, because -2 < 0                | AssertionError |
      | 2, 1, -4          | int   | triangle with sides a:2, b:1 and c:-4 couldn't exist, because -4 < 0                | AssertionError |
      | -1, -1, -1        | int   | triangle with sides a:-1, b:-1 and c:-1 couldn't exist, because -1 < 0              | AssertionError |
      | 10, -10, -5       | int   | triangle with sides a:10, b:-10 and c:-5 couldn't exist, because -10 < 0            | AssertionError |
      | 10.5, -10.7, -5.3 | float | triangle with sides a:10.5, b:-10.7 and c:-5.3 couldn't exist, because -10.7 < 0    | AssertionError |
      | 6, 1, 4           | int   | triangle with sides a:6, b:1 and c:4 couldn't exist, because 1 + 4 <= 6             | AssertionError |
      | 1, 4, 6           | int   | triangle with sides a:1, b:4 and c:6 couldn't exist, because 1 + 4 <= 6             | AssertionError |
      | 4, 6, 1           | int   | triangle with sides a:4, b:6 and c:1 couldn't exist, because 4 + 1 <= 6             | AssertionError |
      | 5, 5, 10          | int   | triangle with sides a:5, b:5 and c:10 couldn't exist, because 5 + 5 <= 10           | AssertionError |
      | 10, 5, 5          | int   | triangle with sides a:10, b:5 and c:5 couldn't exist, because 5 + 5 <= 10           | AssertionError |
      | 5, 10, 5          | int   | triangle with sides a:5, b:10 and c:5 couldn't exist, because 5 + 5 <= 10           | AssertionError |
      | 9999, 1, 9997     | int   | triangle with sides a:9999, b:1 and c:9997 couldn't exist, because 1 + 9997 <= 9999 | AssertionError |
      | 9997, 1, 9999     | int   | triangle with sides a:9997, b:1 and c:9999 couldn't exist, because 9997 + 1 <= 9999 | AssertionError |
      | 1, 9997, 9999     | int   | triangle with sides a:1, b:9997 and c:9999 couldn't exist, because 1 + 9997 <= 9999 | AssertionError |
      | 1, 9999, 9997     | int   | triangle with sides a:1, b:9999 and c:9997 couldn't exist, because 1 + 9997 <= 9999 | AssertionError |
      | 9999, 9997, 1     | int   | triangle with sides a:9999, b:9997 and c:1 couldn't exist, because 9997 + 1 <= 9999 | AssertionError |
      | 9997, 9999, 1     | int   | triangle with sides a:9997, b:9999 and c:1 couldn't exist, because 9997 + 1 <= 9999 | AssertionError |
    #  | 1/2, 1/2, 1/2     | str   | incorrect parameters type or\\and incorrect amount of variables                  | ValueError     |
    #  | 1, 2,      | str   | incorrect parameters type or\\and incorrect amount of variables                  | ValueError     |
    #  | 4, 5, №     | str   | incorrect parameters type or\\and incorrect amount of variables                  | ValueError     |




