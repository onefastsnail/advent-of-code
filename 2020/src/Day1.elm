module Day1 exposing (..)


type alias EntryWith2 =
    { a : Int, b : Int, match : Bool }


type alias EntryWith3 =
    { a : Int, b : Int, c : Int, match : Bool }


type Entry
    = Entry2 EntryWith2
    | Entry3 EntryWith3


puzzleInput : String
puzzleInput =
    "261\n1773\n1839\n1551\n1781\n1276\n1372\n1668\n1823\n1870\n1672\n1821\n1327\n1902\n1949\n1389\n1720\n1437\n1716\n1360\n1893\n1410\n1881\n1927\n1639\n1514\n1753\n1625\n1249\n1696\n1698\n1699\n2004\n1742\n1903\n473\n1948\n1830\n1973\n2005\n1468\n1824\n1809\n1493\n2009\n1848\n1306\n1519\n1618\n1905\n1402\n1705\n1910\n1609\n1571\n1557\n1420\n608\n1471\n1383\n1442\n1447\n1985\n1486\n1629\n1450\n1767\n1407\n1626\n1623\n1467\n1224\n1269\n1325\n1674\n1945\n1733\n1913\n1451\n1853\n1875\n405\n1500\n1634\n1570\n1868\n1510\n1069\n1296\n1852\n1287\n1274\n832\n1373\n1142\n1838\n1854\n1480\n1628\n1632\n1597\n1761\n1717\n1684\n1956\n1351\n1622\n1941\n1704\n1926\n1873\n1393\n1850\n1898\n1960\n1673\n1736\n1901\n1806\n1768\n1670\n1989\n1214\n1851\n1715\n1461\n1277\n951\n1482\n1464\n1883\n1976\n1602\n1606\n1258\n1801\n1593\n1332\n1386\n1309\n1388\n1762\n1533\n1805\n1462\n375\n1555\n1357\n1578\n1552\n1473\n1834\n1262\n1466\n1925\n1955\n1575\n1975\n1964\n1440\n1667\n1922\n1454\n1813\n1968\n1836\n1982\n1326\n1811\n900\n1588\n1529\n1997\n1345\n1859\n1458\n1764\n1509\n1397\n1237\n1627\n1564\n1814\n1842\n1679\n1289\n1957\n1819\n801\n1350\n1841\n1803\n1718\n1966\n1272\n1636\n1352\n1496\n1455\n1488"


parsePuzzleInput : String -> List Int
parsePuzzleInput str =
    String.split "\n" str
        |> List.map (\a -> Maybe.withDefault 0 (String.toInt a))


isEntryMatch : Entry -> Bool
isEntryMatch entry =
    case entry of
        Entry2 { match } ->
            match

        Entry3 { match } ->
            match


findEntries : Int -> List Int -> List Entry
findEntries target entries =
    List.map (\a -> List.map (\b -> Entry2 { a = a, b = b, match = (a + b) == target }) entries) entries
        |> List.concat
        |> List.filter isEntryMatch


findEntries2 : Int -> List Int -> List Entry
findEntries2 target entries =
    List.map (\a -> List.map (\b -> List.map (\c -> Entry3 { a = a, b = b, c = c, match = (a + b + c) == target }) entries) entries |> List.concat) entries
        |> List.concat
        |> List.filter isEntryMatch


multiply : List Entry -> List Int
multiply entries =
    List.map
        (\entry ->
            case entry of
                Entry2 { a, b } ->
                    a * b

                Entry3 { a, b, c } ->
                    a * b * c
        )
        entries


getAnswerPart1 : String -> Int -> Int
getAnswerPart1 puzzle target =
    parsePuzzleInput puzzle
        |> findEntries target
        |> multiply
        |> List.head
        |> Maybe.withDefault 0


getAnswerPart2 : String -> Int -> Int
getAnswerPart2 puzzle target =
    parsePuzzleInput puzzle
        |> findEntries2 target
        |> multiply
        |> List.head
        |> Maybe.withDefault 0
