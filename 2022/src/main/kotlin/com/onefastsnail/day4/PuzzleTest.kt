package com.onefastsnail.day4

import com.onefastsnail.utils.readFile
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import java.io.File

internal class PuzzleTest {

    @Test
    fun testPart1TeaserMultiOverlap() {
        assertEquals(
            1,
            part1(listOf("2-8,3-7"))
        )
    }

    @Test
    fun testPart1TeaserSingleOverlap() {
        assertEquals(
            1,
            part1(listOf("6-6,4-6"))
        )
    }

    @Test
    fun testPart1Teaser() {
        assertEquals(
            2,
            part1(readFile(File("src/main/kotlin/com/onefastsnail/day4/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart1() {
        assertEquals(
            431,
            part1(readFile(File("src/main/kotlin/com/onefastsnail/day4/resources/input.txt").absolutePath))
        )
    }

    @Test
    fun testPart2Teaser() {
        assertEquals(
            0,
            part2(readFile(File("src/main/kotlin/com/onefastsnail/day4/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart2() {
        assertEquals(
            0,
            part2(readFile(File("src/main/kotlin/com/onefastsnail/day4/resources/input.txt").absolutePath))
        )
    }
}