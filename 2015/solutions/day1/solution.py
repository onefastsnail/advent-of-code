from functools import reduce


def part_1(raw_input: str) -> int:
    return reduce(lambda x, y: x - 1 if y == ")" else x + 1, list(raw_input), 0)


def part_2(raw_input: str) -> int:
    current_level = 0

    for i, it in enumerate(raw_input):
        next_level = current_level - 1 if it == ")" else current_level + 1

        if next_level == -1:
            return i + 1

        current_level = next_level

    return 0
