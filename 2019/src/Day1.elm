module Day1 exposing (..)


puzzleInput =
    "124846\n99745\n110203\n140165\n110228\n65706\n128481\n75921\n57331\n72951\n133413\n99524\n79546\n54653\n55166\n66215\n147696\n91054\n64752\n76311\n139572\n61110\n65846\n121489\n147534\n66591\n109963\n83412\n138965\n70102\n128844\n141002\n77655\n68539\n128687\n70559\n140747\n51397\n117550\n91515\n60960\n133280\n83244\n106644\n100333\n67608\n118120\n60024\n115547\n136229\n108403\n128776\n109599\n111189\n98538\n129715\n116630\n120772\n80105\n52489\n130247\n144003\n85226\n83769\n137921\n54737\n126406\n108756\n149633\n138201\n78980\n126909\n125768\n86214\n54873\n97723\n92677\n120405\n143317\n102981\n142668\n100398\n67258\n126583\n114611\n102525\n115205\n78329\n140703\n136978\n94465\n129510\n81039\n141997\n120643\n55377\n89966\n113672\n112665\n51323"


parsePuzzleInput : String -> List Int
parsePuzzleInput str =
    String.split "\n" str
        |> List.map (\a -> Maybe.withDefault 0 (String.toInt a))


calculateFuel : Int -> Int
calculateFuel mass =
    Basics.floor (toFloat mass / 3) - 2


calculateFuelForFuel : Int -> Int -> Int
calculateFuelForFuel total fuel =
    let
        fuelforFuel =
            calculateFuel fuel
    in
    if fuelforFuel >= 0 then
        calculateFuelForFuel (total + fuelforFuel) fuelforFuel

    else
        total


getAnswerPart1 : String -> Int
getAnswerPart1 puzzle =
    parsePuzzleInput puzzle
        |> List.foldl (\mass total -> calculateFuel mass + total) 0


getAnswerPart2 : String -> Int
getAnswerPart2 puzzle =
    parsePuzzleInput puzzle
        |> List.foldl
            (\mass total ->
                let
                    moduleFuel =
                        calculateFuel mass
                in
                moduleFuel + calculateFuelForFuel 0 moduleFuel + total
            )
            0


getAnswer puzzle =
    String.replace "#" (String.fromInt (getAnswerPart1 puzzle)) "Part 1 answer is #. "
        ++ String.replace "#" (String.fromInt (getAnswerPart2 puzzle)) "Part 2 answer is #."
