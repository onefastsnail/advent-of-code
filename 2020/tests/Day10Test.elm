module Day10Test exposing (..)

import Day10 exposing (..)
import Expect exposing (..)
import Test exposing (..)


puzzleInput : String
puzzleInput =
    "28\n33\n18\n42\n31\n14\n46\n20\n48\n47\n24\n23\n49\n45\n19\n38\n39\n11\n1\n32\n25\n35\n8\n17\n7\n9\n4\n2\n34\n10\n3"


suite : Test
suite =
    describe "Day10"
        [ test "parsePuzzleInput"
            (\_ ->
                Day10.parsePuzzleInput puzzleInput
                    |> List.length
                    |> Expect.equal 31
            )
        , test
            "getAnswerPart1"
            (\_ -> Day10.getAnswerPart1 puzzleInput |> Expect.equal 220)
        , test
            "getAnswerPart2 1"
            (\_ ->
                Day10.getAnswerPart2 "16\n10\n15\n5\n1\n11\n7\n19\n6\n12\n4"
                    |> Expect.equal 8
            )
        , test
            "getAnswerPart2 2"
            (\_ ->
                Day10.getAnswerPart2 "28\n33\n18\n42\n31\n14\n46\n20\n48\n47\n24\n23\n49\n45\n19\n38\n39\n11\n1\n32\n25\n35\n8\n17\n7\n9\n4\n2\n34\n10\n3"
                    |> Expect.equal 19208
            )
        ]
