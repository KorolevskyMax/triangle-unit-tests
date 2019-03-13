Feature: Validate get triangle type function

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "get_triangle_type" function

  # позитивные тесты:
  Scenario Outline: Check equilateral triangle.
    Given I have a set of parameters: [1, 1, 1]
    And I cast every parameter to: dict
    When I pass parameters to the function
    Then I should get result: This is a equilateral triangle.
    And type of each result variable: float
