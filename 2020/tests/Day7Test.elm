module Day7Test exposing (..)

import Day7 exposing (..)
import Dict
import Expect exposing (..)
import Test exposing (..)


puzzleInput : String
puzzleInput =
    "light red bags contain 1 bright white bag, 2 muted yellow bags.\ndark orange bags contain 3 bright white bags, 4 muted yellow bags.\nbright white bags contain 1 shiny gold bag.\nmuted yellow bags contain 2 shiny gold bags, 9 faded blue bags.\nshiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.\ndark olive bags contain 3 faded blue bags, 4 dotted black bags.\nvibrant plum bags contain 5 faded blue bags, 6 dotted black bags.\nfaded blue bags contain no other bags.\ndotted black bags contain no other bags."


suite : Test
suite =
    describe "Day7"
        [ test "parsePuzzleInput"
            (\_ ->
                Day7.parsePuzzleInput puzzleInput
                    |> Dict.size
                    |> Expect.equal 9
            )
        , test
            "getAnswerPart1 1"
            (\_ -> Day7.getAnswerPart1 puzzleInput |> Expect.equal 4)
        , test
            "countBags simple"
            (\_ ->
                let
                    puzzleInputTest =
                        "shiny gold bags contain 2 dark red bags.\ndark red bags contain 2 dark orange bags.\ndark orange bags contain no other bags."

                    bags =
                        Day7.parsePuzzleInput puzzleInputTest
                in
                Day7.countBags (Dict.get "shiny gold" bags |> Maybe.withDefault Dict.empty) bags 0 |> Expect.equal 6
            )
        ]
