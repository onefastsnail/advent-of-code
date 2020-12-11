module Day6Test exposing (..)

import Day6 exposing (..)
import Expect exposing (..)
import Test exposing (..)


puzzleInput : String
puzzleInput =
    "abc\n\na\nb\nc\n\nab\nac\n\na\na\na\na\n\nb"


suite : Test
suite =
    describe "Day6"
        [ test "parsePuzzleInput"
            (\_ ->
                Day6.parsePuzzleInput puzzleInput
                    |> List.length
                    |> Expect.equal 5
            )
        , test
            "getAnswerPart1 1"
            (\_ -> Day6.getAnswerPart1 puzzleInput |> Expect.equal 11)
        ]
