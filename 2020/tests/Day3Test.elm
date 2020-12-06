module Day3Test exposing (..)

import Day3 exposing (..)
import Expect exposing (..)
import Test exposing (..)


puzzleInput : String
puzzleInput =
    "..##.......\n#...#...#..\n.#....#..#.\n..#.#...#.#\n.#...##..#.\n..#.##.....\n.#.#.#....#\n.#........#\n#.##...#...\n#...##....#\n.#..#...#.#"


suite : Test
suite =
    describe "Day3"
        [ test "parsePuzzleInput"
            (\_ ->
                Day3.parsePuzzleInput puzzleInput
                    |> List.length
                    |> Expect.equal 11
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
            "multiplyTogether"
            (\_ -> Day3.multiplyTogether [ 2, 2, 2, 2 ] |> Expect.equal 16)
        , test
            "expandPuzzle 2"
            (\_ ->
                Day3.parsePuzzleInput puzzleInput
                    |> Day3.expandPuzzle
                    |> List.reverse
                    |> List.head
                    |> Maybe.withDefault []
                    |> Expect.equal [ ".", "#", ".", ".", "#", ".", ".", ".", "#", ".", "#", ".", "#", ".", ".", "#", ".", ".", ".", "#", ".", "#", ".", "#", ".", ".", "#", ".", ".", ".", "#", ".", "#", ".", "#", ".", ".", "#", ".", ".", ".", "#", ".", "#", ".", "#", ".", ".", "#", ".", ".", ".", "#", ".", "#", ".", "#", ".", ".", "#", ".", ".", ".", "#", ".", "#", ".", "#", ".", ".", "#", ".", ".", ".", "#", ".", "#", ".", "#", ".", ".", "#", ".", ".", ".", "#", ".", "#", ".", "#", ".", ".", "#", ".", ".", ".", "#", ".", "#", ".", "#", ".", ".", "#", ".", ".", ".", "#", ".", "#", ".", "#", ".", ".", "#", ".", ".", ".", "#", ".", "#", ".", "#", ".", ".", "#", ".", ".", ".", "#", ".", "#" ]
            )
        , test
            "getAnswerPart1"
            (\_ -> Day3.getAnswerPart1 puzzleInput |> Expect.equal 7)
        , test
            "getAnswerPart2"
            (\_ -> Day3.getAnswerPart2 puzzleInput [ ( 1, 1 ), ( 3, 1 ), ( 5, 1 ), ( 7, 1 ), ( 1, 2 ) ] |> Expect.equal 336)
        ]
