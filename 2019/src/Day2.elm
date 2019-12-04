module Day2 exposing (..)

import Array exposing (..)


puzzleInput =
    "1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,6,19,23,1,23,13,27,2,6,27,31,1,5,31,35,2,10,35,39,1,6,39,43,1,13,43,47,2,47,6,51,1,51,5,55,1,55,6,59,2,59,10,63,1,63,6,67,2,67,10,71,1,71,9,75,2,75,10,79,1,79,5,83,2,10,83,87,1,87,6,91,2,9,91,95,1,95,5,99,1,5,99,103,1,103,10,107,1,9,107,111,1,6,111,115,1,115,5,119,1,10,119,123,2,6,123,127,2,127,6,131,1,131,2,135,1,10,135,0,99,2,0,14,0"


parsePuzzleInput : String -> List Int
parsePuzzleInput str =
    String.split "," str |> List.map (\a -> Maybe.withDefault 0 (String.toInt a))


getArrayElement : Int -> Array Int -> Int
getArrayElement index array =
    {- Using -1 to denote we have an invalid array position -}
    Array.get index array |> Maybe.withDefault -1


validatePositions : List Int -> Bool
validatePositions list =
    List.filter (\a -> a == -1) list |> List.isEmpty


runOpcode : Array Int -> Array Int -> Array Int
runOpcode codes data =
    let
        position1Value =
            getArrayElement (getArrayElement 1 codes) data

        position2Value =
            getArrayElement (getArrayElement 2 codes) data

        storagePosition =
            getArrayElement 3 codes

        validPositions =
            validatePositions [ position1Value, position2Value, storagePosition ]
    in
    case validPositions of
        True ->
            case Array.get 0 codes of
                Just 1 ->
                    Array.set storagePosition (position1Value + position2Value) data

                Just 2 ->
                    Array.set storagePosition (position1Value * position2Value) data

                {- Program should halt here, no more subsuqent changes to the array -}
                Just 99 ->
                    data

                _ ->
                    data

        _ ->
            data


splitList : Int -> List a -> List (List a)
splitList n list =
    case List.take n list of
        [] ->
            []

        items ->
            items :: splitList n (List.drop n list)


getAnswer : String -> Array Int
getAnswer puzzle =
    let
        codes =
            parsePuzzleInput puzzle
    in
    splitList 4 codes
        |> List.foldl (\chunk data -> runOpcode (Array.fromList chunk) data) (Array.fromList codes)
