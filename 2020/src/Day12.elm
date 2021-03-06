module Day12 exposing (..)


puzzleInput : String
puzzleInput =
    "F70\nS4\nE3\nS4\nL90\nN4\nR90\nW3\nF75\nS5\nL90\nE1\nS4\nF98\nN4\nR90\nS3\nL90\nW1\nF39\nW2\nL90\nE1\nF99\nS3\nE5\nF63\nN4\nF26\nE1\nR180\nF58\nN3\nF4\nE1\nF45\nE4\nR90\nE3\nF76\nS1\nF22\nR90\nN1\nW1\nF76\nW1\nN5\nE3\nL180\nS5\nF87\nW4\nL90\nF9\nS2\nF11\nN4\nL180\nS3\nR90\nF92\nL90\nS1\nE4\nR90\nW1\nF1\nS2\nL90\nF27\nN3\nE1\nN1\nE3\nL180\nS1\nS5\nR180\nW5\nW5\nF60\nS5\nW5\nL270\nN3\nR90\nF65\nS5\nF53\nW5\nL90\nN1\nW5\nL180\nF87\nW2\nR180\nS2\nF77\nN1\nF81\nL180\nE5\nN5\nW4\nL90\nW4\nL90\nE3\nN2\nL90\nW2\nS1\nF19\nW1\nF82\nN4\nR270\nE5\nL90\nN3\nR90\nF81\nL270\nW3\nR90\nL270\nN3\nF53\nE2\nF84\nR90\nS2\nF39\nR180\nN1\nL90\nF11\nS2\nW5\nF20\nW1\nN4\nR90\nF76\nE3\nS5\nE3\nS5\nW5\nS2\nL90\nN3\nE3\nS5\nF27\nW1\nL90\nF65\nW3\nR180\nF84\nW2\nN5\nF43\nL180\nW3\nF11\nW2\nR90\nN1\nR90\nN5\nW1\nS4\nN4\nF88\nN3\nF87\nW3\nL90\nF77\nS5\nF18\nN4\nF97\nE5\nS5\nR90\nF94\nN5\nL180\nF8\nN4\nR90\nW2\nN2\nL180\nF4\nR90\nW4\nS3\nR90\nF38\nS3\nE1\nN5\nF4\nE3\nR90\nS4\nF95\nE5\nF77\nF32\nW5\nF3\nR90\nN1\nW3\nF96\nL270\nN2\nE2\nF30\nS3\nW2\nR90\nF57\nR90\nE1\nR90\nN5\nE1\nN4\nW4\nN1\nW2\nF47\nN5\nW3\nL90\nN4\nF50\nE3\nR90\nF27\nN3\nF78\nN2\nR90\nF100\nS3\nF67\nR90\nN4\nR90\nN4\nF88\nS4\nE2\nS2\nF31\nS5\nR90\nW3\nR180\nW2\nF97\nF31\nN1\nL90\nS4\nF50\nN3\nW2\nL180\nF85\nL180\nE3\nL90\nF95\nN4\nL90\nE1\nS2\nR180\nN2\nF19\nN5\nE5\nS1\nW5\nR90\nN1\nL180\nF76\nS4\nE5\nS2\nS5\nE3\nF53\nL90\nS3\nE4\nS1\nE1\nL90\nF54\nW1\nS1\nE2\nN1\nR90\nS3\nR90\nF63\nL90\nW4\nL90\nF47\nL90\nE5\nF23\nW2\nF97\nE3\nL90\nN4\nF54\nW3\nS4\nW3\nS2\nF67\nW1\nS4\nR90\nS5\nR90\nW4\nL180\nL90\nS4\nF19\nF42\nS4\nF91\nR90\nL180\nF64\nL180\nW4\nR90\nF32\nN3\nF18\nE2\nL180\nN4\nE2\nN1\nE4\nN4\nF54\nW5\nF50\nN3\nL90\nN5\nR90\nF100\nE4\nN1\nE3\nL90\nF8\nL90\nE4\nL270\nF95\nL90\nF44\nE5\nR90\nF79\nN5\nF61\nS2\nF71\nL90\nF4\nN3\nF25\nL180\nF7\nW4\nF96\nR90\nS1\nR90\nW1\nF9\nN2\nW5\nF1\nR90\nN2\nF36\nW4\nR90\nF96\nW2\nF26\nS2\nF28\nE4\nN1\nF33\nN5\nF51\nW2\nS1\nF40\nN3\nF67\nE3\nS2\nR90\nW1\nS3\nE3\nL90\nF75\nE3\nN5\nE2\nF52\nE3\nF7\nN4\nF4\nS4\nL90\nS2\nW5\nF85\nF7\nL180\nE1\nL90\nE2\nS3\nR180\nN3\nE2\nR90\nN5\nF6\nN2\nL90\nW1\nR90\nR90\nF91\nE2\nN4\nR90\nS2\nE3\nS3\nL90\nW3\nF61\nS1\nL90\nW3\nN2\nE1\nR180\nE2\nW5\nR90\nF65\nN4\nW3\nF54\nE1\nN3\nE5\nL180\nS4\nN3\nE5\nR90\nS3\nR90\nS4\nW4\nF31\nS5\nR90\nN2\nE3\nF49\nF47\nW3\nF79\nR270\nW2\nF90\nS3\nF73\nL180\nF14\nW4\nF27\nR90\nF75\nL90\nN5\nR90\nN4\nL90\nN4\nE2\nS1\nW1\nS4\nW5\nW1\nF7\nW5\nL180\nE1\nS1\nF82\nF36\nN2\nL90\nE1\nL90\nS4\nL180\nN2\nW3\nF21\nR270\nF18\nR180\nF93\nL90\nW2\nF4\nE1\nR90\nE2\nS3\nW4\nF30\nE1\nF69\nW5\nR90\nE2\nL180\nS4\nW1\nN1\nE3\nL90\nE3\nR90\nF69\nR90\nS2\nL90\nN4\nF13\nL90\nE2\nL90\nN2\nW2\nN5\nS4\nF70\nR90\nF67\nE4\nF62\nL270\nF98\nL90\nE5\nF15\nE5\nR90\nW3\nE2\nF25\nR180\nF7\nL180\nW4\nS3\nF42\nR180\nR270\nN1\nR180\nS2\nF37\nE2\nF72\nN5\nW5\nF61\nF43\nW3\nR90\nR270\nN5\nR270\nE4\nL90\nW4\nF31\nF43\nL180\nS3\nW4\nR90\nF20\nE2\nS5\nL90\nF75\nR90\nF52\nW3\nL90\nN5\nW5\nN4\nR90\nF52\nW3\nF91\nE1\nN2\nF81\nR90\nE2\nL90\nF24\nE2\nL180\nE1\nF55\nE1\nL90\nE5\nR90\nF23\nS3\nR180\nS3\nF8\nL180\nS1\nN3\nF90\nN5\nW3\nN4\nL90\nN3\nW5\nR90\nE4\nS4\nF89\nW3\nN2\nR90\nF18\nR180\nW5\nE4\nF100\nN4\nF40\nE3\nS2\nE2\nF16\nR90\nS2\nL180\nF58\nW1\nF70\nS1\nR90\nW3\nL90\nS4\nF48\nR90\nW1\nN5\nE3\nR90\nE1\nL90\nF1\nR90\nN1\nE3\nF39\nW3\nR90\nE3\nL90\nN5\nR90\nS3\nW4\nR180\nE1\nS3\nF56\nL90\nF98\nN2\nW4\nF67\nR90\nW3\nS1\nF33\nR90\nF42\nL90\nR90\nE4\nR90\nE3\nF74\nE4\nR270\nF62\nS5\nL90\nE4\nF21"


