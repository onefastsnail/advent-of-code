fn main() {
    let input = std::fs::read_to_string("./inputs/day2/input.txt").expect("file not found!");

    println!("Part 1 answer is: {}", part1(&input));
    println!("Part 2 answer is: {}", part2(&input));
}

fn part1(input: &str) -> i32 {
    let lines = build_reports(input);

    lines.iter().fold(
        0,
        |acc, report| {
            if is_report_safe(report) {
                acc + 1
            } else {
                acc
            }
        },
    )
}

fn part2(input: &str) -> i32 {
    let lines = build_reports(input);

    lines.iter().fold(0, |acc, report| {
        for i in 0..report.iter().len() {
            let mut c = report.clone();
            c.remove(i);

            if is_report_safe(&c) {
                return acc + 1;
            }
        }

        acc
    })
}

fn build_reports(input: &str) -> Vec<Vec<i32>> {
    let lines = input
        .lines()
        .map(|report| {
            report
                .split_whitespace()
                .filter_map(|level| level.parse::<i32>().ok())
                .collect()
        })
        .collect();

    lines
}

fn is_report_safe(report: &Vec<i32>) -> bool {
    let mut safe = true;
    let increasing_dir = report[1] > report[0];

    report.iter().zip(report.iter().skip(1)).for_each(|level| {
        let diff = level.0 - level.1;
        if increasing_dir == true && (level.0 >= level.1 || diff.abs() > 3) {
            safe = false;
        }

        if increasing_dir == false && (level.1 >= level.0 || diff > 3) {
            safe = false;
        }
    });

    safe
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_solves_part1_example1() {
        let input = std::fs::read_to_string("./inputs/day2/teaser.txt").expect("file not found!");

        assert_eq!(part1(&input), 2);
    }

    #[test]
    fn it_solves_part1() {
        let input = std::fs::read_to_string("./inputs/day2/input.txt").expect("file not found!");

        assert_eq!(part1(&input), 371);
    }

    #[test]
    fn it_solves_part2_example1() {
        let input = std::fs::read_to_string("./inputs/day2/teaser.txt").expect("file not found!");

        assert_eq!(part2(&input), 4);
    }

    #[test]
    fn it_solves_part2() {
        let input = std::fs::read_to_string("./inputs/day2/input.txt").expect("file not found!");

        assert_eq!(part2(&input), 426);
    }
}
