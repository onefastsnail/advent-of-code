from typing import List


def part_1(raw_input: List[str]) -> int:
    total = 0

    for line in raw_input:
        l, w, h = list(map(lambda x: int(x), line.split("x")))

        s1 = l * w
        s2 = w * h
        s3 = h * l

        total = total + s1 * 2 + s2 * 2 + s3 * 2 + min(s1, s2, s3)

    return total


def part_2(raw_input: List[str]) -> int:
    total = 0

    for line in raw_input:
        l, w, h = list(map(lambda x: int(x), line.split("x")))

        volume = l * w * h
        s1 = 2 * (l + w)
        s2 = 2 * (w + h)
        s3 = 2 * (h + l)

        total = total + volume + min(s1, s2, s3)

    return total
