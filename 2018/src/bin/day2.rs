use std::collections::HashMap;

fn main() {
    let input = std::fs::read_to_string("./inputs/day2.txt").expect("file not found!");

    let answer = part1(&input);
    println!("Part 1 answer is: {}", answer);

    let answer = part2(&input);
    println!("Part 2 answer is: {}", answer.unwrap());
}

fn part1(input: &str) -> i32 {
    let lines = input
        .lines()
        .map(|it| it.split("").filter(|&i| !i.is_empty()));

    let mut twos: i32 = 0;
    let mut threes: i32 = 0;

    for characters in lines {
        let mut frequencies = HashMap::new();

        for s in characters {
            *frequencies.entry(s).or_insert(0) += 1
        }

        if frequencies.iter().any(|(_, v)| *v == 2) {
            twos += 1;
        }

        if frequencies.iter().any(|(_, v)| *v == 3) {
            threes += 1;
        }
    }

    twos * threes
}

fn part2(input: &str) -> Result<String, String> {
    let lines = input
        .lines()
        .map(|it| it.split("").collect::<Vec<&str>>())
        .collect::<Vec<Vec<&str>>>();

    let matches_needed = lines[0].len() - 1;

    let mut matches: Vec<String> = Vec::new();

    let cloned_lines = lines.clone();

    for characters in &lines {
        for other_characters in &cloned_lines {
            let matching = characters
                .iter()
                .zip(other_characters)
                .filter(|&(a, b)| **a == **b)
                .collect::<Vec<_>>();

            if matching.len() == matches_needed {
                let x = matching.iter().map(|&(_, b)| *b).collect::<_>();
                matches.push(x);
            }
        }
    }

    match matches.len() == 2 {
        true => Ok(matches[0].to_string()),
        _ => Err("Didn't find 2 matches".into()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_solves_part1_example1() {
        assert_eq!(
            part1("abcdef\nbababc\nabbcde\nabcccd\naabcdd\nabcdee\nababab"),
            12
        );
    }

    #[test]
    fn it_solves_part1() {
        let input = std::fs::read_to_string("./inputs/day2.txt").expect("file not found!");
        assert_eq!(part1(&input), 6000);
    }

    #[test]
    fn it_solves_part2_example1() {
        assert_eq!(
            part2("abcde\nfghij\nklmno\npqrst\nfguij\naxcye\nwvxyz").unwrap(),
            "fgij".to_string()
        );
    }

    #[test]
    fn it_solves_part2() {
        let input = std::fs::read_to_string("./inputs/day2.txt").expect("file not found!");
        assert_eq!(part2(&input).unwrap(), "pbykrmjmizwhxlqnasfgtycdv");
    }
}
