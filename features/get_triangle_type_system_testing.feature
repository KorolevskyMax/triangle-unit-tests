Feature: Validate get triangle type program [system_testing]

  Scenario: Check equilateral triangle.
    Given I have a set of parameters: [1, 1, 1]
    When I pass parameters to the program
    Then I should get result: This is a equilateral triangle.
