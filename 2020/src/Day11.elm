module Day11 exposing (..)

import Array exposing (Array)
import List
import Maybe
import Set


puzzleInput : String
puzzleInput =
    "LLLLLL.LLLLLL.LLLLL.LLLLLLLLLLLLLLL.LLLLLLL.LLLLL.L.LLLLLLL.LLLLLLLLLLLLLL.LLL.L.L.LLLLLLLLL.LLLLL\nLLLLLL.LLLLLL.LLLLLLLLLLLLLLL.LLLLL.LLLLLLL.LLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLL.LLLLLLLLLL..LLLLL\nLLLLLLLLLLLLL.L.LLL.LLLLLLLL.LLLLLLLLLLLLLL.LLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLL.LLLLL.LLLLL.LLLLL\nLLLLLL.LLLLLLLLLLLL.LLLLLLLL.L.LLLL.LLLLLLLLLLLLL.LLLL.LLLLL.LL.LLLLL.LLLLLLLLLL.LLLLL.LLLLLL.LLLL\nLLLLLL...LLLLLLLLLLLLLLLLLLL.LLLLLL.LLLLLLL.LLLLL.LLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLL.LLLLL.LLLLL\nLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLLLLLLLLLLLL.LLLL.LLLL.LLLLLL.LLLLLLLLLLLLLLLLLLL.LLLLL.LLLLL.L.LLL\nLLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLLLLL..LLLL.LLLL.LLLLL.LLLLLLLL.LLLLLL.LLL.LLLLLLLLLLLLLLLLL\nLLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLLLL..LLLL.LLLLL.LLLLL.L.LLLLLLLLL\nLLLLL..LLLLLL.LLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLL.LLLL.LLLLLLLLLLLLLL.LLLL.LLLLLLLLL.L.LLLLL.LLLLL\nLLLLLL.LLLLLL.LLLLL.LLLLLLLL.LLLLLL.LLLLLLL.LLLLL.LLLL.LLLLLLLLLLLLLLLLLLL.LLL...LLLLL.LLLLLLLLLLL\n...L...L....LL...LL.........L...LL.L...LLLL......LLLLLL.L.L.....L....L.LL.L.L.L.L...L.L..L.....L..\nLLLLLL.LLLLLL.LLLLL.LLLLLLLL.LL.LLL.LLLLLLLLLLLLL.LL.L.LLLLLLLLLLLLLL.LL.LLLLL.LLLLLLLLLLLLLLLLLLL\nLLLL.LLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLL.LLL.L.LLLL..LLLL.LLLLL.LLLLLLL.LLLLLLLLLLL.LLLLL.LLLLL\nLLLL.LLLLLL.L.LLLLL.LLLLLLLLLLLLLLL.L.LLLLL.LLLLL.L.LL.LLLLL.LLLLLLLL.LLLLLLLLLL.LLLLL.LLLLL.LLLLL\nLLLLLL.LLLLLLLLLLLL.LLLLLLLLLL.LLLLLLLLLLLL.LLLLL.LLLLLLLLLL.LLLLLLLL.LLLL.LLLLLLLLLLLLLLLLLLLLLLL\nLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLL.LLL.LLLLLLLLL.LLLLLLLLLLLLLLLLLLL.LLLL.L.LLLLLLLLLLL.LLLLL.LLL\nLLLLLLLLLLLLL.LLLL..LLLLLLLL.LLLLLLLLLLLLLL.LLLLL.LLLL.LLLLL.LLLLLLLL.LLLL.LLLL.LLLLLL.LLLLL.LLLLL\nLLLLLLLLLLLLL.LLLLL..LLLLLL..LLLLLL.LLLLLLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLL\n......L...LL.....LL..L.L...L...L..L.L.L.....L.LL..LLL.....L........L..........LL.........LLLL.....\nLL.LLLLLLLLL.LLLLLL.LLLLLLLL.LLLLLL.LLLLLLL.LLLLL.LLLL.LLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLLLLL.LLLLL\n.L.LLL.LLLLLL.LLLLL.LLLLLLLLLLLLLLL.LLLLLLL.LLLLL.LLLL.LLLLL.LL.LLLLLLLLLL.LLL.LLLLLLLLLLLLL.LLLLL\nLLLLLL..LLLLLLLLLLL.LLLLLLLL..LLLLLLL.LLLLL.LLLLLL.LLLLLLL.L.LLLLLLLL.LLLLLLLLLL.LLLLLLLLLLLL.LLLL\nLLLLLL.LLLLLL.LLLLL.LLLLLLLL.LLLLLL.LLLLLLL.LLLLL..LLL.LLLLL.LLLLLLLL.LLLL.LLLLL.LLLLL.LLLLLLLLLLL\n.L....L....L.L.LLLLL..L....L......L....LL.LLL.L.LL....LL..........L....L.L...LLLL.L..LLL.LL.L.....\nLLLLLL.LLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLL..LL.LLLLL.LLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLL.LL.LL.LLLLL\nLL.LLL.LLLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLLL.LLLL..LLLL.LLLLL.LL.LLLLL.LL.LLLLLLL.LLLLL.LLL.LLLLLLL\nLLL.LLLLLLLLL.LLLLL.LLLLLLLL.LLLLLL.LL.L.LLLLLLLL.LLLL.LLLLLLLLLLLLLL.LLLLLLLL.L.LLLLL.LLLLLLLLLLL\nLLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLL.LLLLL.LLL..LLLLLLLLLLLLLL..LLL.LLLLL.LLLLLLLLLLL.LLLLL\n...L.....LL.L..LL..L.LLL..LL...L.LL..L....LL.....L.L.L.LL....L.L.L.......L....L.....L........LLL..\nLLLLLL.LLLLLL.LLLLL.LLLLLLLLLLLLLLL.LLLLLLL.LLLLL.LLLL.LLLLLLLLLLLLLLLLLLL.LLLLL.LLLLL.LLLLLL.LLLL\nLLLLLL.LL.LLLLL.L.LLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLL.L.LLLLLL.LL.LLLLL\nLLLLLL.LLLLLL.LLLLL.LLLLLLLLLLLLLLL.LLLLLL..LLLLL.LLLL.L.LLL.LLLLLLLL.LLLL.LLLLL.LLLLLLLLLLL.L.LLL\nLLLLLL.LLLLLLLLLLLL.LLLLLLLL.LLLL.LLLLLLLLL.LLL.LL.LLL.LLLLL..LLLLLLL.LLLL.LLLLL.LLLLLLLLLL..LLLLL\nLLLLLL.LLLLLL..LLLLLLLLLLLLL.LLLLLL.LLLLLLL.LLLLL.LLLL.LLLLL.L.LLLLLL.LLLLLLLLLL.LLLLL.LLLLL.LLL.L\nLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLL.LLLLL.LLLLLLLL.LLLL.LLLLL.LLLLL.LLLLLLLLLLL\nLLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLL.LLLLLLLLLL.LLLLLLLL.LL.L.LLLLLLLLLLLLLLLLLLL.LLL\nL.LL..LL....L.L......L...LLL......LL.L.....L.L.LL.L...L..L....L.LLL..LLL..L.L.L..LL...L.LL..LL....\nLLLLLL.LLLLLLL.L.LL.LLLLLLLLLLLLLLL.LLLLLLL..LLLL.LLLL.LLL.L.LLLLLLLLLLLLL.LLLLL.LLLL.LLLLLL.LL.LL\nLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL.LLL.LLLLLLLLLL.LLLL.LLLLL.L.LLL.LL.LLLL.LLL.LLLLLLLLLLLLL.LLLLL\nLLLLLLLLLLLLLLLLLLL.LLL.LLLLL.LLLLL.L.L.LLLLLLLLL.LLLL.LLLLL.LLLLLLLLLLLLL.LLLLL.LLLLL.LLLLL.LLLLL\nL.LLLL.LLLLLL.LLLLLLL.LLLLLL.LL.LLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLL...LLL.LLLL..LLLLLLLLLLL.LLLLL\nLLLLLL.LLLLLL.LLL.L.LLLLLLLLLLLLLLLLLLLLLLL.LLLLL.LLLL.L.LLL.LLLLLLLL.LLLL.LLLLL.LLLL..LLLLLLLLLLL\nLLLLLL.LLLLLLLLLLLL.LLLLLLLL.L.LLLL..LLLLLLLLLLLL.LLLLLLLLLL.LLLLLLLLLL.LLLLLLLL.LLLLL.LLLLL.LLLLL\n..L..LL....L.....L..L.LL.L..L.................L....L.....L....L..L...L..L....L...LL...LLL..LL.....\nLLLLLL.LLLLLLLLLLLL.LLLLLLLL.LLLLLL.LLLLLLLLLLLLL.LLLL.LLLLLLLLL.LLLLLL..L.LLLLL.LLL.L.LLLLL.LLLLL\nLLLLLL.LLLLLL.L.LLLLLLLLLLLLLLLL.LL..LLLLLL.LLLLL.LLLL.LLLLL.LLLLLLLL.LLLL.LLLLL.LLLLLLLLLLLLLLLLL\nLLLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLL.LLLLLLLLLLLLL.LLLL.LLLLL.LLLLLLLL..LLL.LLLLL.LL.LL.LLLLL.LLLLL\nLLLLLL.LLLLLL..LLLLLLLLLLLLLLLLLLLL.LLLLLLL.LLL.L.LLLLLLLLLLLLLLLLL.LLLLLL.LLLL.LLLLLL.LLLLL.LLLLL\nLLLLLL.LLLLLL.LLLLLLLLLLLLLL.LLLLLL.LLLLLLL.LLLLLLLLLLLLLLLL.LLLLLLLLLLLLL.LLLLL.LLLLL.LL.LLLLLLLL\nL.L...L..LL.L....LL...L..L.L.LL...L..L..L..L...L.LL.LL......L.L..L.L...LL.....L........LL...L.....\nLLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLL.LLLLLLL.LLLLL.LLLLLLLLL..LLLLLLLL.LLLL.LLLLLLLLLLLLLLLLL.LLLLL\nLLLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLL.LLLL.LLLLL.LLLLL.LLLLLLLLLLL\nLLLLLL.LLLLLL.LLLLL.LLLLLLLLLLLLLLL.LLLLLLL.LLLLL.LLLL.LLLLL.LLLLLLLL.LLLL.LLLLLLLLLLL.LLLLL.LLLL.\nLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLL.LLLLL.LLLLLLL.LLLLLLLLLLL.LLLLLLLLLLL.LLLLL\nLLLLLL.LLLLLLLLLLLL.LLLLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLLLLL..LLLLLLLLLLL.LLLLLLL.LLL.LLLLL.LLLLL\nL.LLLL.LLLLLL.L.LLLLLLLLLLLL.LLLLLL.LLLLLLLLLLLLL.LLL.LLLL.LLLLLLLLLL.LLLLLLLLLL.LLLLLLLLLLL.LLLLL\n...L..L.L...LL.....LL......L...L.....L.L......L..LLL.....L..LL....LLL...L..LL..LL.L.L.L.L..L...L.L\n.LLLLL.LLLLLL.LLLLL..LLLLLLL.LLLLLLLL.LLLL..LLLLL.LL.L.LLLLL.LLL.LLLLLLLLL.LLLLLLLLLLLLLLLLL.LLL.L\nLLLLLLLLLLLLL.LL.LL.LLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLL.LLLLL.LLLLLLLLLLL..LLLL\nLLLL.LLLLLL.LLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLL.LLLL..LLLL.LLLLLLLL.LLL...LLLL.LLLLL.LLLLLLLLLLL\nLLL.LLLLLLLLL.LL.LL.LLLLLLLLLLLLLLL.LLLLLLL.LLLLLLLLLLL.L.LL.LLLLLLLLLLLLL.LLLLL.LLLLL.LLLLL.LLLLL\nLLLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLL.LLLLLLLLLLLLL.LLLL.LLLLLLLLL.LLLLLLL.L.LLLLL.LLL.L.LLLLL.L.LLL\n..L......LL.........L.L...L.....L.L...LLL.L.....L....L.L...L.L.L.L..L.....L..L...L..L.....L.L...L.\nLLLLLL.LLLLLL.LLLLL.LLLL.LLLL.LLLLL.LLLLLLL.LLLLL.LLLL.LLLLL.LLLLLLLL.LLLLLLL.LL.LLLLLLLLLLL.LLLLL\n.LLLLLLLLL.LL.L.LLL.LLLLLLLLLLLLLLL.LLLLLLLLLL.LLLLLLL.LLLLLLLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLLLLLL\nLLLLLL.LLLLLLLLLLLLLL.LLLLLL.LL.LLLL.LLLLLL.LLLLLLLLL..LLLLL.LLLLLLLL.LLLLLLLLLLLLLLLL.LLLLL.LLLLL\nLLLLL..LLLLLL.LLLLL.LLLLLLLLLLLLL.L.LLLLLLL.LLLLLLLLLL.LLLLL.LLLLLLLL.LLLL.LLLLL.LLLLLLLLLLL.LLLLL\nLLLLLL.LLLLLL.LLLLL.LLLLLLLL.LLLLLL.LLLLLLLLLLLLLLLLL..LLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL.LLL.LLLLLLL\nLLLLLL.LLLLLL..LLLL.LLLLLLL..L.LLLLLLLLLLLL.LL.LL.LLLL.LLLLL.LLLLLLLL.LLLLLLLLLL.L.LLL.LLL.L.LLLLL\nLLLLLL.LLLLLL.LLLLL.LLLLLLLL.LLLLL..LLLLLLL.LLLL.LLLLL.LLLLLLLLLLLLLL.LLLL.LLLLL.LLLLL.LLLLL.LLLLL\nLLLLLL.L.LLLL.LLLLL.LLL.LLL..LLLLLL.LLLLLLL.LLLLL.LLLL.LLLLL.L.LLLLLLLLLLL.LLLLLL.LLLL.LLLLL.LLLLL\n.......L......LLL.....L....LL..L....L.L..L..L.L..L.L.....L...L..........L.....L.L.....L.L..LLL.L..\nLLLLLL.LLLLLL..LLLL.LLLLLLLL.LLLLLL.LLLLLLLLLLLLLLLLLL.LL.LL.LLLLLLLL.LLLLLLLLLLLLLLLL.LLLLL.LLLLL\nLLLLLL.LLLLLL.LLLLL.L.LLLLLL.LLLLLL.LLL.LLL.LLLLL.LLLL.LLL.LLLLLLLLLLLLL.L.LL.LL.LLLLLL.LLLL.LL.LL\nLLLLLL.LLL.LLLL.LLL.LL.LLLLL.LL.LLLLLLLLLLLLLLLLL.L.LL.LLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLL.LLLLLLLLL\nLLL.LL.LLLLLLLLLLLL.LLLLLLLL.LLLL.LLLLLLLLL.LLLLLLLLLL.LLLLLLLLLLL.LLLLLLL.LLLLL..LLL..LLLLL.LLLLL\nLLLLLL..LLLLLLLLLLL.LLLLLLLL.LLLLLL.LLLL.LLLLLLL..LLLL.LLLLL.LLLLLLLL..LLL.LLLLLLLLLLL.LL.LL.LLLLL\nLLLLLLLLLLLLL.LLLLLLLLLLLLLL.LLLLLL.LLLLLLL.LLLLL.LL.LLLLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLLLLLL\nLLLLLLLLLLLLLLLLLLL.LLLLLL.L.LLLLLL.LLLLLLL.LLLLLL.L.L.LLLLL.LLLLLL.L.LLLLLLLLLL.LLLLL.LLLLL.LLLLL\n.LLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLL.LLLL..LLLL.LLLLL.LLLLLLLL.LLLL.LLLLLLLLLLL.LLLLLLLLLLL\nLLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLL.LLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLL.LLLLL.LLLLL.LLLLLLLLLLL\n.L.LL....L..L...L.LLL.......L.LL.LL.L.L.L........LL..LL..L.......LL.L.LL...LLL.....L...L...L....L.\nLLLLLL.LLLLLL.LLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLL.LLLLLLLL.LLLLLLLLLL.LLLLLLLLLLL.LLLLL\nLLLLLL.LLLLLLLLLLLL.LLLLLLLLLLLLLLL.LLLLLLL.LLLLL.L.LL.LLLLLLLLLLLLLL..LLL.LLLLL.LLL.L.LLLLLLLLLL.\nLLLLLL.LL.LLL.LLLLL.LLLLLLLL.LLLLLLLLLLLLLL..LLLL.LLLL.LLLLL.LLLLLLLL..LLLLLLLL.LLLLL..LLLLL.LLL.L\n.LLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLL.LLLLLLL..LLLLLLLLL.LLLLLLLLLLLLLL.LLLL..LLLLLLLLLL.LLLLL.LLLLL\nLLLLLLLLLLLLL.LLLLL.LLLLLL.LLLLLLLL.LLLLL.LLLLLLL.LLLL.LLLLLLLLLLLLLL.LLLLLLLLLLLLL.LL.LLLLL.LLLLL\nLLLLLLLLLLLLL.LLLLL.LLLLLLLLLL.LLLL.LLLLLLL.LLLLL.LLLL.LLLLL.LLLLLLLL.LLLL.LLLLLLLLLLL..LLLL.LLLLL\nLLLLLL.LLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLL.LLLL.LLLLL.LLLLLLLLL.LLLLLLLLL.LLLLLLLLLLL.LLLLL\nL........L........L.L.L...L........L..............L....L..L....L...L..L.LL.L..L.....L....LL..LL..L\nLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLL.LLLLLLLLLLLLL.LL.L.LLLLL.LLLLLLLLLLLLL.LLLLLLLLLLL.LLLLL.LLLLL\nLLLLLLL.LLLLL.LLLLLLLLLLL..L.LL.LLLLLLLLLLLLLLLLLLLLLLLLL.LL.L.LLLLLL.L.LL.LLLLLLLLLLLLLLLLLLLLLLL\n.LLLLL.LLLLL..LLLLL.LLLLLLLL.LLLLLL.LL.LLLL..LLL..LLLL.LLLLL.LLLLLLLL.LLLLLLLLLL.LLLLL.LLLLL.LLLLL\nLLLLLL.LLLLLLL.LLLL.LLLLLLLL.LLLLLLLLLL.LLL.LLL.LL.LLL.LLLL.LLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLL\nLL.LL..LLLLLLLLLLLLLLLLLLLLL.LLLLLL.LLLL.LL.LLLLL.LLLL.L.LLL.LLLLLLLLLLLLL.LLLLL.LLLLL.LLLLL.LL.LL\nLLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLL.LLLLLLL.LLLLL.LLLLLLLLLLLLLLLLLLL.LLL.LLLLLL.LLLLL.LLLLLLLLLLL\nLLLLLL.LLLLLLLLLLLL..LLLLLLL.LLLLLL..LLLLLL.LLLLLLLLLLLLLLLL.LLLLLLLLLLLLL.LLL.L.LLLLL.LLLLLLLLLLL"


