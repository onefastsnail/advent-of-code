package com.onefastsnail.day6

import com.onefastsnail.utils.readFile
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import java.io.File

internal class PuzzleTest {

    @Test
    fun testPart1Teaser() {
        // TODO table tests, parameterised tests
        assertEquals(
            7,
            part1("mjqjpqmgbljsphdztnvjfqwrcgsmlb")
        )

        assertEquals(
            5,
            part1("bvwbjplbgvbhsrlpgdmjqwftvncz")
        )

        assertEquals(
            6,
            part1("nppdvjthqldpwncqszvftbrmjlhg")
        )

        assertEquals(
            10,
            part1("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")
        )

        assertEquals(
            11,
            part1("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")
        )
    }

    @Test
    fun testPart1() {
        assertEquals(
            1109,
            part1(readFile(File("src/main/kotlin/com/onefastsnail/day6/resources/input.txt").absolutePath))
        )
    }

    @Test
    fun testPart2Teaser() {
        assertEquals(
            0,
            part2(readFile(File("src/main/kotlin/com/onefastsnail/day6/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart2() {
        assertEquals(
            0,
            part2(readFile(File("src/main/kotlin/com/onefastsnail/day6/resources/input.txt").absolutePath))
        )
    }
}