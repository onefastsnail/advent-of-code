use std::str::Lines;

fn main() {
    let input = std::fs::read_to_string("./inputs/day1/input.txt").expect("file not found!");

    println!("Part 1 answer is: {}", part1(&input));
    println!("Part 2 answer is: {}", part2(&input));
}

fn part1(input: &str) -> i32 {
    let lines = input.lines();

    let (mut list1, mut list2) = get_lists(lines);

    list1.sort();
    list2.sort();

    list1
        .iter()
        .zip(list2.iter())
        .fold(0, |accum, (it1, it2)| accum + (it1 - it2).abs())
}

fn part2(input: &str) -> i32 {
    let lines = input.lines();

    let (list1, list2) = get_lists(lines);

    list1.iter().fold(0, |accum, it| {
        let occurrences = list2.iter().filter(|x| *x == it).count();

        accum + (occurrences as i32 * it)
    })
}

fn get_lists(lines: Lines) -> (Vec<i32>, Vec<i32>) {
    let mut list1: Vec<i32> = Vec::new();
    let mut list2: Vec<i32> = Vec::new();

    lines.for_each(|line| {
        let parts: Vec<&str> = line.split_whitespace().collect();
        if let (Some(part1), Some(part2)) = (parts.get(0), parts.get(1)) {
            if let (Ok(num1), Ok(num2)) = (part1.parse::<i32>(), part2.parse::<i32>()) {
                list1.push(num1);
                list2.push(num2);
            }
        }
    });

    (list1, list2)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_solves_part1_example1() {
        let input = std::fs::read_to_string("./inputs/day1/teaser.txt").expect("file not found!");

        assert_eq!(part1(&input), 11);
    }

    #[test]
    fn it_solves_part1() {
        let input = std::fs::read_to_string("./inputs/day1/input.txt").expect("file not found!");

        assert_eq!(part1(&input), 1889772);
    }

    #[test]
    fn it_solves_part2_example1() {
        let input = std::fs::read_to_string("./inputs/day1/teaser.txt").expect("file not found!");

        assert_eq!(part2(&input), 31);
    }

    #[test]
    fn it_solves_part2() {
        let input = std::fs::read_to_string("./inputs/day1/input.txt").expect("file not found!");

        assert_eq!(part2(&input), 23228917);
    }
}
