Feature: Validate get triangle type function

  Background: #задаем общий контекст для тестирования, а именно - имя используемой функции
    Given I have to test "get_triangle_type" function

  # позитивные тесты:
  Scenario Outline: <Check type of triangle>
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    Examples:
      | params  | result                          | type  |

      # equilateral triangle (равносторонний треугольник)

      | 3, 3, 3 | This is a equilateral triangle. | int   |
      | 3, 3, 3 | This is a equilateral triangle. | float |

      # isosceles triangle (равнобедренный треугольник)
      | 2, 2, 3 | This is a isosceles triangle.   | int   |
      | 2, 3, 2 | This is a isosceles triangle.   | int   |
      | 3, 2, 2 | This is a isosceles triangle.   | int   |

      | 2, 2, 3 | This is a isosceles triangle.   | float |
      | 2, 3, 2 | This is a isosceles triangle.   | float |
      | 3, 2, 2 | This is a isosceles triangle.   | float |

      # usual triangle (разносторонний треугольник)
      | 4, 3, 5 | This is a usual triangle.       | int   |
      | 3, 5, 4 | This is a usual triangle.       | int   |
      | 5, 4, 3 | This is a usual triangle.       | int   |
      | 4, 5, 3 | This is a usual triangle.       | int   |
      | 3, 4, 5 | This is a usual triangle.       | int   |
      | 5, 3, 4 | This is a usual triangle.       | int   |

      | 4, 3, 5 | This is a usual triangle.       | float |
      | 3, 5, 4 | This is a usual triangle.       | float |
      | 5, 4, 3 | This is a usual triangle.       | float |
      | 4, 5, 3 | This is a usual triangle.       | float |
      | 3, 4, 5 | This is a usual triangle.       | float |
      | 5, 3, 4 | This is a usual triangle.       | float |


  Scenario Outline: <Check that this is not a triangle>
    Given I have a set of parameters: [<params>]
    And I cast every parameter to: <type>
    And I cast parameters to: dict
    When I pass parameters to the function
    Then I should get result: <result>

    # NEGATIVE TESTS

    Examples:
      | params  | result                 | type |
      # есть отрицательные значения
      | -5, 4, 3 | This is not a triangle | float  |
      | -5, -4, 3 | This is not a triangle | float  |
      | -5, -4, -3 | This is not a triangle | float  |

      # есть стороны, равные нулю
      | 0, 4, 3 | This is not a triangle | float  |
      | 0, 0, 3 | This is not a triangle | float  |
      | 0, 0, 0 | This is not a triangle | float  |

    # треугольник не может быть построен, потому что а) сумма двух сторон = третьей стороне, б) одна из сторон меньше суммы двух сторон
      | 1, 2, 3 | This is not a triangle | float  |
      | 2, 2, 5 | This is not a triangle | float  |



