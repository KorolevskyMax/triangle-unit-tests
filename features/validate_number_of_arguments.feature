Feature: Check validate number of arguments function

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "validate_number_of_arguments" function

  # позитивный тест - получения трех переменных
  Scenario: Retrieving 3 variables
    # задаем начальные данные
    Given I have a set of parameters: 1 2 3
    # передаем параметры в функцию
    When I pass parameters to the function
    # сверяем результат (результат приводится перед сравнением к строке
    Then I should get result: ('1', '2', '3')

  Scenario Outline: Pass incorrect amount of variables
    # задаем начальные данные
    Given I have a set of parameters: <params>
    # передаем параметры в функцию
    When I pass parameters to the function
    # сверяем текст ошибки (результат приводится перед сравнением к строке)
    Then I should get result: <error>
    # сверяем тип ошибки
    And result error type should be: ValueError

    Examples:
      | params  | error                                           |
      | none    | not enough values to unpack (expected 3, got 0) |
      | a       | not enough values to unpack (expected 3, got 1) |
      | 1 2     | not enough values to unpack (expected 3, got 2) |
      | ! @ # $ | too many values to unpack (expected 3)          |
