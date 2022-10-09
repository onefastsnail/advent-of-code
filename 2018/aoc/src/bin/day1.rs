use std::collections::HashSet;

fn main() {
    let answer = part1();
    println!("Part 1 answer is: {}", answer);

    let answer = part2();
    println!("Part 2 answer is: {}", answer);
}

fn part1() -> i32 {
    let changes = std::fs::read_to_string("./inputs/day1.txt")
        .expect("file not found!")
        .lines()
        .map(|it| it.parse::<i32>().unwrap())
        .collect::<Vec<i32>>();

    let mut frequency = 0;
    for change in &changes {
        frequency += change;
    }

    return frequency;
}

fn part2() -> i32 {
    let changes = std::fs::read_to_string("./inputs/day1.txt")
        .expect("file not found!")
        .lines()
        .map(|it| it.parse::<i32>().unwrap())
        .collect::<Vec<i32>>();

    let mut frequency = 0;
    let mut seen = HashSet::new();
    let mut found = false;

    seen.insert(0);

    while found != true {
        for change in &changes {
            frequency += change;

            if seen.contains(&frequency) {
                found = true;
                break;
            }

            seen.insert(frequency);
        }
    }

    return frequency;
}
