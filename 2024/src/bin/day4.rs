use std::collections::HashSet;

fn main() {
    let input = std::fs::read_to_string("./inputs/day4/input.txt").expect("file not found!");

    println!("Part 1 answer is: {}", part1(&input));
    println!("Part 2 answer is: {}", part2(&input));
}

fn part1(input: &str) -> i32 {
    let letters: Vec<Vec<char>> = input.lines().map(|line| line.chars().collect()).collect();
    let mut count = 0;
    let find = "XMAS";

    count += letters
        .iter()
        .map(|it| count_in_row(&it, find))
        .sum::<i32>();

    count += count_vertically(&letters, find);

    count += count_diagonally_dlr(&letters, find);

    count += count_diagonally_ulr(&letters, find);

    count
}

fn part2(input: &str) -> i32 {
    let letters: Vec<Vec<char>> = input.lines().map(|line| line.chars().collect()).collect();
    let mut count = 0;
    let valid_values = HashSet::from(["MAS", "SAM"]);

    for i in 0..letters[0].len() - 2 {
        for it in (0..letters[0].len()).collect::<Vec<_>>().windows(3) {
            let middle = letters[i + 1][it[1]];

            let d1 = [letters[i][it[0]], middle, letters[i + 2][it[2]]]
                .iter()
                .collect::<String>();

            let d2 = [letters[i][it[0 + 2]], middle, letters[i + 2][it[0]]]
                .iter()
                .collect::<String>();

            if [&d1.as_str(), &d2.as_str()]
                .iter()
                .all(|&d| valid_values.contains(d))
            {
                count += 1;
            }
        }
    }

    count
}

fn count_in_row(letters: &Vec<char>, m: &str) -> i32 {
    letters.windows(m.len()).fold(0, |acc, it| {
        if it.iter().copied().eq(m.chars()) || it.iter().copied().eq(m.chars().rev()) {
            return acc + 1;
        }

        acc
    })
}

fn count_vertically(input: &Vec<Vec<char>>, m: &str) -> i32 {
    let mut count = 0;

    for i in 0..input[0].len() {
        let mut letters: Vec<char> = Vec::new();

        for j in 0..input.len() {
            letters.push(input[j][i]);
        }

        count += count_in_row(&letters, m);
    }

    count
}

fn count_diagonally_dlr(input: &Vec<Vec<char>>, m: &str) -> i32 {
    let mut count = 0; // \

    for i in 0..input.len() - 3 {
        for j in 0..input[0].len() - 3 {
            let mut letters: Vec<char> = Vec::new();

            letters.push(input[i][j]);
            letters.push(input[i + 1][j + 1]);
            letters.push(input[i + 2][j + 2]);
            letters.push(input[i + 3][j + 3]);

            count += count_in_row(&letters, m);
        }
    }

    count
}

fn count_diagonally_ulr(input: &Vec<Vec<char>>, m: &str) -> i32 {
    let mut count = 0; // /

    for i in (3..input.len()).rev() {
        for j in 0..input[0].len() - 3 {
            let mut letters: Vec<char> = Vec::new();

            letters.push(input[i][j]);
            letters.push(input[i - 1][j + 1]);
            letters.push(input[i - 2][j + 2]);
            letters.push(input[i - 3][j + 3]);

            count += count_in_row(&letters, m);
        }
    }

    count
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_solves_part1_example1() {
        let input = std::fs::read_to_string("./inputs/day4/teaser.txt").expect("file not found!");

        assert_eq!(part1(&input), 18);
    }

    #[test]
    fn it_solves_part1_example2() {
        let input = std::fs::read_to_string("./inputs/day4/teaser2.txt").expect("file not found!");

        assert_eq!(part1(&input), 4);
    }

    #[test]
    fn it_solves_part1() {
        let input = std::fs::read_to_string("./inputs/day4/input.txt").expect("file not found!");

        assert_eq!(part1(&input), 2543);
    }

    #[test]
    fn it_solves_part2_example1() {
        let input = std::fs::read_to_string("./inputs/day4/teaser.txt").expect("file not found!");

        assert_eq!(part2(&input), 9);
    }

    #[test]
    fn it_solves_part2() {
        let input = std::fs::read_to_string("./inputs/day4/input.txt").expect("file not found!");

        assert_eq!(part2(&input), 1930);
    }
}
