import hashlib


def part_1(raw_input: str) -> int:
    return find_with("00000", raw_input)


def part_2(raw_input: str) -> int:
    return find_with("000000", raw_input)


def find_with(prefix: str, raw_input: str) -> int:
    number = 1

    while True:
        result = hashlib.md5(str.encode(f'{raw_input}{number}')).hexdigest()

        if result.startswith(prefix):
            return number

        number = number + 1
