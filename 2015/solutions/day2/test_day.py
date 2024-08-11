from pathlib import Path

import pytest

from solutions.day2.solution import part_1, part_2


@pytest.mark.parametrize("test_input,expected", [(["2x3x4"], 58), (["1x1x10"], 43)])
def test_part_1_examples(test_input, expected):
    assert part_1(test_input) == expected, f'Should be [{expected}] from [{test_input}]'


def test_part_1():
    file_path = Path(__file__).resolve().parent / 'input.txt'
    f = open(file_path, "r")

    assert part_1(f.read().splitlines()) == 1606483


@pytest.mark.parametrize("test_input,expected", [(["2x3x4"], 34), (["1x1x10"], 14)])
def test_part_2_examples(test_input, expected):
    assert part_2(test_input) == expected, f'Should be [{expected}] from [{test_input}]'


def test_part_2():
    file_path = Path(__file__).resolve().parent / 'input.txt'
    f = open(file_path, "r")

    assert part_2(f.read().splitlines()) == 3842356
