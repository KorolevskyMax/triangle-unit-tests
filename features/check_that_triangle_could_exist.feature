# Created by Ma at 09.03.2019
Feature: check that triangle could exist

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "check_that_triangle_could_exist" function

  Scenario Outline: Check that triangle could exist
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <msg_exception>
    And result error type should be: <exception>

     #examoles with invalid data
    Examples:
      | params   | type | exception      | msg_exception                                                        |
      | 0, 1, 2  | int  | AssertionError | triangle with sides a:0, b:1 and c:2 couldn't exist, because 0 = 0   |
      | 1, 0, 2  | int  | AssertionError | triangle with sides a:1, b:0 and c:2 couldn't exist, because 0 = 0   |
      | 1, 2, 0  | int  | AssertionError | triangle with sides a:1, b:2 and c:0 couldn't exist, because 0 = 0   |
      | -1, 2, 3 | int  | AssertionError | triangle with sides a:-1, b:2 and c:3 couldn't exist, because -1 < 0 |
      | 2, -1, 3 | int  | AssertionError | triangle with sides a:2, b:-1 and c:3 couldn't exist, because -1 < 0 |
      | 2, 3, -1 | int  | AssertionError | triangle with sides a:2, b:3 and c:-1 couldn't exist, because -1 < 0 |