type alias Instruction =
    ( String, Int )


type alias Point =
    ( Int, Int )


parsePuzzleInput : String -> List Instruction
parsePuzzleInput str =
    String.split "\n" str
        |> List.map
            (\a ->
                let
                    x =
                        String.left 1 a

                    y =
                        String.dropLeft 1 a |> String.toInt |> Maybe.withDefault 0
                in
                ( x, y )
            )


convertCardinalToDirection : Int -> String
convertCardinalToDirection number =
    case number of
        0 ->
            "E"

        1 ->
            "S"

        2 ->
            "W"

        3 ->
            "N"

        _ ->
            ""


move : Instruction -> Point -> Int -> Point
move nextInstruction currentPoint currentDirection =
    let
        ( a, b ) =
            nextInstruction

        ( x, y ) =
            currentPoint
    in
    case a of
        "F" ->
            move ( convertCardinalToDirection currentDirection, b ) ( x, y ) currentDirection

        "N" ->
            ( x, y + b )

        "S" ->
            ( x, y - b )

        "E" ->
            ( x + b, y )

        "W" ->
            ( x - b, y )

        _ ->
            currentPoint


calculateManhattanDistance : Point -> Point -> Int
calculateManhattanDistance ( x0, y0 ) ( x1, y1 ) =
    Basics.abs (x1 - x0) + Basics.abs (y1 - y0)


changeDirection : String -> Int -> Int -> Int
changeDirection direction number current =
    case direction of
        "R" ->
            Basics.modBy 4 (current + (number // 90) + 4)

        "L" ->
            Basics.modBy 4 (current - (number // 90) + 4)

        _ ->
            current


getAnswerPart1 : String -> Int
getAnswerPart1 puzzle =
    parsePuzzleInput puzzle
        |> List.foldl
            (\( a, b ) state ->
                case a of
                    "R" ->
                        { state | direction = changeDirection a b state.direction }

                    "L" ->
                        { state | direction = changeDirection a b state.direction }

                    _ ->
                        let
                            current =
                                move ( a, b ) state.current state.direction
                        in
                        { state | current = current, points = List.append state.points [ current ] }
            )
            { direction = 0, current = ( 0, 0 ), points = [] }
        |> (\{ current } -> calculateManhattanDistance ( 0, 0 ) current)
