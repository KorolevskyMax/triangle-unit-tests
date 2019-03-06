Feature: Validate get triangle type function

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "get_triangle_type" function

  # позитивные тесты:
  Scenario Outline: <Название вашего сценария здесь>
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    When I pass parameters to the function
    Then I should get result: <result>
    And type of each result variable: float

    Examples:
      | params | result | type |
      |        |        |      |