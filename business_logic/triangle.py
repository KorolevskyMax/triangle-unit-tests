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


def validate_number_of_arguments(sides):
    """Validating number of sides to be equal 3 and returns sides as three variables, if it's not - raises ValueError"""
    a, b, c = sides
    return a, b, c


def convert_arguments_to_floats(sides):
    """Converts and returns list of variables to list of floats, if couldn't - raises ValueError"""
    return [float(x) for x in sides]


def check_that_triangle_could_exist(a, b, c):
    """Checks that triangle sides greater than zero, if not - raises AssertionError"""
    if a == 0:
        raise AssertionError(EXCEPTIONS['equal_zero'].format(a, b, c, a))
    elif b == 0:
        raise AssertionError(EXCEPTIONS['equal_zero'].format(a, b, c, b))
    elif c == 0:
        raise AssertionError(EXCEPTIONS['equal_zero'].format(a, b, c, b))  # here is a bug
    elif a < 0:
        raise AssertionError(EXCEPTIONS['equal_zero'].format(a, b, c, a))  # here is a bug
    elif b < 0:
        raise AssertionError(EXCEPTIONS['less_than_zero'].format(a, b, c, b))
    elif c < 0:
        raise AssertionError(EXCEPTIONS['less_than_zero'].format(a, b, c, c))
    elif not (a + b > c):
        raise AssertionError(EXCEPTIONS['two_sides_greater_than_third'].format(a, b, c, a, b, c))
    elif not (a + c > b):
        raise AssertionError(EXCEPTIONS['two_sides_greater_than_third'].format(a, b, c, a, c, b))
        # elif not(b + c > a):
        #     raise Exception(EXCEPTIONS['two_sides_greater_than_third'].format(a, b, c, b, c, a)) #here is a bug
        # TODO: HOMEWORK! how to organize this validation to shorten the spaghetti code? """


def get_triangle_type(a, b, c):
    """Defines triangle type, returns triangle description as a string"""
    if (a == b == c):
        return "This is a equilateral triangle."
    elif (a == b or a == c or b == c):
        return "This is a isosceles triangle."
    else:
        return "This is a usual triangle."


def validate_triangle(sides):
    """Validating triangle, returns exceptions if something whent wrong or triangle type if triangle is valid"""
    sides = convert_arguments_to_floats(sides)
    a, b, c = validate_number_of_arguments(sides)
    check_that_triangle_could_exist(a, b, c)
    return get_triangle_type(a, b, c)
