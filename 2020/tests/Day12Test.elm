module Day12Test exposing (..)

import Day12 exposing (..)
import Expect exposing (..)
import Test exposing (..)


puzzleInput : String
puzzleInput =
    "F10\nN3\nF7\nR90\nF11"


suite : Test
suite =
    describe "Day12"
        [ test "parsePuzzleInput"
            (\_ ->
                Day12.parsePuzzleInput puzzleInput
                    |> List.length
                    |> Expect.equal 5
            )
        , test
            "getAnswerPart1"
            (\_ -> Day12.getAnswerPart1 puzzleInput |> Expect.equal 25)
        , test
            "Day12.convertNumberToCardinal north"
            (\_ ->
                Day12.changeDirection "L" 90 0
                    |> Expect.equal 3
            )
        , test
            "Day12.convertNumberToCardinal north and back"
            (\_ ->
                Day12.changeDirection "L" 90 0
                    |> Day12.changeDirection "R" 90
                    |> Expect.equal 0
            )
        ]
