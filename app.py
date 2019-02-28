#!/usr/bin/env python
# -*- coding: utf-8 -*-


__author__ = "Max Korolevsky"

""" The program should be able to:
    Accept through command line arguments 3 variables, which the program must then interpret as the sides of a triangle
    and give one of the answers as a message:
        - This is a equilateral triangle.
        - This is a isosceles triangle.
        - This is a triangle.
        - <Type>Error: ...
"""

if __name__ == "__main__":
    import argparse
    from business_logic.triangle import validate_triangle

    parser = argparse.ArgumentParser(
        description="Accept through command line arguments 3 variables, "
                    "which the program must then interpret as the sides of a triangle"
    )
    parser.add_argument('sides', nargs='+', help='triangle sides, should be 3 arguments, like: 1 2 2.1')
    args = parser.parse_args()
    result = ""
    try:
        result = validate_triangle(args.sides)
    except (ValueError, AssertionError) as e:
        result = f"{type(e).__name__}: {e}"
    print(result)
