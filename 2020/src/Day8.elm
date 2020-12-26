module Day8 exposing (..)

import Array exposing (Array)


type alias Instruction =
    { op : String, direction : String, value : Int }


puzzleInput : String
puzzleInput =
    "nop +355\nacc +46\njmp +42\njmp +585\nacc +11\nacc +0\nacc +40\njmp +284\nacc -2\nnop +276\njmp +613\nacc +23\nacc +2\nacc +14\nacc +25\njmp +310\nacc +43\nacc +43\njmp +510\njmp +116\njmp +204\nnop +213\nacc +47\njmp +1\nacc +8\njmp +461\njmp -22\nacc +36\nacc +33\nacc +45\njmp +175\nacc +21\njmp +472\nacc +50\nacc +40\njmp +525\nacc +26\nnop +208\njmp +496\njmp +153\nacc +50\nacc +24\nnop +512\njmp +242\nacc +7\nnop +317\nacc +50\nacc +7\njmp +268\nacc +8\nacc -19\nacc -11\njmp +1\njmp +383\nacc +1\njmp +230\nacc +5\njmp +128\nnop +227\nacc -7\njmp -16\nacc +11\nacc -6\njmp -42\nacc +11\nacc +23\njmp +7\njmp -23\njmp +11\nacc +0\nnop +246\nacc +24\njmp +213\njmp +550\nacc +24\nacc +14\nacc +34\nacc -6\njmp +525\nacc +4\nnop +220\njmp +399\nacc +41\njmp +34\nacc -2\nacc +38\nacc +48\nacc -7\njmp +136\nacc -2\nacc +40\nacc +12\nacc -4\njmp +467\nacc +36\nacc +19\nnop +518\njmp +328\nacc +7\nnop +263\nacc +19\nacc -17\njmp +282\njmp +206\nacc +28\nacc +7\njmp +417\nacc -10\njmp -75\nnop +475\nnop +68\nnop -38\nacc +33\njmp +367\nacc +0\njmp +459\njmp +1\nacc +50\njmp +1\nnop -25\njmp +464\nacc +35\njmp -5\nacc -14\njmp -113\nnop +25\nacc +33\nacc +28\nacc +3\njmp -71\nnop +75\nacc +19\nacc +27\njmp +332\njmp +361\nacc -2\nacc +45\nacc +47\njmp +461\njmp -120\nacc +18\nacc +25\nacc +11\njmp +24\njmp +372\nacc +32\nacc +2\njmp +87\nacc +23\njmp +96\nacc +32\nnop +233\nacc -7\njmp +435\njmp +51\nacc -7\njmp +392\nacc +22\nacc -17\nacc +8\nacc +34\njmp -140\nacc +10\nnop +276\njmp -57\nacc -6\njmp +388\nacc +4\njmp +386\njmp +267\njmp +1\nacc +15\nacc -11\nnop -169\njmp +71\nacc +10\nacc +19\njmp +377\nacc -1\njmp +316\nacc +13\nacc -5\nacc +7\nacc +28\njmp -49\nacc +20\nacc +4\nacc -19\njmp +196\nacc -1\nacc -8\njmp +266\nacc +43\nacc +10\nnop +122\njmp +222\nacc +0\njmp +275\nnop +282\njmp +199\nacc +24\nacc +37\nacc -18\nnop -33\njmp -110\nacc -7\nacc -9\nacc +18\njmp -189\nacc -10\nacc +46\njmp +214\nacc +22\nacc +45\njmp +48\nnop +217\nacc -6\nacc +5\njmp -40\njmp +220\nacc +26\nnop +393\njmp +1\njmp +358\njmp +138\nnop -181\nacc +48\njmp +190\nacc +49\njmp +105\njmp -176\njmp +37\nacc +49\njmp -130\nacc +20\nacc +48\njmp +236\nacc +41\nacc +19\nnop +321\njmp -12\nacc +3\nacc +38\njmp +338\njmp -160\nnop +250\nacc +21\njmp +29\nacc +44\nacc +11\nacc -17\nacc +7\njmp +110\nnop +242\nacc +48\nacc +46\njmp -15\nacc -18\nnop -190\nacc +39\nacc -12\njmp +255\nacc -16\nacc -13\nacc +12\nacc +29\njmp +243\njmp -14\nacc +33\nnop +40\nacc -11\njmp +252\nnop +248\nacc -17\nacc +14\njmp +29\nacc -6\nacc +21\nacc +27\nnop +287\njmp +329\nacc -3\nacc +7\nacc +0\njmp +297\nacc +9\njmp -10\nacc +11\nnop +293\nacc -14\njmp +214\nacc -11\nacc +43\nacc +43\nacc +35\njmp +239\nacc +10\nacc -18\nacc +39\njmp -129\nacc +8\njmp +313\nacc +49\njmp +300\nnop +219\nnop +215\njmp -203\nacc -8\njmp +137\nnop +211\nacc -19\nacc -18\nnop -8\njmp +132\nacc -17\njmp -84\nacc +8\nacc +2\nacc -1\njmp -91\nacc -4\nacc +37\njmp +1\nacc +14\njmp -297\nacc -10\nnop -186\nacc -18\njmp -150\nacc +46\nacc +25\nacc +45\nacc -5\njmp +187\nacc +21\njmp +101\nacc +15\nacc -15\njmp +30\nacc +42\nacc +35\njmp +276\njmp -323\njmp -124\nacc +34\nacc -16\nacc -19\njmp -314\nacc +45\njmp -219\nacc +6\nacc -12\nacc +45\nacc +38\njmp +30\nacc +32\nacc +47\nacc +40\nacc +11\njmp -236\nacc +46\njmp -328\nacc -18\nacc +34\nacc -11\njmp +201\nacc +8\njmp +161\nnop +44\nacc +8\njmp +158\nacc +26\njmp +137\nacc +2\nacc -4\nnop -59\njmp +14\nacc +18\njmp -211\nacc +28\njmp -152\nacc -3\nacc +0\njmp -21\nacc -2\njmp -331\nacc +1\nacc +24\nnop -274\njmp -350\njmp +1\nacc +28\nacc -14\nacc +49\njmp -39\nnop +114\nacc +33\njmp +217\nacc +0\nacc +25\njmp +1\nacc +33\njmp +50\nacc +23\nacc +0\nacc -14\njmp +66\njmp -68\njmp +1\nacc +0\nacc +10\njmp -244\njmp -200\njmp +1\nacc -2\nacc +34\njmp -48\nnop +192\nacc +34\nacc -1\nacc +6\njmp -48\nacc +4\nacc +13\njmp -405\nacc +36\nnop -372\nacc +20\nacc +32\njmp -231\nacc +14\njmp -83\nacc +22\njmp -375\nacc +21\njmp -356\nacc -1\njmp -398\njmp -104\nacc +48\nnop -382\njmp -296\nacc -15\nacc +29\njmp +159\nacc +41\njmp -215\nacc -6\nacc -1\nacc +44\nacc -14\njmp +72\nacc +2\nacc +6\njmp -106\nacc +39\njmp -301\nacc -12\nacc +43\nacc +24\njmp -53\nnop +19\nacc +17\nacc -12\njmp -211\njmp +1\njmp -98\nacc +18\nacc -6\nnop -153\nnop -376\njmp -377\nnop +109\nacc -10\nacc +6\nacc -13\njmp -359\nacc +35\nnop +125\njmp -312\njmp -23\nacc +8\nacc +27\nnop +105\nacc -16\njmp -112\nacc -9\nacc +13\nacc +1\njmp -421\nnop -471\nacc +41\nacc +10\nacc +26\njmp -110\nacc -8\nacc -17\nacc +32\nacc -3\njmp -329\nacc +0\nacc +2\nacc +2\njmp +114\nacc +44\nacc +7\nacc -8\njmp +33\njmp -310\nnop -14\nacc +32\nacc +21\nacc +42\njmp -509\nacc +4\njmp -29\nnop +12\nnop +74\njmp -491\njmp -307\nacc +12\njmp -217\njmp -254\nnop -3\nacc +33\njmp +101\nacc +17\njmp -4\nnop -361\nacc +20\nacc +0\nacc +37\njmp -120\njmp -178\njmp -306\nacc +31\nacc +16\nacc +12\nnop +61\njmp -466\nacc +38\nacc +40\njmp -323\nacc -1\nnop -112\nnop +46\nnop -221\njmp -111\njmp -248\nacc -2\nnop +53\nacc -12\nnop -382\njmp -514\njmp +1\nacc +30\njmp -177\nacc -18\nacc +34\njmp -297\njmp -446\nnop -33\nacc +8\nacc +19\nacc +22\njmp +16\nacc -17\nnop -194\njmp -541\nacc +50\nacc +15\nnop -347\nacc -9\njmp -433\nacc +32\nnop -571\njmp -482\nacc +42\nnop -287\nnop -263\njmp -368\njmp +10\nacc +39\njmp -204\nacc +28\nacc +35\njmp -565\njmp -464\njmp -84\nacc +25\njmp -532\nacc +42\njmp +1\njmp -154\nacc +4\nacc +8\nacc +4\nacc +48\njmp -82\njmp -256\nacc +33\nacc +49\njmp +1\njmp -539\nacc -1\nacc +46\nacc +49\nacc +13\njmp -20\nacc -11\nacc -15\nacc +1\njmp -96\njmp -483\njmp -444\njmp +1\njmp -382\nacc -5\nacc +5\nacc +26\njmp -458\nacc +24\njmp -515\nnop -211\njmp -64\njmp -246\nacc -17\nacc -7\nacc +0\nacc +21\njmp +1"


