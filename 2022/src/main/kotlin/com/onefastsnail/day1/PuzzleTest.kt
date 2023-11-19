package com.onefastsnail.day1

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import com.onefastsnail.utils.readFile
import java.io.File

internal class PuzzleTest {
    @Test
    fun testPart1Teaser() {
        assertEquals(
            24000,
            part1(readFile(File("src/main/kotlin/com/onefastsnail/day1/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart1() {
        assertEquals(
            72017,
            part1(readFile(File("src/main/kotlin/com/onefastsnail/day1/resources/input.txt").absolutePath))
        )
    }

    @Test
    fun testPart2Teaser() {
        assertEquals(
            45000,
            part2(readFile(File("src/main/kotlin/com/onefastsnail/day1/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart2() {
        assertEquals(
            212520,
            part2(readFile(File("src/main/kotlin/com/onefastsnail/day1/resources/input.txt").absolutePath))
        )
    }
}