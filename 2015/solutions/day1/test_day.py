import pytest

from solutions.day1.solution import part_1, part_2


@pytest.mark.parametrize("test_input,expected",
                         [("(())", 0), ("()()", 0), ("(((", 3), ("(()(()(", 3), ("))(((((", 3), (")())())", -3)])
def test_part_1_examples(test_input, expected):
    assert part_1(test_input) == expected, f'Should be [{expected}] from [{test_input}]'


def test_part_1():
    f = open("./input.txt", "r")

    assert part_1(f.read()) == 232


@pytest.mark.parametrize("test_input,expected", [(")", 1), ("()())", 5)])
def test_part_2_examples(test_input, expected):
    assert part_2(test_input) == expected, f'Should be [{expected}] from [{test_input}]'


def test_part_2():
    f = open("./input.txt", "r")

    assert part_2(f.read()) == 1783
