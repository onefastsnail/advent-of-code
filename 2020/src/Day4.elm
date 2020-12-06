module Day4 exposing (..)

import List
import Regex


puzzleInput : String
puzzleInput =
    "ecl:amb\npid:690616023\nbyr:1994 iyr:2014 hgt:172cm hcl:#c0946f eyr:2022\n\neyr:1980 cid:97\nhcl:z ecl:#102145 iyr:2011 byr:1945\npid:187cm hgt:179in\n\necl:amb\niyr:2011\ncid:113\neyr:2021 hcl:#b6652a pid:004682943 byr:1940\nhgt:173cm\n\niyr:2023\ncid:146 byr:2022 ecl:dne hgt:76in eyr:2040 hcl:z\n\nhcl:#f97e30\ncid:73 iyr:2013 byr:1929 hgt:157cm\neyr:2024 ecl:blu pid:673398662\n\nhcl:5343fe\nhgt:152 byr:2018\neyr:1992 pid:85999926 iyr:1938 ecl:#15bd97\n\nbyr:1975 hcl:z eyr:1988 pid:#c36f52\niyr:2018\nhgt:184cm\n\nbyr:1954 eyr:2023 hgt:170cm iyr:2012 ecl:blu pid:299556897 hcl:#b6652a\n\nhgt:191cm ecl:oth hcl:#7d3b0c\niyr:2016 pid:187567535\nbyr:1999 eyr:2023\n\npid:814358147 eyr:2022 iyr:2000 byr:2001 hcl:#18171d\necl:blu\nhgt:76in\n\necl:hzl\nhgt:163cm byr:1955 iyr:2018 eyr:2024 hcl:#6b5442 pid:343362099\n\neyr:2020 pid:185090160 ecl:#21a5e6\niyr:1928 byr:2006 hcl:a2ebbf hgt:104\n\nhgt:153cm\nhcl:#a97842 ecl:blu eyr:2028 byr:1969 iyr:2019\npid:729700590\n\niyr:2019 byr:1981 hgt:150cm pid:606092356 hcl:#18171d eyr:2026\necl:grn\n\npid:760899887\neyr:2023 hcl:#866857 hgt:185cm iyr:2017\nbyr:1976 ecl:gry\n\nbyr:1965 eyr:2026\nhcl:#623a2f\necl:blu pid:483363116 iyr:2010 hgt:178cm cid:204\n\necl:oth eyr:2022\npid:268557763 byr:1965 iyr:2015 hcl:#c0946f hgt:164cm\n\necl:gry hgt:168cm hcl:#623a2f eyr:2020 cid:163 pid:124082663 iyr:2016 byr:1996\n\nhcl:4c44fb iyr:1957 eyr:2039 ecl:grt hgt:63cm byr:2012 cid:104\n\nbyr:2024 iyr:2023\necl:gry\neyr:2007 pid:170cm hgt:68 hcl:d57b67 cid:333\n\nbyr:1956\nhgt:169cm iyr:2013 pid:370491367\necl:gry hcl:#5bc41d\n\neyr:2023 iyr:2028 byr:1969 ecl:lzr hcl:1989b1 hgt:71cm pid:#12c226\n\ncid:304 pid:866132461\nbyr:2022\nhcl:z hgt:191in ecl:lzr iyr:2029 eyr:1989\n\necl:brn hcl:#9a45a7\nhgt:176cm\nbyr:1974 pid:758747330 iyr:2014 eyr:2020\n\ncid:190 ecl:hzl iyr:2014 byr:1990 hgt:69in eyr:2037 pid:384015829 hcl:#ceb3a1\n\nbyr:1998 eyr:2022 iyr:2018 hgt:153cm\nhcl:#733820 pid:424512443\necl:blu\n\nhcl:27c41f byr:1972 eyr:1994 pid:777840405\necl:gry\nhgt:179cm\niyr:2021\n\nhgt:166cm eyr:2032 ecl:gry byr:1936\npid:41703652\n\nhcl:#efcc98 iyr:2019 byr:1936 pid:985830958 eyr:2021\nhgt:175cm ecl:brn\n\neyr:2025 pid:972163513 hgt:155cm ecl:brn cid:169 iyr:2015\nhcl:#6b5442\n\neyr:2026\nhgt:173cm\nbyr:1984\ncid:191\npid:791209101 hcl:#341e13 iyr:2020 ecl:hzl\n\nhgt:64cm\niyr:2010 byr:1978\npid:618891746 hcl:#d6ac23 eyr:2023 ecl:brn\n\neyr:2021 hcl:#341e13 iyr:2018 pid:502081929\necl:blu\n\necl:amb\niyr:2018 pid:8933462515\nhgt:160cm hcl:e330f0 eyr:2030 byr:2007\n\necl:gry byr:1980 hcl:#341e13 iyr:2015 pid:830724822 hgt:167cm cid:156\neyr:2023\n\necl:gry hcl:#c39b75 byr:1995 hgt:153cm\neyr:2029 pid:83056475 iyr:2013\n\nbyr:1965 cid:250\necl:oth iyr:2016\npid:242792947 eyr:2025 hcl:#efcc98\n\nbyr:2011 ecl:#62fe2d hcl:#2b434a hgt:190cm\neyr:2031 iyr:1964 pid:7096872943\n\ncid:258 hcl:#c0946f pid:698224453 eyr:2029 hgt:189cm iyr:2012 ecl:blu byr:1963\n\neyr:2028 byr:1942 hgt:156cm pid:836243052 iyr:2016\nhcl:#888785 cid:310 ecl:brn\n\nhcl:#a97842 pid:740164307 ecl:oth byr:1997\nhgt:166cm\niyr:2015 eyr:2026\n\nhcl:4ee9da iyr:2020\neyr:1933 hgt:136 ecl:#8dee29 pid:44266010 byr:1966 cid:82\n\necl:amb byr:1921 hgt:182cm eyr:2026\nhcl:#c0946f iyr:2010\n\nhgt:178cm cid:343 eyr:2023 pid:197119382 hcl:#623a2f iyr:2017\necl:brn byr:2002\n\neyr:2030 byr:1967 ecl:blu hgt:166cm iyr:2017\npid:655602762 hcl:#6b5442\n\ncid:143 hgt:152cm eyr:2026 iyr:2018 byr:1950 ecl:grn hcl:#866857 pid:067535973\n\nbyr:2019 ecl:#e3c288 iyr:1948 hgt:72cm hcl:7da71b eyr:1956\n\nhcl:#cfa07d\npid:688405238 cid:200 byr:1950\niyr:2020 ecl:hzl hgt:170cm\n\neyr:2026 hgt:164cm iyr:2010 hcl:#b6652a pid:404835595 byr:1924 ecl:blu\n\niyr:2016 hcl:#866857\necl:gry\neyr:2023 pid:986813245 cid:247 byr:1977\nhgt:173cm\n\necl:#a59335 eyr:2023\nhcl:033f22 byr:1947 hgt:152\niyr:2029 pid:#1e686a cid:305\n\nbyr:2005\necl:amb hcl:#a97842\niyr:1972\neyr:1967 pid:274884869\n\neyr:2038 iyr:2018\npid:181cm ecl:xry hgt:185in\nhcl:109b28 cid:287\n\necl:amb byr:1943 pid:002483342 hgt:178cm\nhcl:#c0946f eyr:2030\niyr:2014\n\niyr:2020 byr:1963 cid:131 hcl:#18171d hgt:181cm pid:146726616 eyr:2021\n\npid:062629370 byr:1931 hgt:188cm eyr:2021 ecl:gry\nhcl:#166b3d\n\npid:007028786 ecl:blu hgt:156cm byr:1981 hcl:#888785 cid:53 iyr:2019\n\niyr:2014 hcl:#623a2f\necl:hzl eyr:2029 byr:1988\npid:849096536 hgt:167cm cid:322\n\npid:160824363\nhcl:#19bed3\neyr:2024 hgt:171cm\nbyr:1968 iyr:2019\n\neyr:2024 hcl:#dd66d0\nbyr:1986\ncid:105 pid:816153574 ecl:hzl iyr:2013\nhgt:173cm\n\nhcl:#ceb3a1 hgt:62in ecl:gry\niyr:2017 cid:234 byr:1963\neyr:2029\npid:514406488\n\nhcl:#fffffd ecl:blu\neyr:2020 iyr:2010\npid:544347103 hgt:164cm byr:1939\n\neyr:2021\npid:999479324 hgt:164in ecl:brn iyr:2016\nhcl:#a97842 byr:2020\n\npid:053149570 byr:1920 eyr:2027 hgt:190cm iyr:2011 hcl:#fffffd ecl:oth\n\nhgt:165cm\nhcl:#cfa07d\necl:oth\neyr:2023\npid:186cm\nbyr:1937 iyr:2012\n\neyr:2026 hgt:64cm hcl:#ac426a byr:1969\ncid:345 iyr:1960\npid:#df648a ecl:blu\n\nbyr:1923 iyr:2017\neyr:2027 pid:798497862 hgt:182cm\nhcl:#ceb3a1 ecl:oth\n\nhgt:182cm eyr:1990 ecl:grn hcl:#efcc98 byr:1968\npid:005962011\niyr:2010\n\ncid:74 eyr:2020 hgt:71in\niyr:2015 pid:487940408 byr:1952\nhcl:#733820\n\nhgt:75cm cid:249\necl:hzl\nhcl:#6b5442 pid:4860441 eyr:2020\n\necl:hzl eyr:2025 hgt:183cm\niyr:2020 byr:1993 pid:572766871 hcl:#866857\n\nhcl:#888785 pid:200125941 hgt:155cm byr:1923\neyr:2021 iyr:2010 ecl:gry\n\npid:502547835 iyr:2014 hcl:#b6652a\nbyr:1985 hgt:189cm eyr:2024\n\neyr:2024 hcl:#fffffd ecl:amb byr:1952\npid:724639818\niyr:2013 hgt:183cm\n\nbyr:2023\niyr:2026 ecl:gry eyr:2032 hcl:3e0fc4 pid:5620497552\nhgt:84\n\ncid:79\nhgt:68cm\niyr:2021\npid:#365b83 byr:1928\necl:#79a6b3 eyr:2027 hcl:54130e\n\nhgt:74cm byr:1953\ncid:263 iyr:2018\necl:zzz\nhcl:#efcc98\npid:154cm eyr:1951\n\ncid:272 pid:0638528559 hcl:z hgt:63cm byr:2029 ecl:zzz\neyr:2033\n\niyr:2016\nhgt:193cm hcl:#6b5442 pid:715518898 ecl:brn cid:195\neyr:2025\n\necl:oth\neyr:2025 hgt:166cm byr:1944\niyr:2017 pid:814141652\n\neyr:2025 cid:140 ecl:hzl hcl:#c0946f pid:824866056 iyr:2011 hgt:65in byr:1947\n\niyr:2016\necl:brn eyr:2021\nhgt:161cm\nbyr:1984 hcl:#602927 pid:821539320\n\nhgt:175cm cid:190 hcl:#ceb3a1 ecl:brn byr:1927 iyr:2017 eyr:2029 pid:836598854\n\neyr:2026 ecl:brn hgt:157cm pid:038645205 byr:1995\niyr:2019 cid:339\n\necl:brn hgt:70in hcl:#c0946f\npid:535498918 cid:153\niyr:2012 eyr:2030\n\nbyr:1995\nhcl:#efcc98 hgt:174cm eyr:2030 pid:180839761\necl:grn iyr:2010\n\nhgt:59cm eyr:2035 byr:2021 iyr:2012 ecl:hzl pid:219328725 hcl:#888785\n\necl:oth hgt:184cm byr:1984 iyr:2016\nhcl:#cfa07d\n\niyr:1998 byr:2024 ecl:lzr hgt:187 hcl:z eyr:1935 pid:#789b56\n\niyr:1967 hcl:z pid:828930046 hgt:59in\ncid:153\nbyr:2021\necl:grn\neyr:1935\n\nbyr:1991\nhcl:#341e13 ecl:gry iyr:2018\nhgt:67in pid:157970631 eyr:2021\n\nbyr:1941 hgt:169cm pid:322510952 hcl:#cfa07d cid:75 ecl:oth\neyr:2021 iyr:2020\n\nhcl:#7d3b0c iyr:2013 cid:78 hgt:167cm ecl:brn byr:1974 pid:237404828\n\npid:1567157833\nhcl:#7d3b0c iyr:2025 eyr:2023\nbyr:2002 ecl:oth hgt:191cm\n\necl:amb iyr:2014 hgt:182cm pid:526612838\ncid:287 eyr:2025 byr:1988\nhcl:#866857\n\nhcl:#866857 hgt:174cm byr:1992 eyr:2028 iyr:2015\n\neyr:2029\nhgt:190cm\nhcl:#18171d\ncid:245\necl:oth pid:3636033742 byr:2024\niyr:2019\n\nbyr:1972 hgt:163cm eyr:2020 hcl:#b6652a\npid:360516396 iyr:2019 ecl:grn\n\niyr:1997 ecl:#be02d2\neyr:2020 cid:259 byr:1953\nhcl:#6b5442\nhgt:177cm pid:978155362\n\npid:377596476 cid:153\neyr:2025 byr:2000 hgt:181cm iyr:2014 hcl:#abc5cb ecl:hzl\n\ncid:171 ecl:lzr iyr:2013 eyr:1973 byr:2004\npid:#267099 hgt:101\n\nhcl:#623a2f\npid:029193661\nhgt:183cm\necl:hzl eyr:2029 iyr:2013\nbyr:1977\n\necl:amb eyr:2021 hgt:159cm byr:1970 cid:152\nhcl:#b6652a iyr:2020 pid:180512119\n\neyr:2025\necl:grn\nhgt:60in iyr:2013 pid:697352361\nhcl:#18171d byr:1989\n\nbyr:1934 hgt:165cm pid:703537570 ecl:hzl iyr:2015\nhcl:#888785\n\necl:gmt\nhcl:6dd6a5\nbyr:1951\npid:#7ab761 cid:304 iyr:1924 eyr:1953 hgt:71in\n\necl:amb hcl:#733820 eyr:2030 hgt:178cm\npid:692422832 iyr:2019\ncid:276\n\niyr:2012 ecl:oth\npid:674969358\neyr:2027 hgt:157cm cid:247 hcl:#a97842\n\nbyr:2017 eyr:2031 hgt:180cm hcl:#ceb3a1 pid:372071110\niyr:2015 ecl:amb\n\nhgt:165cm iyr:2015\neyr:2021 ecl:amb byr:2000 cid:235\n\neyr:2027 hcl:#623a2f pid:595874068\necl:amb\nhgt:177cm iyr:2019 byr:1929\n\npid:8150929412 hgt:191in eyr:2031 cid:233 byr:2027\niyr:2026 ecl:#e94348 hcl:z\n\nhgt:65 byr:2009 iyr:2029 hcl:#fffffd eyr:1950 pid:950012410 cid:212 ecl:#5a6042\n\necl:#44c561 hgt:178cm eyr:2021 pid:753771724\niyr:2014\nhcl:#70adb2 byr:1989\n\niyr:2018 pid:809109448 ecl:amb hcl:#b6652a hgt:63in byr:1976 cid:96\n\nbyr:2021 ecl:grn pid:9284377919 iyr:2011 hgt:75cm hcl:#18171d eyr:2026\n\necl:oth\nbyr:1926\nhgt:63 iyr:1948 cid:61 hcl:a528d1 eyr:2034\n\nbyr:1978 pid:150503169 iyr:2015 ecl:grn hgt:172cm cid:70 eyr:2022 hcl:#7d3b0c\n\nbyr:1957 hcl:#cfa07d iyr:2010 ecl:amb eyr:2025 pid:921901279\n\necl:utc pid:154cm\nbyr:1964 eyr:1978 hgt:114 hcl:z\n\nbyr:1929 ecl:amb eyr:2028 iyr:2013\nhcl:#fffffd pid:479814281\ncid:105 hgt:64in\n\npid:949640425\ncid:205 hcl:#341e13 ecl:amb\nhgt:171cm byr:1998\n\nhgt:190cm cid:113 ecl:grn eyr:2037\nhcl:#ceb3a1 pid:7994792779 iyr:2011\n\nhgt:152cm iyr:2010\nbyr:1992 eyr:2020\nhcl:#602927\ncid:66\npid:604149642\n\neyr:2028\nbyr:1961 hgt:71in\niyr:2013 cid:135\npid:534090716 hcl:#ceb3a1 ecl:oth\n\niyr:1937 byr:1995 cid:200\neyr:2037 pid:#daf9af\nhcl:052017 ecl:zzz hgt:73cm\n\necl:amb\nhcl:#a97842\niyr:2018\nhgt:153cm\ncid:149 eyr:2023 pid:533403632\n\ncid:275 ecl:brn iyr:2017 pid:087665205 byr:1945 hcl:#7d3b0c\neyr:2025\n\neyr:2030 hgt:177cm hcl:#cfa07d iyr:2018 pid:734113761\nbyr:1965\n\nhgt:163cm byr:1924 ecl:blu cid:125\neyr:2027 hcl:#fffffd pid:137238888\n\nhgt:174cm hcl:#623a2f eyr:2023 ecl:gry pid:585758460\niyr:2011\n\ncid:183\nbyr:1928 pid:471385060\nhgt:192cm\necl:oth iyr:2010 hcl:#623a2f eyr:2020\n\nhgt:177cm\ncid:273 ecl:oth eyr:2020\nhcl:#efcc98\niyr:2012 pid:246299733\nbyr:1954\n\npid:052203766 cid:146 ecl:hzl byr:1974 hcl:#6b5442\neyr:2030 hgt:173cm\niyr:2011\n\nhgt:167cm\nbyr:1972 iyr:2010\npid:783359411 ecl:hzl hcl:#9f8cc9 eyr:2028\n\niyr:2020 hcl:#18171d ecl:grn\nbyr:1992\nhgt:189cm\neyr:2023 pid:736882272\n\ncid:230 ecl:utc iyr:2022\npid:170cm\nbyr:2015 hcl:#c0946f\neyr:2031\n\ncid:261\nbyr:1922 hgt:170cm ecl:brn eyr:2021\npid:593276915 hcl:#18171d\niyr:2017\n\nhcl:#341e13 pid:038417039 hgt:61in eyr:2025 iyr:2017\ncid:117\n\niyr:2017 eyr:2026 pid:441484223\nhgt:155cm byr:1968 hcl:#ceb3a1 ecl:hzl\n\neyr:2021\nhgt:64in\necl:oth hcl:#b6652a byr:1954 pid:204959612 iyr:2016\n\nhcl:z eyr:1969\npid:162cm ecl:#944b0f\niyr:2030 byr:2029\n\nhgt:114 eyr:2034 byr:2026 hcl:84fa1a\npid:47909473\niyr:2028\necl:utc\n\neyr:2025 ecl:blu hgt:157cm iyr:2014 hcl:#a97842 byr:1974 pid:702610675 cid:241\n\npid:732388109\nhcl:#6b5442 cid:272 eyr:2026 hgt:193cm\necl:amb byr:1982\n\neyr:2030 byr:1994\nhgt:177in ecl:amb pid:1589147420 iyr:2011 hcl:#4bf920\ncid:252\n\necl:oth eyr:2022\nbyr:1948\npid:177cm cid:90 hgt:102 hcl:z iyr:2028\n\nhgt:157cm pid:233347213\nhcl:z\nbyr:2009 eyr:2027 cid:235 ecl:blu\niyr:1965\n\necl:blu iyr:2030 eyr:2028 hcl:#18171d pid:322593908 byr:1954\ncid:215 hgt:63in\n\nhgt:72cm\ncid:345 pid:911728732 eyr:2025\nbyr:2004 ecl:#0c4af7 hcl:3bb675\n\npid:171714794 byr:2019\nhcl:#866857\ncid:290 hgt:183in ecl:#d0c30f eyr:2032\n\niyr:2016 pid:905945155 hcl:#ceb3a1 byr:1958 hgt:159cm eyr:2028 cid:180 ecl:oth\n\nhcl:efb614\neyr:2022 hgt:177cm pid:46962273\nbyr:1974\necl:#089bdd iyr:1988\n\npid:662993164 iyr:2011 eyr:2025 ecl:hzl\nbyr:1942 hcl:#fffffd\nhgt:175cm\n\nhcl:#7d3b0c iyr:2016 hgt:175cm eyr:2022 pid:953132241\nbyr:1963 cid:261 ecl:grn\n\niyr:2013 hgt:180cm cid:318\necl:amb\nbyr:1985 pid:439097817 eyr:2029 hcl:#602927\n\nhgt:162cm ecl:blu\npid:675749832 cid:73\nbyr:1940 hcl:#888785\neyr:2026\n\npid:275352007 iyr:2012 eyr:2020\necl:amb hcl:#623a2f hgt:175cm cid:317 byr:1988\n\nhcl:z hgt:164in\niyr:2026 eyr:1961 ecl:#2df35e pid:#5c9ed5 cid:341\n\npid:848086119 ecl:oth eyr:2021 iyr:2011 hgt:180cm byr:1923 hcl:#93461b\n\neyr:2028\niyr:2014\nbyr:1978\nhgt:184cm\npid:966277564 ecl:hzl\ncid:176\n\nhcl:#888785 ecl:amb cid:329 pid:835961958 byr:1927 eyr:2028 iyr:2016\n\npid:160cm eyr:2026 hcl:#08714b\necl:hzl iyr:1961\nhgt:156cm byr:1984\n\necl:gry cid:302\nbyr:1965\niyr:2019 hcl:#ceb3a1 eyr:2027 pid:458192010 hgt:156cm\n\npid:058273969 byr:1942 eyr:2027\nhcl:#c0946f iyr:2013 hgt:179cm\n\niyr:2019 hgt:193in pid:52144528 eyr:2036\ncid:169 ecl:grt hcl:7e7039\n\nhgt:192cm ecl:blu iyr:2015 pid:544936486 eyr:2024\nbyr:1972 hcl:#c0946f\n\neyr:2000\nhcl:78de23 byr:2020\nhgt:171in pid:160cm cid:68\niyr:1956 ecl:gmt\n\nhcl:#733820 ecl:grn iyr:2018\nbyr:2001 pid:770957230\n\ncid:103 ecl:grn iyr:2018\npid:068344094\neyr:2023 hgt:69in byr:1984 hcl:#6b5442\n\nhgt:193cm eyr:2021 ecl:grn hcl:#602927 byr:1938 iyr:2011\n\niyr:1931\nhcl:c0a318\npid:99195939\nbyr:2028 ecl:grt hgt:164 eyr:2017\n\neyr:1980\necl:zzz\nhgt:98 cid:161\npid:#96fe01 hcl:z\niyr:1974\n\nbyr:1936 hgt:176cm pid:56797167 iyr:2015\necl:#07ad47\nhcl:z\n\npid:48720181 hcl:270e76\nbyr:2022\nhgt:180cm ecl:#dde399\neyr:2035 iyr:2023\n\neyr:2030 byr:2022 iyr:2018 hgt:162in ecl:gry\nhcl:#63e2ec pid:615812600\n\necl:grn\ncid:56 hcl:#623a2f eyr:2020 hgt:167cm byr:1971 iyr:2012\npid:262692066\n\nhgt:61 hcl:#efcc98 iyr:2011 eyr:2026\nbyr:1938\necl:amb pid:385025739\n\npid:972423724 hcl:#602927 eyr:2027 ecl:oth iyr:2015\nhgt:158cm byr:1956\n\npid:530035096\necl:hzl\niyr:2017\neyr:2024 hcl:#888785 byr:1962 hgt:64in\n\nbyr:1935 eyr:2022 ecl:grn hcl:#7d3b0c pid:294714199\n\neyr:2029\niyr:2013\nbyr:1927 hgt:175cm pid:058261075 hcl:#cfa07d ecl:amb\n\necl:blu pid:188764763 hgt:155cm byr:1921\niyr:2018 eyr:2029 hcl:#b6652a\n\nbyr:1975 hcl:930e76 iyr:2019\npid:169cm eyr:2009 hgt:191\necl:#d28c56\n\nhcl:z\npid:3190617557\nhgt:160cm cid:80 ecl:oth iyr:2022 eyr:2008\nbyr:2016\n\nhcl:#888785 byr:1999 ecl:blu cid:238 iyr:2018 hgt:160cm\neyr:2028 pid:174517111\n\neyr:2035\nhcl:z byr:2020\npid:262135957 cid:324 iyr:2016 hgt:161cm ecl:grn\n\nbyr:1936\necl:grn\niyr:2013 hcl:#623a2f eyr:2029 hgt:166cm\n\nhcl:#cfa07d hgt:159cm eyr:2021\necl:hzl\niyr:2014 pid:816039817 byr:1935\n\npid:596634790 hgt:161cm\neyr:2036 iyr:2016\nhcl:#7d3b0c byr:2015 ecl:brn\n\nbyr:1952\nhgt:157cm eyr:2024 cid:60 pid:876160626\necl:blu iyr:2011 hcl:z\n\nhgt:193cm iyr:2020 eyr:2026\npid:0136642346 ecl:hzl hcl:#efcc98 byr:1995\n\nbyr:1934 hgt:177cm\npid:445993865\necl:brn iyr:2018\neyr:2030\nhcl:#733820\n\neyr:2021 hgt:71in\npid:918630878\nhcl:#602927 iyr:2017 byr:1943\necl:gry\n\necl:#81de2c iyr:2021 hgt:176cm eyr:1947 hcl:#888785 pid:1370052400\n\necl:amb\nbyr:1922 iyr:2012 eyr:2022 pid:098866466 hcl:#18171d hgt:63in\n\neyr:2028 iyr:2010 hcl:184355\nbyr:1968 pid:337089458 ecl:brn hgt:181cm\n\nhcl:#733820 pid:225958483 ecl:gry eyr:2030 hgt:62in iyr:2012 byr:1987\n\neyr:1955\nhcl:03199c\npid:#3e832e\nbyr:2014 ecl:#453931 hgt:70cm\n\nbyr:1975\necl:blu hcl:#7d3b0c\ncid:169 pid:582470437 hgt:151cm\niyr:2019 eyr:2027\n\niyr:2017 byr:1971 pid:343492418 hgt:150cm hcl:#fffffd eyr:2024\n\nbyr:1997\neyr:2026\ncid:257 hcl:#7d3b0c ecl:blu hgt:166cm iyr:2016 pid:117625518\n\niyr:2014 cid:248 hgt:165cm hcl:#18171d pid:294270262\nbyr:1925 ecl:amb\neyr:2028\n\nhgt:167in ecl:dne pid:174cm iyr:2019 byr:2005 hcl:b29331 cid:86\n\nhcl:#733820 pid:259969636 eyr:2023\necl:hzl cid:317\nhgt:185cm byr:2025\niyr:2012\n\nhcl:#cfa07d hgt:152cm pid:807755992 iyr:2020\nbyr:1922 ecl:grn eyr:2025 cid:241\n\npid:997807107 byr:1958 ecl:dne iyr:2013 eyr:2023 hcl:#18171d\nhgt:152cm\n\necl:blu hgt:170cm\nbyr:1932\npid:775223495 eyr:2024 iyr:2015\n\niyr:2011\necl:grn hcl:#ceb3a1 pid:190577415\nhgt:63in\neyr:2021\nbyr:1986\n\necl:oth eyr:2025 hgt:180cm\npid:258195402 iyr:2017\nbyr:1961\ncid:109 hcl:#888785\n\nhgt:178cm byr:1952 eyr:2023 hcl:#733820\npid:106939563 ecl:brn iyr:2012\n\nhgt:188cm iyr:2012 hcl:#fffffd byr:1942\necl:brn pid:804371742\n\nbyr:1978 cid:120\neyr:2026 pid:405714523 hgt:60in\nhcl:#a97842 ecl:blu\niyr:2017\n\niyr:2015 byr:1958 ecl:grn\nhcl:#b6652a pid:#9e8af3\neyr:2026 hgt:167cm\n\nhgt:171cm hcl:#888785\ncid:274\necl:grn pid:919263460 eyr:2023 iyr:2020\n\npid:606726472 eyr:2022\nbyr:2008\necl:zzz cid:72 hgt:173in\n\neyr:2032 byr:2004\nhcl:z iyr:2011 ecl:hzl\npid:523494728\nhgt:70cm\n\nhgt:169cm pid:755822781 byr:1984 ecl:hzl hcl:#6b5442 iyr:2014\n\neyr:2020\nbyr:1942 cid:85\nhgt:157cm pid:558287447 hcl:#efcc98\necl:hzl\n\nbyr:1980 cid:225 pid:367501996 iyr:2016 ecl:grn hcl:#efcc98\nhgt:175cm eyr:2029\n\npid:264780775 hgt:182cm ecl:grn\nhcl:#18171d\neyr:2024\nbyr:1926 iyr:2013\n\nbyr:1969 iyr:2015\neyr:2026 ecl:blu\nhcl:#fffffd\npid:005695878 cid:273\n\necl:brn byr:2006 hgt:152cm\nhcl:#888785\npid:171cm cid:249 iyr:2026\neyr:2022\n\nbyr:2011 iyr:2020 ecl:zzz hcl:z pid:412624100\neyr:2031\n\ncid:111 hcl:df9bd0\niyr:2022 ecl:#32fdf9\nbyr:2017 eyr:2000\nhgt:166in pid:0654651026\n\neyr:2021\necl:gry pid:587324819 hgt:187cm byr:1951 hcl:#6b5442\n\niyr:2011\npid:180780096 hcl:#623a2f ecl:amb hgt:160cm byr:1991 eyr:2026\n\nbyr:2022 hgt:152cm eyr:2023 cid:70 ecl:grn\nhcl:e0a24e\niyr:1959 pid:77110462\n\npid:251982311 byr:1994 ecl:gry hgt:165cm eyr:2021\nhcl:#623a2f\niyr:2019\n\necl:blu byr:1945\ncid:241\npid:732768808 hcl:#efcc98\nhgt:171cm eyr:2020 iyr:2012\n\ncid:243 eyr:2001\nhcl:01a022\nhgt:162 pid:507703455\nbyr:2003 ecl:#c6a07b\niyr:1941\n\nhcl:#733820 cid:150\necl:hzl pid:843607639 hgt:190cm\nbyr:1958\neyr:2025\n\neyr:2030\npid:489370607 iyr:2014 ecl:oth hcl:#cfa07d byr:1995 hgt:193cm\n\nhgt:68in\nbyr:1933\niyr:2010 ecl:brn\npid:380075958\nhcl:#623a2f cid:279\neyr:2025\n\niyr:2019\nbyr:2001\nhcl:#cfa07d ecl:brn pid:349877352\nhgt:161cm eyr:2029\n\nhgt:171cm\neyr:2040 ecl:dne hcl:#6b5442 iyr:2020 byr:1990\n\nhcl:#fffffd\nhgt:154cm\nbyr:1979 eyr:2020 iyr:2018\npid:118713281 cid:174\n\nhcl:#7d3b0c eyr:2030 ecl:brn iyr:2017\ncid:184 hgt:180cm pid:504181498 byr:1925\n\nhgt:150cm\neyr:2020 byr:1999 hcl:#a97842 iyr:2011 ecl:grn pid:620166468\n\nhcl:#602927\niyr:2015\nbyr:1928\npid:083747352\neyr:2027 hgt:193cm\necl:hzl\n\nbyr:1938 ecl:gry\npid:511669464 eyr:1973 hgt:70cm\ncid:262 iyr:2015 hcl:#c0946f\n\neyr:2029\nbyr:1923 hgt:160cm hcl:#7d3b0c iyr:2013 pid:525837692 ecl:gry\n\nhcl:#602927 eyr:2025\npid:232338168 hgt:174cm cid:322 iyr:2010 ecl:oth\n\nhgt:192in cid:126 hcl:#6b5442\npid:101406211 byr:1922 ecl:hzl eyr:2022 iyr:2013\n\neyr:2026 ecl:amb\nbyr:1921\ncid:336\niyr:2020 hgt:182cm pid:533626984\n\npid:411943955 ecl:amb eyr:2025 hgt:166cm byr:1964 hcl:#341e13 cid:285\niyr:2010\n\necl:grn byr:1933 eyr:2024\nhgt:153cm\nhcl:#5cfb31 iyr:2019 pid:773885967\n\necl:hzl pid:426060511\nhgt:159cm\nbyr:1922 hcl:#6ffd04 iyr:2017\n\nbyr:2025 pid:#097d1b iyr:2020 eyr:2029 hcl:73d113 hgt:69cm ecl:utc\n\necl:amb hgt:170cm eyr:2025 byr:1930 iyr:2018 hcl:#733820\ncid:262\n\niyr:2019\neyr:2021\ncid:65 pid:258615618\necl:oth byr:1987\nhcl:#efcc98\nhgt:178cm\n\nhcl:z eyr:1980 ecl:#1c5fd1 hgt:65cm byr:2014\ncid:222 pid:#c69fd5 iyr:2020\n\ncid:271 pid:#4b8380 hcl:80fab0\nbyr:2024 ecl:#20e25f\niyr:1945\neyr:1935 hgt:159cm"


