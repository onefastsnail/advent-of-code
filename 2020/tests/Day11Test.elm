module Day11Test exposing (..)

import Array
import Day11 exposing (..)
import Expect exposing (..)
import Test exposing (..)


puzzleInput : String
puzzleInput =
    "L.LL.LL.LL\nLLLLLLL.LL\nL.L.L..L..\nLLLL.LL.LL\nL.LL.LL.LL\nL.LLLLL.LL\n..L.L.....\nLLLLLLLLLL\nL.LLLLLL.L\nL.LLLLL.LL"


suite : Test
suite =
    describe "Day11"
        [ test "parsePuzzleInput"
            (\_ ->
                Day11.parsePuzzleInput puzzleInput
                    |> Array.length
                    |> Expect.equal 10
            )
        , test
            "getAnswerPart1"
            (\_ -> Day11.getAnswerPart1 puzzleInput |> Expect.equal 37)
        , test
            "getAdjacentSeatsInSight 1"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput ".##.##.\n#.#.#.#\n##...##\n...L...\n##...##\n#.#.#.#\n.##.##."
                in
                Day11.getAdjacentSeatsInSight 3 3 map |> List.length |> Expect.equal 0
            )
        , test
            "getAdjacentSeatsInSight 2"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput ".......#.\n...#.....\n.#.......\n.........\n..#L....#\n....#....\n.........\n#........\n...#....."
                in
                Day11.getAdjacentSeatsInSight 4 3 map |> List.length |> Expect.equal 8
            )
        , test
            "getAdjacentSeatsInSight 3"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput ".............\n.L.L.#.#.#.#.\n............."
                in
                Day11.getAdjacentSeatsInSight 1 1 map |> List.length |> Expect.equal 1
            )
        , test
            "getAdjacentSeatsInSight 4"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput ".............\n.L.L.#.#.#.#.\n............."
                in
                Day11.getAdjacentSeatsInSight 1 2 map |> List.length |> Expect.equal 2
            )
        , test
            "getAdjacentSeatsInSight 5"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput "#.##.##.##\n#######.##\n#.#.#..#..\n####.##.##\n#.##.##.##\n#.#####.##\n..#.#.....\n##########\n#.######.#\n#.#####.##"
                in
                Day11.getAdjacentSeatsInSight 7 0 map |> List.length |> Expect.equal 5
            )
        , test
            "findNextSeatInSight 1"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput ".......#.\n...#.....\n.#.......\n.........\n..#L....#\n....#....\n.........\n#........\n...#....."
                in
                Day11.findNextSeatInSight 4 3 map "diagonalDownRight" |> Expect.equal "#"
            )
        , test
            "findNextSeatInSight 2"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput ".......#.\n...#.....\n.#.......\n.........\n..#L....#\n....#....\n.........\n#........\n...#....."
                in
                Day11.findNextSeatInSight 4 3 map "down" |> Expect.equal "#"
            )
        , test
            "findNextSeatInSight 3"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput ".......#.\n...#.....\n.#.......\n.........\n..#L....#\n....#....\n.........\n#........\n...#....."
                in
                Day11.findNextSeatInSight 4 3 map "diagonalDownRight" |> Expect.equal "#"
            )
        , test
            "findNextSeatInSight 4"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput ".......#.\n...#.....\n.#.......\n.........\n..#L....#\n....#....\n.........\n#........\n...#....."
                in
                Day11.findNextSeatInSight 4 3 map "left" |> Expect.equal "#"
            )
        , test
            "findNextSeatInSight 5"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput ".......#.\n...#.....\n.#.......\n.........\n..#L....#\n....#....\n.........\n#........\n...#....."
                in
                Day11.findNextSeatInSight 4 3 map "right" |> Expect.equal "#"
            )
        , test
            "findNextSeatInSight 6"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput ".......#.\n...#.....\n.#.......\n.........\n..#L....#\n....#....\n.........\n#........\n...#....."
                in
                Day11.findNextSeatInSight 4 3 map "diagonalDownLeft" |> Expect.equal "#"
            )
        , test
            "findNextSeatInSight 7"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput ".......#.\n...#.....\n.#.......\n.........\n..#L....#\n....#....\n.........\n#........\n...#....."
                in
                Day11.findNextSeatInSight 4 3 map "diagonalUpLeft" |> Expect.equal "#"
            )
        , test
            "findNextSeatInSight 8"
            (\_ ->
                let
                    map =
                        Day11.parsePuzzleInput ".......#.\n...#.....\n.#.......\n.........\n..#L....#\n....#....\n.........\n#........\n...#....."
                in
                Day11.findNextSeatInSight 4 3 map "diagonalUpRight" |> Expect.equal "#"
            )
        , test
            "applyRulesV2"
            (\_ ->
                let
                    expected =
                        Day11.parsePuzzleInput "#.LL.LL.L#\n#LLLLLL.LL\nL.L.L..L..\nLLLL.LL.LL\nL.LL.LL.LL\nL.LLLLL.LL\n..L.L.....\nLLLLLLLLL#\n#.LLLLLL.L\n#.LLLLL.L#"
                in
                Day11.parsePuzzleInput "L.LL.LL.LL\nLLLLLLL.LL\nL.L.L..L..\nLLLL.LL.LL\nL.LL.LL.LL\nL.LLLLL.LL\n..L.L.....\nLLLLLLLLLL\nL.LLLLLL.L\nL.LLLLL.LL"
                    |> Day11.applyRulesV2
                    |> Day11.applyRulesV2
                    |> Expect.equal expected
            )
        , test
            "getAnswerPart2"
            (\_ -> Day11.getAnswerPart2 puzzleInput |> Expect.equal 26)
        ]
