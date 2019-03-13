#!/usr/bin/env python
# -*- coding: utf-8 -*-
__author__ = "Max Korolevsky"

""" The program should be able to:
    Accept through arguments 3 variables, which the program must then interpret as the sides of a triangle
    and give one of the answers as a message:
        - This is a equilateral triangle.
        - This is a isosceles triangle.
        - This is a usual triangle.
        - <Type>Error: ...
"""

EXCEPTIONS = {
    "less_than_zero": "triangle with sides a:{}, b:{} and c:{} couldn't exist, because {} < 0",
    "equal_zero": "triangle with sides a:{}, b:{} and c:{} couldn't exist, because {} = 0",
    "two_sides_greater_than_third": "triangle with sides a:{}, b:{} and c:{} couldn't exist, because {} + {} <= {}",
}


def validate_number_of_arguments(sides: list) -> tuple:
    """Validating number of sides to be equal 3 and returns sides as three variables, if it's not - raises ValueError"""
    a, b, c = sides
    return a, b, c


def convert_arguments_to_floats(sides: list) -> list:
    """Converts and returns list of variables to list of floats, if couldn't - raises ValueError"""
    return [float(x) for x in sides]


def check_that_triangle_could_exist(a: float, b: float, c: float) -> int:
    """Checks that triangle sides greater than zero, if not - raises AssertionError
    :param a:
    :param b:
    :param c:
    """
    try:
        if a == 0:
            raise AssertionError(EXCEPTIONS['equal_zero'].format(a, b, c, 'a'))
        elif b == 0:
            raise AssertionError(EXCEPTIONS['equal_zero'].format(a, b, c, 'b'))
        elif c == 0:
            raise AssertionError(EXCEPTIONS['equal_zero'].format(a, b, c, 'c'))
        elif a < 0:
            raise AssertionError(EXCEPTIONS['less_than_zero'].format(a, b, c, a))
        elif b < 0:
            raise AssertionError(EXCEPTIONS['less_than_zero'].format(a, b, c, b))
        elif c < 0:
            raise AssertionError(EXCEPTIONS['less_than_zero'].format(a, b, c, c))
        elif not (a + b > c):
            raise AssertionError(EXCEPTIONS['two_sides_greater_than_third'].format(a, b, c, a, b, c))
        elif not (a + c > b):
            raise AssertionError(EXCEPTIONS['two_sides_greater_than_third'].format(a, b, c, a, c, b))
        elif not (b + c > a):
            raise AssertionError(EXCEPTIONS['two_sides_greater_than_third'].format(a, b, c, b, c, a))
        elif (a + c > b) or (a + b > c) or (b + c > a):
            return 0
    except (TypeError, ValueError) as _:
        raise ValueError("incorrect parameters type or\\and incorrect amount of variables")


def get_triangle_type(a: float, b: float, c: float) -> str:
    """Defines triangle type, returns triangle description as a string
    This is an example of docstring tests:
    >>> get_triangle_type(1, 1, 1)
    'This is a equilateral triangle.'

    >>> get_triangle_type(1, 1.5, 1)
    'This is a isosceles triangle.'

    >>> get_triangle_type(2, 3, 4)
    'This is a usual triangle.'

    >>> get_triangle_type(1, 1, 2)
    'This is not a triangle'
    """

    try:
            check_that_triangle_could_exist(a, b, c)
    except (ValueError, AssertionError) as _:
        return "This is not a triangle"
    if (a == b == c):
        return "This is a equilateral triangle."
    elif (a == b or a == c or b == c):
        return "This is a isosceles triangle."
    else:
        return "This is a usual triangle."


def validate_triangle(sides: list) -> str:
    """Validating triangle, returns exceptions if something went wrong or triangle type if triangle is valid"""
    sides = convert_arguments_to_floats(sides)
    a, b, c = validate_number_of_arguments(sides)
    return get_triangle_type(a, b, c)
