from typing import List


def part_1(raw_input: List[str]) -> int:
    total = 0

    for line in raw_input:
        length, width, height = list(map(lambda x: int(x), line.split("x")))

        s1 = length * width
        s2 = width * height
        s3 = height * length

        total = total + s1 * 2 + s2 * 2 + s3 * 2 + min(s1, s2, s3)

    return total


def part_2(raw_input: List[str]) -> int:
    total = 0

    for line in raw_input:
        length, width, height = list(map(lambda x: int(x), line.split("x")))

        volume = length * width * height
        s1 = 2 * (length + width)
        s2 = 2 * (width + height)
        s3 = 2 * (height + length)

        total = total + volume + min(s1, s2, s3)

    return total