parsePuzzleInput : String -> List (List (List String))
parsePuzzleInput str =
    String.split "\n\n" str
        |> List.map
            (\a ->
                String.replace "\n" " " a
                    |> String.split " "
                    |> List.map (\b -> String.split ":" b)
            )


requiredFields : List String
requiredFields =
    [ "byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid" ]


validateYearRange : String -> Int -> Int -> Bool
validateYearRange value start end =
    let
        year =
            String.toInt value |> Maybe.withDefault 0
    in
    year >= start && year <= end


validateEyeColor : String -> Bool
validateEyeColor value =
    List.member value [ "amb", "blu", "brn", "gry", "grn", "hzl", "oth" ]


validatePassportId : String -> Bool
validatePassportId value =
    String.split "" value |> List.length |> (\a -> a == 9)


validateCountryId : String -> Bool
validateCountryId value =
    True


validateHeight : String -> Bool
validateHeight value =
    let
        height =
            Maybe.withDefault Regex.never <|
                Regex.fromString "^([1-9][0-9]*)"

        fieldValue =
            Regex.find height value
                |> List.head
                |> (\maybe ->
                        case maybe of
                            Just { match } ->
                                String.toInt match |> Maybe.withDefault 0

                            _ ->
                                0
                   )
    in
    if String.contains "cm" value then
        fieldValue >= 150 && fieldValue <= 193

    else if String.contains "in" value then
        fieldValue >= 59 && fieldValue <= 76

    else
        False