type alias FloorMap =
    Array ( Int, Array ( Int, String ) )


parsePuzzleInput : String -> FloorMap
parsePuzzleInput str =
    String.split "\n" str
        |> List.map (\a -> String.split "" a |> List.indexedMap Tuple.pair |> Array.fromList)
        |> List.indexedMap Tuple.pair
        |> Array.fromList


getFromMap : Int -> Int -> FloorMap -> String
getFromMap rowPos columnPos map =
    case Array.get rowPos map of
        Just ( _, row ) ->
            case Array.get columnPos row of
                Just ( _, value ) ->
                    value

                Nothing ->
                    "!"

        Nothing ->
            "!"


getAdjacentSeats : Int -> Int -> FloorMap -> List String
getAdjacentSeats row column map =
    let
        up =
            getFromMap (row - 1) column map

        down =
            getFromMap (row + 1) column map

        left =
            getFromMap row (column - 1) map

        right =
            getFromMap row (column + 1) map

        diagonalUpLeft =
            getFromMap (row - 1) (column - 1) map

        diagonalUpRight =
            getFromMap (row - 1) (column + 1) map

        diagonalDownLeft =
            getFromMap (row + 1) (column - 1) map

        diagonalDownRight =
            getFromMap (row + 1) (column + 1) map
    in
    List.filter (\a -> a /= "!") [ up, down, left, right, diagonalUpLeft, diagonalUpRight, diagonalDownLeft, diagonalDownRight ]


