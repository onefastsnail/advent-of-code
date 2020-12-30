module Day9Test exposing (..)

import Array exposing (Array)
import Day9 exposing (..)
import Expect exposing (..)
import Test exposing (..)


puzzleInput : String
puzzleInput =
    "35\n20\n15\n25\n47\n40\n62\n55\n65\n95\n102\n117\n150\n182\n127\n219\n299\n277\n309\n576"


suite : Test
suite =
    describe "Day9"
        [ test "parsePuzzleInput"
            (\_ ->
                Day9.parsePuzzleInput puzzleInput
                    |> List.length
                    |> Expect.equal 20
            )
        , test
            "hasSum 1"
            (\_ -> Day9.hasSum [ 1, 2, 3 ] 2 |> Expect.equal False)
        , test
            "hasSum 2"
            (\_ -> Day9.hasSum [ 1, 2, 3 ] 5 |> Expect.equal True)
        , test
            "getAnswerPart1"
            (\_ -> Day9.getAnswerPart1 puzzleInput 5 |> Expect.equal 127)
        , test
            "getAnswerPart2"
            (\_ -> Day9.getAnswerPart2 puzzleInput 5 |> Expect.equal 62)
        ]