validateHairColor : String -> Bool
validateHairColor value =
    let
        hexCode =
            Maybe.withDefault Regex.never <|
                Regex.fromString "^#([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$"
    in
    Regex.contains hexCode value


validateField : List String -> Bool
validateField field =
    let
        fieldName =
            List.head field |> Maybe.withDefault ""

        fieldValue =
            List.reverse field |> List.head |> Maybe.withDefault ""
    in
    case fieldName of
        "byr" ->
            validateYearRange fieldValue 1920 2002

        "iyr" ->
            validateYearRange fieldValue 2010 2020

        "eyr" ->
            validateYearRange fieldValue 2020 2030

        "ecl" ->
            validateEyeColor fieldValue

        "pid" ->
            validatePassportId fieldValue

        "cid" ->
            validateCountryId fieldValue

        "hgt" ->
            validateHeight fieldValue

        "hcl" ->
            validateHairColor fieldValue

        _ ->
            False


validatePassport : List (List String) -> String -> Bool
validatePassport passport optionalField =
    let
        passportFields =
            List.map (\field -> List.head field |> Maybe.withDefault "") passport

        missingFields =
            List.filter (\field -> List.member field passportFields == False) requiredFields

        missingCountryIdOnly =
            List.length missingFields == 1 && List.member optionalField missingFields
    in
    (List.length missingFields == 0) || missingCountryIdOnly


validatePassportV2 : List (List String) -> String -> Bool
validatePassportV2 passport optionalField =
    let
        passportFields =
            List.map (\field -> List.head field |> Maybe.withDefault "") passport

        missingFields =
            List.filter (\field -> List.member field passportFields == False) requiredFields

        arePresentFieldsValid =
            List.map validateField passport
                |> List.filter (\validity -> validity == False)
                |> (\validity -> List.length validity == 0)

        missingCountryIdOnly =
            List.length missingFields == 1 && List.member optionalField missingFields
    in
    (List.length missingFields == 0 || missingCountryIdOnly) && arePresentFieldsValid


getAnswerPart1 : String -> Int
getAnswerPart1 puzzle =
    parsePuzzleInput puzzle
        |> List.filter (\passport -> validatePassport passport "cid")
        |> List.length


getAnswerPart2 : String -> Int
getAnswerPart2 puzzle =
    parsePuzzleInput puzzle
        |> List.filter (\passport -> validatePassportV2 passport "cid")
        |> List.length
