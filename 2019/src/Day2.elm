module Day2 exposing (..)

import Array exposing (..)


type alias Computer =
    { pointer : Int
    , memory : Array Int
    }


puzzleInput : String
puzzleInput =
    "1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,6,19,23,1,23,13,27,2,6,27,31,1,5,31,35,2,10,35,39,1,6,39,43,1,13,43,47,2,47,6,51,1,51,5,55,1,55,6,59,2,59,10,63,1,63,6,67,2,67,10,71,1,71,9,75,2,75,10,79,1,79,5,83,2,10,83,87,1,87,6,91,2,9,91,95,1,95,5,99,1,5,99,103,1,103,10,107,1,9,107,111,1,6,111,115,1,115,5,119,1,10,119,123,2,6,123,127,2,127,6,131,1,131,2,135,1,10,135,0,99,2,0,14,0"


parsePuzzleInput : String -> List Int
parsePuzzleInput str =
    String.split "," str
        |> List.map (\a -> String.toInt a |> Maybe.withDefault 0)


restoreProgramState : List ( Int, a ) -> Array a -> Array a
restoreProgramState replacements state =
    List.foldl (\( a, b ) c -> Array.set a b c) state replacements


restore1202State : Array Int -> Array Int
restore1202State state =
    restoreProgramState [ ( 1, 12 ), ( 2, 2 ) ] state


getArrayElement : Int -> Array a -> a -> a
getArrayElement index array default =
    {- Using "a" to denote we have an invalid array position -}
    Array.get index array |> Maybe.withDefault default


validateArrayElements : List a -> a -> Bool
validateArrayElements list value =
    List.filter (\a -> a == value) list |> List.isEmpty


stepForward : Int -> Int -> Int -> Computer -> Computer
stepForward step position value computer =
    { pointer = computer.pointer + step, memory = Array.set position value computer.memory }


runProgram : Computer -> Computer
runProgram computer =
    let
        {- A local util to read the computer memory -}
        readMemory index =
            getArrayElement index computer.memory -1

        opcode =
            readMemory computer.pointer

        address1 =
            readMemory (computer.pointer + 1)

        address2 =
            readMemory (computer.pointer + 2)

        address3 =
            readMemory (computer.pointer + 3)

        step value =
            stepForward 4 address3 value computer

        {- Lets check we have valid instruction parameters -}
        validAddresses =
            validateArrayElements [ address1, address2, address3 ] -1
    in
    case validAddresses of
        True ->
            case opcode of
                1 ->
                    step (readMemory address1 + readMemory address2) |> runProgram

                2 ->
                    step (readMemory address1 * readMemory address2) |> runProgram

                99 ->
                    computer

                _ ->
                    computer

        _ ->
            computer


createInputPermutations : Int -> Int -> List ( Int, Int )
createInputPermutations start end =
    let
        range =
            List.range start end
    in
    List.map (\a -> List.map (\b -> ( a, b )) range) range |> List.concat


runPermutation : ( Int, Int ) -> Array Int -> Computer
runPermutation ( a, b ) state =
    restoreProgramState
        [ ( 1, a ), ( 2, b ) ]
        state
        |> Computer 0
        |> runProgram


evaluatePermutation : Int -> Computer -> Bool
evaluatePermutation desiredOutput computer =
    let
        output =
            Array.get 0 computer.memory |> Maybe.withDefault 0
    in
    if output == desiredOutput then
        True

    else
        False


runPermutations : Array Int -> Int -> List ( Int, Int ) -> List ( Int, Int )
runPermutations state desiredOutput permutations =
    List.foldl
        (\a b ->
            let
                result =
                    runPermutation a state |> evaluatePermutation desiredOutput
            in
            case result of
                True ->
                    a :: b

                _ ->
                    b
        )
        []
        permutations


getAnswerPart1 : String -> Int
getAnswerPart1 puzzle =
    parsePuzzleInput puzzle
        |> Array.fromList
        |> restore1202State
        |> Computer 0
        |> runProgram
        |> .memory
        |> Array.get 0
        |> Maybe.withDefault 0


getAnswerPart2 : String -> Int -> List ( Int, Int )
getAnswerPart2 puzzle desiredOutput =
    let
        state =
            parsePuzzleInput puzzle |> Array.fromList
    in
    createInputPermutations 0 99 |> runPermutations state desiredOutput
