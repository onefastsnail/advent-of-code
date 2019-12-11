module Day1Test exposing (..)

import Day1 exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


puzzleInput =
    "124846\n99745\n110203\n140165\n110228\n65706\n128481\n75921\n57331\n72951\n133413\n99524\n79546\n54653\n55166\n66215\n147696\n91054\n64752\n76311\n139572\n61110\n65846\n121489\n147534\n66591\n109963\n83412\n138965\n70102\n128844\n141002\n77655\n68539\n128687\n70559\n140747\n51397\n117550\n91515\n60960\n133280\n83244\n106644\n100333\n67608\n118120\n60024\n115547\n136229\n108403\n128776\n109599\n111189\n98538\n129715\n116630\n120772\n80105\n52489\n130247\n144003\n85226\n83769\n137921\n54737\n126406\n108756\n149633\n138201\n78980\n126909\n125768\n86214\n54873\n97723\n92677\n120405\n143317\n102981\n142668\n100398\n67258\n126583\n114611\n102525\n115205\n78329\n140703\n136978\n94465\n129510\n81039\n141997\n120643\n55377\n89966\n113672\n112665\n51323"


suite : Test
suite =
    describe "Day1"
        [ test "parsePuzzleInput"
            (\_ ->
                Day1.parsePuzzleInput "1\n2\n3"
                    |> List.length
                    |> Expect.equal 3
            )
        , test "calculateFuel example case"
            (\_ -> Day1.calculateFuel 100756 |> Expect.equal 33583)
        , test "calculateFuelForFuel example case"
            (\_ -> Day1.calculateFuelForFuel 0 100756 |> Expect.equal 50346)
        , test
            "getAnswerPart1"
            (\_ -> Day1.getAnswerPart1 puzzleInput |> Expect.equal 3405721)
        , test
            "getAnswerPart2"
            (\_ -> Day1.getAnswerPart2 puzzleInput |> Expect.equal 5105716)
        ]
