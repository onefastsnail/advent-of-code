module Day4 exposing (..)

import Array exposing (..)


splitNumber : Int -> List Int
splitNumber value =
    String.fromInt value
        |> String.split ""
        |> List.map (\a -> String.toInt a |> Maybe.withDefault -1)


testAdjacentDigits : Int -> List Int -> Bool
testAdjacentDigits current data =
    case List.head data of
        Just value ->
            if value == current then
                True

            else
                List.drop 1 data |> testAdjacentDigits value

        Nothing ->
            False


testNeverDecreasing : Int -> List Int -> Bool
testNeverDecreasing current data =
    case List.head data of
        Just value ->
            if value >= current then
                List.drop 1 data |> testNeverDecreasing value

            else
                False

        Nothing ->
            True


testPassword : Int -> Bool
testPassword password =
    let
        split =
            splitNumber password
    in
    testAdjacentDigits 0 split && testNeverDecreasing 0 split


getAnswerPart1 : Int -> Int -> Int
getAnswerPart1 x y =
    List.range x y
        |> List.filter testPassword
        |> List.length
