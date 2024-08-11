import pytest

from solutions.day4.solution import part_1, part_2


@pytest.mark.parametrize("test_input,expected", [("abcdef", 609043), ("pqrstuv", 1048970)])
def test_part_1_examples(test_input, expected):
    assert part_1(test_input) == expected, f'Should be [{expected}] from [{test_input}]'


def test_part_1():
    assert part_1("ckczppom") == 117946


def test_part_2():
    assert part_2("ckczppom") == 3938038