iteratePositionsUntil : List ( Int, Int ) -> FloorMap -> String
iteratePositionsUntil positions map =
    case positions of
        [] ->
            "!"

        _ ->
            case List.head positions of
                Just ( row, column ) ->
                    case getFromMap row column map of
                        "L" ->
                            "L"

                        "#" ->
                            "#"

                        "." ->
                            iteratePositionsUntil (List.drop 1 positions) map

                        _ ->
                            "!"

                Nothing ->
                    "!"


findNextSeatInSight : Int -> Int -> FloorMap -> String -> String
findNextSeatInSight row column map direction =
    let
        width =
            Array.get 0 map |> Maybe.withDefault ( 0, Array.empty ) |> (\( x, y ) -> Array.length y - 1)

        height =
            Array.length map - 1

        positions =
            case direction of
                "left" ->
                    List.range 0 (column - 1) |> List.reverse |> List.map (\a -> ( row, a ))

                "right" ->
                    List.range (column + 1) width |> List.map (\a -> ( row, a ))

                "up" ->
                    List.range 0 (row - 1) |> List.reverse |> List.map (\a -> ( a, column ))

                "down" ->
                    List.range (row + 1) height |> List.map (\a -> ( a, column ))

                "diagonalUpLeft" ->
                    List.range 0 (row - 1) |> List.reverse |> List.map (\a -> ( a, column - (row - a) ))

                "diagonalUpRight" ->
                    List.range 0 (row - 1) |> List.reverse |> List.map (\a -> ( a, column - (a - row) ))

                "diagonalDownLeft" ->
                    List.range (row + 1) height |> List.map (\a -> ( a, column + (row - a) ))

                "diagonalDownRight" ->
                    List.range (row + 1) height |> List.map (\a -> ( a, column + (a - row) ))

                _ ->
                    []
    in
    iteratePositionsUntil positions map


