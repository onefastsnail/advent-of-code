module Day8Test exposing (..)

import Array exposing (Array)
import Day8 exposing (..)
import Dict
import Expect exposing (..)
import Test exposing (..)


puzzleInput : String
puzzleInput =
    "nop +0\nacc +1\njmp +4\nacc +3\njmp -3\nacc -99\nacc +1\njmp -4\nacc +6"


suite : Test
suite =
    describe "Day8"
        [ test "parsePuzzleInput"
            (\_ ->
                Day8.parsePuzzleInput puzzleInput
                    |> Array.length
                    |> Expect.equal 9
            )
        , test
            "getAnswerPart1 1"
            (\_ -> Day8.getAnswerPart1 puzzleInput |> Expect.equal 5)
        ]
