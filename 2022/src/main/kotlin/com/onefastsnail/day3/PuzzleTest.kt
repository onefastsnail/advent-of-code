package com.onefastsnail.day3

import com.onefastsnail.utils.readFile
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import java.io.File

internal class PuzzleTest {

    @Test
    fun testPart1Teaser() {
        assertEquals(
            157,
            part1(readFile(File("src/main/kotlin/com/onefastsnail/day3/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart1() {
        assertEquals(
            7691,
            part1(readFile(File("src/main/kotlin/com/onefastsnail/day3/resources/input.txt").absolutePath))
        )
    }

    @Test
    fun testPart2Teaser() {
        assertEquals(
            70,
            part2(readFile(File("src/main/kotlin/com/onefastsnail/day3/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart2() {
        assertEquals(
            2508,
            part2(readFile(File("src/main/kotlin/com/onefastsnail/day3/resources/input.txt").absolutePath))
        )
    }
}