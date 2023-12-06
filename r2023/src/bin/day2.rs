use regex::Regex;
use std::collections::HashMap;

fn main() {
    let input = std::fs::read_to_string("./inputs/day2/input.txt").expect("file not found!");

    println!("Part 1: {}", part1(&input));
    println!("Part 2: {}", part2(&input));
}

struct Game {
    id: i32,
    sets: Vec<HashMap<String, i32>>,
}

fn part1(input: &String) -> i32 {
    let lines = input.lines().map(String::from);

    let rules = vec![("green", 13), ("red", 12), ("blue", 14)];

    return lines.fold(0, |acc, it| {
        let game = build_game(&it);

        let sets_ok = game
            .sets
            .iter()
            .filter(|&set| {
                rules.iter().all(|&rule| {
                    if let Some(result) = set.get_key_value(rule.0) {
                        !result.1.gt(&rule.1)
                    } else {
                        true
                    }
                })
            })
            .collect::<Vec<_>>();

        if sets_ok.len() == game.sets.len() {
            return acc + game.id;
        }

        acc
    });
}

fn part2(_: &String) -> usize {
    // let lines = input.lines().map(String::from);

    return 0;
}

fn build_game(input: &str) -> Game {
    let parts = input.split(": ").collect::<Vec<&str>>();

    let colors = ["red", "green", "blue"];

    let game_id_regex = Regex::new(r"(?P<game_id>\d+)").unwrap();
    let colors_regex =
        Regex::new(r"(?P<blue>\d+) blue|(?P<red>\d+) red|(?P<green>\d+) green").unwrap();

    let game_id = parts
        .first()
        .map(|&it| {
            game_id_regex
                .captures(it)
                .unwrap()
                .name("game_id")
                .unwrap()
                .as_str()
                .parse::<i32>()
                .unwrap()
        })
        .unwrap();

    let raw_sets = parts.last().unwrap().split("; ").collect::<Vec<_>>();

    let sets = raw_sets
        .iter()
        .map(|&set| {
            let mut results = HashMap::new();

            for captures in colors_regex.captures_iter(set) {
                for color in &colors {
                    if let Some(color_match) = captures.name(color) {
                        if let Ok(parsed_value) = color_match.as_str().parse::<i32>() {
                            results.insert(color.to_string(), parsed_value);
                        }
                    }
                }
            }

            return results;
        })
        .collect::<Vec<_>>();

    return Game { id: game_id, sets };
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_solves_part1_example1() {
        let input =
            std::fs::read_to_string("./inputs/day2/input-teaser1.txt").expect("file not found!");

        assert_eq!(part1(&input), 8);
    }

    #[test]
    fn it_solves_part1() {
        let input = std::fs::read_to_string("./inputs/day2/input.txt").expect("file not found!");

        assert_eq!(part1(&input), 2162);
    }

    #[test]
    fn it_solves_part2_example2() {
        let input =
            std::fs::read_to_string("./inputs/day2/input-teaser1.txt").expect("file not found!");

        assert_eq!(part2(&input), 0);
    }

    #[test]
    fn it_solves_part2() {
        let input = std::fs::read_to_string("./inputs/day2/input.txt").expect("file not found!");

        assert_eq!(part2(&input), 0);
    }
}
