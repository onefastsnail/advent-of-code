module Day4Test exposing (..)

import Day4 exposing (..)
import Expect exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Day 4"
        [ test "splitNumber"
            (\_ -> Day4.splitNumber 123 |> Expect.equal [ 1, 2, 3 ])
        , test
            "testNeverDecreasing 1"
            (\_ -> Day4.splitNumber 111123 |> Day4.testNeverDecreasing 0 |> Expect.equal True)
        , test
            "testNeverDecreasing 2"
            (\_ -> Day4.splitNumber 135679 |> Day4.testNeverDecreasing 0 |> Expect.equal True)
        , test
            "testNeverDecreasing 3"
            (\_ -> Day4.splitNumber 223450 |> Day4.testNeverDecreasing 0 |> Expect.equal False)
        , test
            "testAdjacentDigits 1"
            (\_ -> Day4.splitNumber 1234456 |> Day4.testAdjacentDigits 0 |> Expect.equal True)
        , test
            "testAdjacentDigits 2"
            (\_ -> Day4.splitNumber 111123 |> Day4.testAdjacentDigits 0 |> Expect.equal True)
        , test
            "testAdjacentDigits 3"
            (\_ -> Day4.splitNumber 135679 |> Day4.testAdjacentDigits 0 |> Expect.equal False)
        , test
            "example 1"
            (\_ -> Day4.getAnswerPart1 100 110 |> Expect.equal 0)
        , test
            "example 2"
            (\_ -> Day4.getAnswerPart1 109 112 |> Expect.equal 2)
        , test
            "getAnswerPart1"
            (\_ -> Day4.getAnswerPart1 158126 624574 |> Expect.equal 1665)
        ]
