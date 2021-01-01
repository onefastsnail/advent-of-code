module Day10 exposing (..)

import Array
import List


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


puzzleInput1 =
    "16\n10\n15\n5\n1\n11\n7\n19\n6\n12\n4"


puzzleInput2 =
    "28\n33\n18\n42\n31\n14\n46\n20\n48\n47\n24\n23\n49\n45\n19\n38\n39\n11\n1\n32\n25\n35\n8\n17\n7\n9\n4\n2\n34\n10\n3"



-- findArrangements adapters
-- getAnswerPart2 puzzle =
--     let
--         numbers =
--             parsePuzzleInput puzzle |> List.sort |> Array.fromList
--         differences =
--             parsePuzzleInput puzzle |> (\adapters -> connectAdapters [] (List.sort adapters) [])
--         ones =
--             List.filter (\( _, d ) -> d == 1) differences |> Debug.log "x"
--     in
--     List.foldl
--         (\( k, v ) a ->
--             let
--                 start =
--                     Array.get k numbers |> Maybe.withDefault 999 |> Debug.log "a"
--                 end =
--                     Array.get (k + 2) numbers |> Maybe.withDefault 111 |> Debug.log "b"
--                 canNextBeRemoved =
--                     end - adapter <= 3 |> Debug.log "c"
--             in
--             case canNextBeRemoved of
--                 True ->
--                     a + 1
--                 False ->
--                     a
--         )
--         1
--         (List.indexedMap Tuple.pair (Array.toList numbers))


getAnswerPart2 puzzle =
    let
        numbers =
            parsePuzzleInput puzzle
                |> List.append [ 0 ]
                |> List.sort
                |> (\a -> List.append a [ List.reverse a |> List.head |> Maybe.withDefault 0 |> (\b -> b + 3) ])

        indexedNumbers =
            Array.fromList numbers
    in
    List.foldl
        (\( k, _ ) a ->
            let
                adapter =
                    Array.get k indexedNumbers |> Maybe.withDefault 0 |> Debug.log "a"

                slice =
                    Array.slice (k + 1) (k + 4) indexedNumbers |> Array.toList |> Debug.log "b"

                x =
                    List.foldl
                        (\nextAdapter count ->
                            let
                                canNextBeRemoved =
                                    nextAdapter - adapter < 3 |> Debug.log "c"
                            in
                            case canNextBeRemoved of
                                True ->
                                    count + 1

                                False ->
                                    count
                        )
                        0
                        slice
                        |> Debug.log "d"
            in
            x :: a
        )
        []
        (List.indexedMap Tuple.pair numbers)
        |> List.filter (\a -> a > 0)
        |> Debug.log "e"
        |> List.product
