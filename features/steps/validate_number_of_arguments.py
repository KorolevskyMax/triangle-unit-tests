from behave import *
from nose.tools import assert_equals
from typing import Optional
from typing import Tuple

use_step_matcher("re")


@given("list of variables")
def step_impl(context):
    # для хранения переменных которые прописаны в сценарии в data table
    # в виде [ (first, second, third), (other_first, other_second, other_third), ... ]
    # данные хранятся в типе str и не конвертируются в int
    context.variables = []

    for row in context.table:
        context.variables.append((
            row['first'], row['second'], row['third']
        ))
    # print('context.variables:\n', context.variables) # use behave --no-capture


@when("I pass variables to function")
def step_impl(context):
    from business_logic import triangle
    # Результат работы triangle.validate_number_of_arguments(sides)
    # в виде [ (first, second, third), (other_first, other_second, other_third), ... ]
    context.result = []
    index = -1
    try:
        for index, next_set in enumerate(context.variables):
            context.result.append(triangle.validate_number_of_arguments(next_set))
    except ValueError as exception:
        context.result[index] = exception
    # print('context.result:\n', context.result) # use behave --no-capture


def vars_equals(_context, column: Tuple[str,str,str], number: Optional[int] = 0):
    """
    Вспогательная функция. Используется в трех шагах Then.
    Сравнивает элементы из data с context.result

    Keyword arguments:
    _context -- global context
    column -- столбец first, second или third в сценарии "Retrieving 3 variables" в data table
    number -- индекс 0, 1 или 2 для доступа к соответствующему элементу context.result (default 0)
    """
    if number not in range(3):
        raise ValueError("Number should be 0, 1 or 2")
    for index, next_item in enumerate(column):
        yield assert_equals(_context.result[index][number], next_item)


@then("1st variable equals (?P<first>.+)")
def step_impl(context, first: Optional[tuple]):
    _first = 0
    vars_equals(context, first, _first)


@step("2nd variable equals (?P<second>.+)")
def step_impl(context, second: Optional[tuple]):
    _second = 1
    vars_equals(context,second, _second)


@step("3nd variable equals (?P<third>.+)")
def step_impl(context, third: Optional[tuple]):
    _third = 2
    vars_equals(context, third, _third)

if __name__ == '__main__':
    pass