getAdjacentSeatsInSight : Int -> Int -> FloorMap -> List String
getAdjacentSeatsInSight row column map =
    let
        up =
            ( getFromMap (row - 1) column map, ( row - 1, column ), "up" )

        down =
            ( getFromMap (row + 1) column map, ( row + 1, column ), "down" )

        left =
            ( getFromMap row (column - 1) map, ( row, column - 1 ), "left" )

        right =
            ( getFromMap row (column + 1) map, ( row, column + 1 ), "right" )

        diagonalUpLeft =
            ( getFromMap (row - 1) (column - 1) map, ( row - 1, column - 1 ), "diagonalUpLeft" )

        diagonalUpRight =
            ( getFromMap (row - 1) (column + 1) map, ( row - 1, column + 1 ), "diagonalUpRight" )

        diagonalDownLeft =
            ( getFromMap (row + 1) (column - 1) map, ( row + 1, column - 1 ), "diagonalDownLeft" )

        diagonalDownRight =
            ( getFromMap (row + 1) (column + 1) map, ( row + 1, column + 1 ), "diagonalDownRight" )
    in
    List.map
        (\( a, ( x, y ), direction ) ->
            case a of
                "." ->
                    findNextSeatInSight row column map direction

                _ ->
                    a
        )
        [ up, down, left, right, diagonalUpLeft, diagonalUpRight, diagonalDownLeft, diagonalDownRight ]
        |> List.filter (\a -> a /= "!")


