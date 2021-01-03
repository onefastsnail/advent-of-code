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
        ]
