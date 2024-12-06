fn main() {
    let input = std::fs::read_to_string("./inputs/day1/input.txt").expect("file not found!");

    println!("Part 1: {}", part1(&input));
    println!("Part 2: {}", part2(&input));
}

const WORDS: [&str; 9] = [
    "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
];

fn part1(input: &String) -> i32 {
    let lines = input.lines();

    lines
        .map(|it| map_to_digits(it))
        .map(|b| match (b.first(), b.last()) {
            (Some(first), Some(last)) => {
                let concatenated = format!("{}{}", first, last);
                concatenated.parse::<i32>().unwrap()
            }
            _ => 0,
        })
        .sum()
}

fn part2(input: &String) -> i32 {
    let lines = input.lines();

    lines
        .map(|it| {
            let numbers = find_numbers(it);
            let concatenated = format!("{}{}", numbers.0, numbers.1);
            concatenated.parse::<i32>().unwrap()
        })
        .sum()
}

fn find_numbers(s: &str) -> (i32, i32) {
    let mut word_indexes = WORDS
        .iter()
        .flat_map(|it| {
            s.match_indices(it)
                .map(|a| (a.0, it.to_string()))
                .collect::<Vec<(usize, String)>>()
        })
        .collect::<Vec<_>>();

    let mut digit_indexes = (0..10)
        .flat_map(|it| {
            s.match_indices(&it.to_string())
                .map(|a| (a.0, it.to_string()))
                .collect::<Vec<(usize, String)>>()
        })
        .collect::<Vec<_>>();

    word_indexes.append(&mut digit_indexes);
    word_indexes.sort_by(|a, b| a.0.cmp(&b.0));

    let first = word_indexes.first().map(|it| map_text_to_digits(&it.1));
    let last = word_indexes.last().map(|it| map_text_to_digits(&it.1));

    match (first, last) {
        (Some(first), Some(last)) => (first, last),
        _ => (-1, -1),
    }
}

fn map_to_digits(input: &str) -> Vec<u32> {
    input
        .chars()
        .filter(|s| s.is_digit(10))
        .map(|s| s.to_digit(10).unwrap())
        .collect::<Vec<u32>>()
}

fn map_text_to_digits(input: &str) -> i32 {
    match input {
        "one" => 1,
        "two" => 2,
        "three" => 3,
        "four" => 4,
        "five" => 5,
        "six" => 6,
        "seven" => 7,
        "eight" => 8,
        "nine" => 9,
        _ => input.parse().unwrap(),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_solves_part1_example1() {
        let input =
            std::fs::read_to_string("./inputs/day1/input-teaser1.txt").expect("file not found!");

        assert_eq!(part1(&input), 142);
    }

    #[test]
    fn it_solves_part1() {
        let input = std::fs::read_to_string("./inputs/day1/input.txt").expect("file not found!");

        assert_eq!(part1(&input), 54667);
    }

    #[test]
    fn it_find_numbers() {
        let tests = vec![
            ("sevensrncljm5zmvvrtthreejjd85twonepvj", (7, 1)),
            ("1dgzljrtcndqqrqkgxseventhreessnthree", (1, 3)),
            ("s2eight6bhshvmsevensix", (2, 6)),
            ("heightwosixthzdf7gdtllhsnfive1onemfcqkqfqkj1", (8, 1)),
            ("onespnbfninetgqmtbdmr17pmjt", (1, 7)),
            ("9rlllvfbqllvhlqkhpzkrrsktnfjpbqgxr", (9, 9)),
            ("ckk9", (9, 9)),
            ("1fourthreetpmqqtzgtwofour", (1, 4)),
        ];

        tests.iter().for_each(|(input, expected)| {
            assert_eq!(find_numbers(input), *expected);
        });
    }

    #[test]
    fn it_solves_part2_example2() {
        let input =
            std::fs::read_to_string("./inputs/day1/input-teaser2.txt").expect("file not found!");

        assert_eq!(part2(&input), 281);
    }

    #[test]
    fn it_solves_part2() {
        let input = std::fs::read_to_string("./inputs/day1/input.txt").expect("file not found!");

        assert_eq!(part2(&input), 54203);
    }
}
