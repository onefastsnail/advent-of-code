module Day5Test exposing (..)

import Day5 exposing (..)
import Expect exposing (..)
import Test exposing (..)


puzzleInput : String
puzzleInput =
    "FFFBFFFRRL\nFFFBBBFLLL\nBFFFBFBRLR\nBFBFFFBRLL"


suite : Test
suite =
    describe "Day5"
        [ test "parsePuzzleInput"
            (\_ ->
                Day5.parsePuzzleInput puzzleInput
                    |> List.length
                    |> Expect.equal 4
            )
        , test
            "findRow 1"
            (\_ -> String.split "" "BFFFBBF" |> Day5.findRegion "F" (List.range 0 127) |> Expect.equal 70)
        , test
            "findRow 2"
            (\_ -> String.split "" "FFFBBBF" |> Day5.findRegion "F" (List.range 0 127) |> Expect.equal 14)
        , test
            "findRow 3"
            (\_ -> String.split "" "BBFFBBF" |> Day5.findRegion "F" (List.range 0 127) |> Expect.equal 102)
        , test
            "findColumn 1"
            (\_ ->
                Day5.swapsies "RRR"
                    |> String.split ""
                    |> Day5.findRegion "B" (List.range 0 7)
                    |> Expect.equal 7
            )
        , test
            "findColumn 2"
            (\_ ->
                Day5.swapsies "RLL"
                    |> String.split ""
                    |> Day5.findRegion "B" (List.range 0 7)
                    |> Expect.equal 4
            )
        , test
            "getAnswerPart1 1"
            (\_ -> Day5.getAnswerPart1 "BFFFBBFRRR" |> Expect.equal 567)
        , test
            "getAnswerPart1 2"
            (\_ -> Day5.getAnswerPart1 "FFFBBBFRRR" |> Expect.equal 119)
        , test
            "getAnswerPart1 3"
            (\_ -> Day5.getAnswerPart1 "BBFFBBFRLL" |> Expect.equal 820)
        ]
