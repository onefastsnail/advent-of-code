module Day10 exposing (..)

import Array
import Debug
import Dict
import List
import Set


puzzleInput : String
puzzleInput =
    "76\n12\n97\n28\n132\n107\n145\n121\n84\n34\n115\n127\n22\n23\n11\n135\n113\n82\n140\n119\n69\n77\n83\n36\n13\n37\n92\n133\n122\n99\n147\n112\n42\n62\n65\n40\n123\n139\n33\n129\n149\n68\n41\n16\n48\n109\n5\n27\n142\n81\n90\n9\n78\n103\n26\n100\n141\n59\n55\n120\n126\n1\n35\n2\n20\n114\n58\n54\n10\n51\n116\n93\n6\n134\n108\n47\n70\n91\n138\n63\n19\n64\n148\n106\n21\n98\n43\n30\n146\n46\n128\n73\n94\n87\n29"


parsePuzzleInput : String -> List Int
parsePuzzleInput str =
    String.split "\n" str |> List.map (\a -> String.toInt a |> Maybe.withDefault 0)


connectAdapters : List Int -> List Int -> List ( Int, Int ) -> List ( Int, Int )
connectAdapters connectedAdapters freeAdapters differences =
    case freeAdapters of
        [] ->
            differences

        _ ->
            let
                currentAdapter =
                    List.head connectedAdapters |> Maybe.withDefault 0

                nextAdapter =
                    List.head freeAdapters |> Maybe.withDefault 0

                difference =
                    ( currentAdapter, nextAdapter - currentAdapter )
            in
            connectAdapters ([ nextAdapter ] ++ connectedAdapters) (List.drop 1 freeAdapters) (differences ++ [ difference ])


getAnswerPart1 : String -> Int
getAnswerPart1 puzzle =
    parsePuzzleInput puzzle
        |> (\adapters -> connectAdapters [] (List.sort adapters) [])
        |> (\differences ->
                let
                    x =
                        List.filter (\( _, a ) -> a == 1) differences |> List.length

                    y =
                        List.filter (\( _, a ) -> a == 3) differences |> List.length
                in
                x * (y + 1)
           )


countVariations : List Int -> Int
countVariations unsortedAdapters =
    let
        adapters =
            List.sort unsortedAdapters

        -- Create a new list including the starting adapter 0 so that is included in the range finding
        startingAdapters =
            0 :: adapters

        lastAdapter =
            List.reverse adapters |> List.head |> Maybe.withDefault 0
    in
    List.foldl
        (\adapter state ->
            let
                -- Find which adapters are within the joltage range of a given adapter looking backwards
                inRange =
                    List.filter (\a -> a >= adapter - 3 && a <= adapter - 1) startingAdapters
            in
            Dict.insert adapter
                (List.foldl
                    (\adapterCount totalCount ->
                        case Dict.get adapterCount state of
                            Just value ->
                                -- For each adapter in range is a possibility of removal therefore is deemed has 1 different arrangement
                                -- So lets reduce a counter that considers these arrangements for the current adapter and next adapter to retrieve
                                totalCount + value

                            Nothing ->
                                totalCount
                    )
                    0
                    inRange
                )
                state
        )
        -- We know the first adapter has 1 complete connection, so we use this as a base
        (Dict.empty |> Dict.insert 0 1)
        adapters
        |> Dict.get lastAdapter
        |> Maybe.withDefault 0


getAnswerPart2 : String -> Int
getAnswerPart2 puzzle =
    parsePuzzleInput puzzle
        |> countVariations
