from pathlib import Path

import pytest

from solutions.day3.solution import part_1, part_2


@pytest.mark.parametrize("test_input,expected", [(">", 2), ("^>v<", 4), ("^>v<", 4), ("^v^v^v^v^v", 2)])
def test_part_1_examples(test_input, expected):
    assert part_1(test_input) == expected, f'Should be [{expected}] from [{test_input}]'


def test_part_1():
    file_path = Path(__file__).resolve().parent / 'input.txt'
    f = open(file_path, "r")

    assert part_1(f.read()) == 2572


@pytest.mark.parametrize("test_input,expected", [("^v", 3), ("^>v<", 3), ("^v^v^v^v^v", 11)])
def test_part_2_examples(test_input, expected):
    assert part_2(test_input) == expected, f'Should be [{expected}] from [{test_input}]'


def test_part_2():
    file_path = Path(__file__).resolve().parent / 'input.txt'
    f = open(file_path, "r")

    assert part_2(f.read()) == 2631
