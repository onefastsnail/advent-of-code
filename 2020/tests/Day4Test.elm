module Day4Test exposing (..)

import Day4 exposing (..)
import Expect exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Day3"
        [ test "parsePuzzleInput"
            (\_ ->
                Day4.parsePuzzleInput puzzleTestInput
                    |> List.length
                    |> Expect.equal 4
            )
        , test
            "validatePassport (All fields present)"
            (\_ -> Day4.validatePassport [ [ "ecl", "gry" ], [ "pid", "860033327" ], [ "eyr", "2020" ], [ "hcl", "#fffffd" ], [ "byr", "1937" ], [ "iyr", "2017" ], [ "cid", "147" ], [ "hgt", "183cm" ] ] |> Expect.equal True)
        , test
            "validatePassport (Only CID missing)"
            (\_ -> Day4.validatePassport [ [ "ecl", "gry" ], [ "pid", "860033327" ], [ "eyr", "2020" ], [ "hcl", "#fffffd" ], [ "byr", "1937" ], [ "iyr", "2017" ], [ "hgt", "183cm" ] ] |> Expect.equal True)
        , test
            "validatePassport (Invalid)"
            (\_ -> Day4.validatePassport [ [ "ecl", "gry" ], [ "pid", "860033327" ], [ "eyr", "2020" ], [ "hcl", "#fffffd" ], [ "byr", "1937" ], [ "iyr", "2017" ] ] |> Expect.equal False)
        , test
            "getAnswerPart1"
            (\_ -> Day4.getAnswerPart1 Day4.puzzleTestInput |> Expect.equal 2)
        ]
