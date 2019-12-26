module Day4 exposing (..)

import Array exposing (..)


type alias Digit =
    Int


splitNumber : Digit -> List Digit
splitNumber value =
    String.fromInt value
        |> String.split ""
        |> List.map (\a -> String.toInt a |> Maybe.withDefault -1)


testForAdjacentDigits : Digit -> List Digit -> Bool
testForAdjacentDigits current data =
    case List.head data of
        Just value ->
            if value == current then
                True

            else
                List.drop 1 data |> testForAdjacentDigits value

        Nothing ->
            False


testForStrictAdjacentDigits : List Digit -> Bool
testForStrictAdjacentDigits digits =
    List.foldl
        (\digit state ->
            if digit == state.current then
                { state | current = digit, streak = state.streak + 1 }

            else if digit /= state.current && state.streak == 2 then
                { state | current = digit, streak = 1, adjacentFound = True }

            else
                { state | current = digit, streak = 1 }
        )
        { current = 0, streak = 1, adjacentFound = False }
        digits
        |> (\a -> a.adjacentFound || a.streak == 2)


testForNeverDecreasing : Digit -> List Digit -> Bool
testForNeverDecreasing current data =
    case List.head data of
        Just value ->
            if value >= current then
                List.drop 1 data |> testForNeverDecreasing value

            else
                False

        Nothing ->
            True


testPasswordPart1 : Digit -> Bool
testPasswordPart1 password =
    let
        split =
            splitNumber password
    in
    testForAdjacentDigits 0 split && testForNeverDecreasing 0 split


getAnswerPart1 : Digit -> Digit -> Digit
getAnswerPart1 x y =
    List.range x y
        |> List.filter testPasswordPart1
        |> List.length


testPasswordPart2 : Digit -> Bool
testPasswordPart2 password =
    let
        split =
            splitNumber password
    in
    testForNeverDecreasing 0 split && testForStrictAdjacentDigits split


getAnswerPart2 : Digit -> Digit -> Digit
getAnswerPart2 x y =
    List.range x y
        |> List.filter testPasswordPart2
        |> List.length
