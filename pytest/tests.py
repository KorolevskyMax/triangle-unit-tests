# import pytest

# @pytest.mark.parametrize("x", [1,2])
# @pytest.mark.parametrize("y", [10,11])
# def test_cross_params(x, y):
#     print("x: {0}, y: {1}".format(x, y))
#     assert True

def test_run_once():
    @run_once
    def inc(n):
        return n + 1

    # это результат вызова функции inc()...
    assert inc(7) == 8
    # ...а это -- сохраненное значение
    assert inc(0) == 8


def run_once(f):
    """
    >>> @run_once
    ... def foo(n): return n + 1

    >>> foo(7)
    8

    >>> foo(0)
    8
    """

    def _f(*args, **kwargs):
        if not hasattr(_f, "_retval"):
            _f._retval = f(*args, **kwargs)
        return _f._retval

    return _f