puzzleInput1 : String
puzzleInput1 =
    "nop +0\nacc +1\njmp +4\nacc +3\njmp -3\nacc -99\nacc +1\njmp -4\nacc +6"


parsePuzzleInput : String -> Array Instruction
parsePuzzleInput str =
    String.split "\n" str
        |> List.map
            (\a ->
                let
                    splits =
                        String.split " " a |> Array.fromList

                    op =
                        Array.get 0 splits |> Maybe.withDefault ""

                    direction =
                        Array.get 1 splits |> Maybe.withDefault "" |> String.left 1

                    value =
                        Array.get 1 splits |> Maybe.withDefault "" |> String.dropLeft 1 |> String.toInt |> Maybe.withDefault 0
                in
                Instruction op direction value
            )
        |> Array.fromList


runProgramUntilLoop : Int -> Int -> List Int -> Array Instruction -> Int
runProgramUntilLoop next accumulator instructionsRun instructions =
    case List.member next instructionsRun of
        True ->
            accumulator

        False ->
            let
                op =
                    Array.get next instructions
            in
            case op of
                Just instruction ->
                    case instruction.op of
                        "nop" ->
                            runProgramUntilLoop (next + 1) accumulator (next :: instructionsRun) instructions

                        "jmp" ->
                            let
                                next1 =
                                    case instruction.direction of
                                        "-" ->
                                            next - instruction.value

                                        "+" ->
                                            next + instruction.value

                                        _ ->
                                            next
                            in
                            runProgramUntilLoop next1 accumulator (next :: instructionsRun) instructions

                        "acc" ->
                            let
                                updatedState =
                                    case instruction.direction of
                                        "-" ->
                                            accumulator - instruction.value

                                        "+" ->
                                            accumulator + instruction.value

                                        _ ->
                                            accumulator
                            in
                            runProgramUntilLoop (next + 1) updatedState (next :: instructionsRun) instructions

                        _ ->
                            accumulator

                Nothing ->
                    accumulator


getAnswerPart1 : String -> Int
getAnswerPart1 puzzle =
    parsePuzzleInput puzzle
        |> runProgramUntilLoop 0 0 []
