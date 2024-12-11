use regex::Regex;

fn main() {
    let input = std::fs::read_to_string("./inputs/day3/input.txt").expect("file not found!");

    println!("Part 1 answer is: {}", part1(&input));
    println!("Part 2 answer is: {}", part2(&input));
}

fn part1(input: &str) -> i32 {
    sum_instructions(input)
}

fn part2(input: &str) -> i32 {
    let (start, _) = input.split_once("don't()").unwrap();
    let between_re = Regex::new(r"do\(\)(?<seq>.*?)(don't\(\)|$)").unwrap();

    let sequences = between_re
        .captures_iter(input)
        .filter_map(|caps| caps.name("seq").map(|m| m.as_str()));

    sequences.fold(sum_instructions(start), |accum, sequence| {
        accum + sum_instructions(sequence)
    })
}

fn sum_instructions(input: &str) -> i32 {
    let re = Regex::new(r"mul\((?<x>\d+),(?<y>\d+)\)").unwrap();

    re.captures_iter(input)
        .map(|caps| {
            let (_, [x, y]) = caps.extract();
            let a = x.parse::<i32>().unwrap();
            let b = y.parse::<i32>().unwrap();
            a * b
        })
        .sum()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_solves_part1_example1() {
        let input = std::fs::read_to_string("./inputs/day3/teaser.txt").expect("file not found!");

        assert_eq!(part1(&input), 161);
    }

    #[test]
    fn it_solves_part1() {
        let input = std::fs::read_to_string("./inputs/day3/input.txt").expect("file not found!");

        assert_eq!(part1(&input), 173419328);
    }

    #[test]
    fn it_solves_part2_example1() {
        let input = std::fs::read_to_string("./inputs/day3/teaser.txt").expect("file not found!");

        assert_eq!(part2(&input), 48);
    }

    #[test]
    fn it_solves_part2() {
        let input = std::fs::read_to_string("./inputs/day3/input.txt").expect("file not found!");

        assert_eq!(part2(&input), 90669332);
    }
}
