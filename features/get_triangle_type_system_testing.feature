Feature: Validate get triangle type function


  Scenario: Check equilateral triangle.
    Given I have a set of parameters: [1, 1, 1]
    When I pass parameters to the program
    Then I should get result: This is a equilateral triangle.