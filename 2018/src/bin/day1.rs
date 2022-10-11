use std::collections::HashSet;

fn main() {
    let changes = std::fs::read_to_string("./inputs/day1.txt")
        .expect("file not found!")
        .lines()
        .map(|it| it.parse::<i32>().unwrap())
        .collect::<Vec<i32>>();

    let answer = part1(&changes);
    println!("Part 1 answer is: {}", answer);

    let answer = part2(&changes);
    println!("Part 2 answer is: {}", answer);
}

fn part1(changes: &Vec<i32>) -> i32 {
    let mut frequency = 0;
    for change in changes {
        frequency += change;
    }

    frequency
}

fn part2(changes: &Vec<i32>) -> i32 {
    let mut frequency = 0;
    let mut seen = HashSet::new(); // Using a HashSet over a Vector was significantly faster
    let mut found = false;

    seen.insert(0);

    while !found {
        for change in changes {
            frequency += change;

            if seen.contains(&frequency) {
                found = true;
                break;
            }

            seen.insert(frequency);
        }
    }

    frequency
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_solves_part1_example1() {
        assert_eq!(part1(&Vec::from([1, -2, 3, 1])), 3);
    }

    #[test]
    fn it_solves_part1_example2() {
        assert_eq!(part1(&Vec::from([1, 1, -2])), 0);
    }

    #[test]
    fn it_solves_part2_example1() {
        assert_eq!(part2(&Vec::from([3, 3, 4, -2, -4])), 10);
    }

    #[test]
    fn it_solves_part2_example2() {
        assert_eq!(part2(&Vec::from([7, 7, -2, -7, -4])), 14);
    }
}
