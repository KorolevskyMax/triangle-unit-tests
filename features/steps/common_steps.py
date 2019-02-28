from behave import *
from nose.tools import assert_equals

import business_logic.triangle as triangle


@given('I have to test "{function_name}" function')
def step_impl(context, function_name):
    context.function = getattr(triangle, function_name)


@given("I have a set of parameters: none")
def step_impl(context):
    context.params = []


@given("I have a set of parameters: {params}")
def step_impl(context, params):
    context.params = params.split(" ")


@when("I pass parameters to the function")
def step_impl(context):
    try:
        context.actual_result = context.function(context.params)
    except ValueError as exception:
        context.actual_result = exception


@then("I should get result: {expected_result}")
def step_impl(context, expected_result):
    assert_equals(expected_result, str(context.actual_result))


@step("result error type should be: {expected_error_type}")
def step_impl(context, expected_error_type):
    assert_equals(expected_error_type, str(type(context.actual_result).__name__))