applyRules : FloorMap -> FloorMap
applyRules map =
    Array.map
        (\( row, rows ) ->
            ( row
            , Array.map
                (\( column, columnValue ) ->
                    let
                        adjacentSeats =
                            getAdjacentSeats row column map

                        occupiedAdjacentSeats =
                            List.filter (\a -> a == "#") adjacentSeats
                    in
                    if columnValue == "L" && List.length occupiedAdjacentSeats == 0 then
                        ( column, "#" )

                    else if columnValue == "#" && List.length occupiedAdjacentSeats >= 4 then
                        ( column, "L" )

                    else
                        ( column, columnValue )
                )
                rows
            )
        )
        map


applyRulesV2 : FloorMap -> FloorMap
applyRulesV2 map =
    Array.map
        (\( row, rows ) ->
            ( row
            , Array.map
                (\( column, columnValue ) ->
                    let
                        adjacentSeats =
                            getAdjacentSeatsInSight row column map

                        occupiedAdjacentSeats =
                            List.filter (\a -> a == "#") adjacentSeats
                    in
                    if columnValue == "L" && List.length occupiedAdjacentSeats == 0 then
                        ( column, "#" )

                    else if columnValue == "#" && List.length occupiedAdjacentSeats >= 5 then
                        ( column, "L" )

                    else
                        ( column, columnValue )
                )
                rows
            )
        )
        map


