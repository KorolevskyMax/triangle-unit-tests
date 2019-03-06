Feature: Check validate number of arguments function

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "validate_number_of_arguments" function

  Scenario: Retrieving 3 variables
    Given I have a set of parameters: [1, 2, 3]
    When I pass parameters to the function
    Then I should get result: ('1', '2', '3')
    And result type should be: tuple

  Scenario: Retrieving 3 variables
    Given I have a set of parameters: [1, 2, 3]
    And I cast every parameter to: int
    When I pass parameters to the function
    Then I should get result: (1, 2, 3)
    And result type should be: tuple

  Scenario Outline: Pass incorrect amount of variables
    Given I have a set of parameters: <params>
    And I cast parameters to: <type>
    When I pass parameters to the function
    Then I should get result: <error>
    And result error type should be: <error_type>

    Examples:
      | params     | type | error                                           | error_type |
      | None       | None | 'NoneType' object is not iterable               | TypeError  |
      | Empty list | list | not enough values to unpack (expected 3, got 0) | ValueError |
      | 1          | int  | 'int' object is not iterable                    | TypeError  |


  Scenario Outline: Pass incorrect amount of variables
    Given I have a set of parameters: [<params>]
    When I pass parameters to the function
    Then I should get result: <error>
    And result error type should be: ValueError

    Examples:
      | params     | error                                           |
      | a          | not enough values to unpack (expected 3, got 1) |
      | 1, 2       | not enough values to unpack (expected 3, got 2) |
      | !, @, #, $ | too many values to unpack (expected 3)          |