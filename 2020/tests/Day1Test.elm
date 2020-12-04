module Day1Test exposing (..)

import Day1 exposing (..)
import Expect exposing (..)
import Test exposing (..)


puzzleInput : String
puzzleInput =
    "1721\n979\n366\n299\n675\n1456"


suite : Test
suite =
    describe "Day1"
        [ test "parsePuzzleInput"
            (\_ ->
                Day1.parsePuzzleInput puzzleInput
                    |> List.length
                    |> Expect.equal 6
            )
        , test
            "getAnswerPart1"
            (\_ -> Day1.getAnswerPart1 puzzleInput 2020 |> Expect.equal 514579)
        , test
            "getAnswerPart2"
            (\_ -> Day1.getAnswerPart2 puzzleInput 2020 |> Expect.equal 241861950)
        ]
