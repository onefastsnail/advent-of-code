module Day2Test exposing (..)

import Day2 exposing (..)
import Expect exposing (..)
import Test exposing (..)


puzzleInput : String
puzzleInput =
    "1-3 a: abcde\n1-3 b: cdefg\n2-9 c: ccccccccc"


suite : Test
suite =
    describe "Day2"
        [ test "parsePuzzleInput"
            (\_ ->
                Day2.parsePuzzleInput puzzleInput
                    |> List.length
                    |> Expect.equal 3
            )
        , test
            "getAnswerPart1"
            (\_ -> Day2.getAnswerPart1 puzzleInput |> Expect.equal 2)
        , test
            "getAnswerPart2"
            (\_ -> Day2.getAnswerPart2 puzzleInput |> Expect.equal 1)
        ]
