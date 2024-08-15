import re
from typing import List


def part_1(raw_input: List[str]) -> int:
    total = 0
    naughty_pairs = ["ab", "cd", "pq", "xy"]

    for line in raw_input:
        if any(it in line for it in naughty_pairs):
            continue

        if not contains_enough_vowels(line):
            continue

        if not contains_one_letter_more_than_once(line):
            continue

        total += 1

    return total


def part_2(raw_input: List[str]) -> int:
    pass


def contains_enough_vowels(line: str) -> bool:
    count = sum(1 for char in line if char in "aeiou")

    return count >= 3


def contains_one_letter_more_than_once(line: str) -> bool:
    pattern = r'(.)\1'
    matches = re.findall(pattern, line)

    return len(matches) >= 1
