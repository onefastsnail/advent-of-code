module Day4Test exposing (..)

import Day4 exposing (..)
import Expect exposing (..)
import Test exposing (..)



-- Invalid height


puzzleInput : String
puzzleInput =
    "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\nbyr:1937 iyr:2017 cid:147 hgt:183cm\n\niyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884\nhcl:#cfa07d byr:1929\n\nhcl:#ae17e1 iyr:2013\neyr:2024\necl:brn pid:760753108 byr:1931\nhgt:179\n\nhcl:#cfa07d eyr:2025 pid:166559648\niyr:2011 ecl:brn hgt:59in"


suite : Test
suite =
    describe "Day4"
        [ test "parsePuzzleInput"
            (\_ ->
                Day4.parsePuzzleInput puzzleInput
                    |> List.length
                    |> Expect.equal 4
            )
        , test
            "validatePassport (All fields present)"
            (\_ -> Day4.validatePassport [ [ "ecl", "gry" ], [ "pid", "860033327" ], [ "eyr", "2020" ], [ "hcl", "#fffffd" ], [ "byr", "1937" ], [ "iyr", "2017" ], [ "cid", "147" ], [ "hgt", "183cm" ] ] "cid" |> Expect.equal True)
        , test
            "validatePassport (Only CID missing)"
            (\_ -> Day4.validatePassport [ [ "ecl", "gry" ], [ "pid", "860033327" ], [ "eyr", "2020" ], [ "hcl", "#fffffd" ], [ "byr", "1937" ], [ "iyr", "2017" ], [ "hgt", "183cm" ] ] "cid" |> Expect.equal True)
        , test
            "validatePassport (Invalid)"
            (\_ -> Day4.validatePassport [ [ "ecl", "gry" ], [ "pid", "860033327" ], [ "eyr", "2020" ], [ "hcl", "#fffffd" ], [ "byr", "1937" ], [ "iyr", "2017" ] ] "cid" |> Expect.equal False)
        , test
            "validateYearRange OK"
            (\_ -> Day4.validateYearRange "2010" 2001 2010 |> Expect.equal True)
        , test
            "validateYearRange Bad"
            (\_ -> Day4.validateYearRange "2000" 2001 2010 |> Expect.equal False)
        , test
            "validateEyeColor OK"
            (\_ -> Day4.validateEyeColor "brn" |> Expect.equal True)
        , test
            "validateEyeColor Bad"
            (\_ -> Day4.validateEyeColor "wat" |> Expect.equal False)
        , test
            "validatePassportId OK"
            (\_ -> Day4.validatePassportId "000000001" |> Expect.equal True)
        , test
            "validatePassportId Bad"
            (\_ -> Day4.validatePassportId "0123456789" |> Expect.equal False)
        , test
            "validateHeight OK 1"
            (\_ -> Day4.validateHeight "60in" |> Expect.equal True)
        , test
            "validateHeight OK 2"
            (\_ -> Day4.validateHeight "190cm" |> Expect.equal True)
        , test
            "validateHeight Bad 1"
            (\_ -> Day4.validateHeight "190in" |> Expect.equal False)
        , test
            "validateHeight Bad 2"
            (\_ -> Day4.validateHeight "190" |> Expect.equal False)
        , test
            "validateHairColor OK"
            (\_ -> Day4.validateHairColor "#123abc" |> Expect.equal True)
        , test
            "validateHairColor Bad 1"
            (\_ -> Day4.validateHairColor "#123abzc" |> Expect.equal False)
        , test
            "validateHairColor Bad 2"
            (\_ -> Day4.validateHairColor "123abc" |> Expect.equal False)
        , test
            "getAnswerPart1"
            (\_ -> Day4.getAnswerPart1 puzzleInput |> Expect.equal 2)
        , test
            "getAnswerPart2"
            (\_ -> Day4.getAnswerPart2 puzzleInput |> Expect.equal 1)
        ]
