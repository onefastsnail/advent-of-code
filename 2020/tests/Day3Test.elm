module Day3Test exposing (..)

import Day3 exposing (..)
import Expect exposing (..)
import Test exposing (..)


puzzleInput : String
puzzleInput =
    "..##.........##.........##.........##.........##.........##.......\n#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..\n.#....#..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.\n..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#\n.#...##..#..#...##..#..#...##..#..#...##..#..#...##..#..#...##..#.\n..#.##.......#.##.......#.##.......#.##.......#.##.......#.##.....\n.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#\n.#........#.#........#.#........#.#........#.#........#.#........#\n#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...\n#...##....##...##....##...##....##...##....##...##....##...##....#\n.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#\n"


suite : Test
suite =
    describe "Day3"
        [ test "parsePuzzleInput"
            (\_ ->
                Day3.parsePuzzleInput puzzleInput
                    |> List.length
                    |> Expect.equal 12
            )
        , test
            "isTreeHit (True)"
            (\_ -> Day3.isTreeHit [ "a", "b", "#" ] 2 |> Expect.equal True)
        , test
            "isTreeHit (False)"
            (\_ -> Day3.isTreeHit [ "a", "b", "#" ] 1 |> Expect.equal False)
        , test
            "expandPuzzle"
            (\_ -> Day3.expandPuzzle [ [ "a", "b" ], [ "c", "d" ] ] |> Expect.equal [ [ "a", "b", "a", "b", "a", "b" ], [ "c", "d", "c", "d", "c", "d" ] ])
        , test
            "getAnswerPart1"
            (\_ -> Day3.getAnswerPart1 puzzleInput |> Expect.equal 7)
        ]
