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
            "testForNeverDecreasing 1"
            (\_ -> Day4.splitNumber 111123 |> Day4.testForNeverDecreasing 0 |> Expect.equal True)
        , test
            "testForNeverDecreasing 2"
            (\_ -> Day4.splitNumber 135679 |> Day4.testForNeverDecreasing 0 |> Expect.equal True)
        , test
            "testForNeverDecreasing 3"
            (\_ -> Day4.splitNumber 223450 |> Day4.testForNeverDecreasing 0 |> Expect.equal False)
        , describe
            "Part 1"
            [ test
                "testForAdjacentDigits 1"
                (\_ -> Day4.splitNumber 1234456 |> Day4.testForAdjacentDigits 0 |> Expect.equal True)
            , test
                "testForAdjacentDigits 2"
                (\_ -> Day4.splitNumber 111123 |> Day4.testForAdjacentDigits 0 |> Expect.equal True)
            , test
                "testForAdjacentDigits 3"
                (\_ -> Day4.splitNumber 135679 |> Day4.testForAdjacentDigits 0 |> Expect.equal False)
            , test
                "testForAdjacentDigits 4"
                (\_ -> Day4.splitNumber 111111 |> Day4.testForAdjacentDigits 0 |> Expect.equal True)
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
        , describe
            "Part 2"
            [ test "testForStrictAdjacentDigits 1"
                (\_ -> Day4.splitNumber 112233 |> Day4.testForStrictAdjacentDigits |> Expect.equal True)
            , test "testForStrictAdjacentDigits 2"
                (\_ -> Day4.splitNumber 123444 |> Day4.testForStrictAdjacentDigits |> Expect.equal False)
            , test "testForStrictAdjacentDigits 3"
                (\_ -> Day4.splitNumber 111122 |> Day4.testForStrictAdjacentDigits |> Expect.equal True)
            , test "testForStrictAdjacentDigits 4"
                (\_ -> Day4.splitNumber 333334 |> Day4.testForStrictAdjacentDigits |> Expect.equal False)
            , test "test 1"
                (\_ -> Day4.testPasswordPart2 111111 |> Expect.equal False)
            , test "test 2"
                (\_ -> Day4.testPasswordPart2 223450 |> Expect.equal False)
            , test "test 3"
                (\_ -> Day4.testPasswordPart2 123789 |> Expect.equal False)
            , test "test 4"
                (\_ -> Day4.testPasswordPart2 222445 |> Expect.equal True)
            , test
                "getAnswerPart2"
                (\_ -> Day4.getAnswerPart2 158126 624574 |> Expect.equal 1131)
            ]
        ]