iterateUntil : List Int -> (FloorMap -> FloorMap) -> FloorMap -> Int
iterateUntil history applyRulesFn map =
    case List.length history >= 2 of
        True ->
            let
                value1 =
                    List.take 1 history

                value2 =
                    List.drop 1 history |> List.take 1
            in
            case value1 == value2 of
                True ->
                    List.head value1 |> Maybe.withDefault 0

                False ->
                    let
                        newMap =
                            applyRulesFn map
                    in
                    iterateUntil (countOccupiedSeats newMap :: history) applyRulesFn newMap

        False ->
            let
                newMap =
                    applyRulesFn map
            in
            iterateUntil (countOccupiedSeats newMap :: history) applyRulesFn newMap


countOccupiedSeats : FloorMap -> Int
countOccupiedSeats map =
    Array.foldl
        (\( _, row ) count ->
            count
                + Array.foldl
                    (\( _, value ) rowCount ->
                        case value == "#" of
                            True ->
                                rowCount + 1

                            False ->
                                rowCount
                    )
                    0
                    row
        )
        0
        map


getAnswerPart1 : String -> Int
getAnswerPart1 puzzle =
    parsePuzzleInput puzzle
        |> iterateUntil [] applyRules


getAnswerPart2 : String -> Int
getAnswerPart2 puzzle =
    parsePuzzleInput puzzle
        |> iterateUntil [] applyRulesV2
