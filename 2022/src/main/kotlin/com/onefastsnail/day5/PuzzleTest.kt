package com.onefastsnail.day5

import com.onefastsnail.utils.readFileLines
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import java.io.File

internal class PuzzleTest {

    @Test
    fun testGetStackAndMoves() {
        val moves = listOf(
            Triple(1, 2, 1),
            Triple(3, 1, 3),
            Triple(2, 2, 1),
            Triple(1, 1, 2)
        )

        val stacks = listOf(
            listOf("N", "Z"),
            listOf("D", "C", "M"),
            listOf("P")
        )

        assertEquals(
            Pair(moves, stacks),
            getStackAndMoves(readFileLines(File("src/main/kotlin/com/onefastsnail/day5/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart1Teaser() {
        assertEquals(
            "CMZ",
            part1(readFileLines(File("src/main/kotlin/com/onefastsnail/day5/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart1() {
        assertEquals(
            "CNSZFDVLJ",
            part1(readFileLines(File("src/main/kotlin/com/onefastsnail/day5/resources/input.txt").absolutePath))
        )
    }

    @Test
    fun testPart2Teaser() {
        assertEquals(
            "MCD",
            part2(readFileLines(File("src/main/kotlin/com/onefastsnail/day5/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart2() {
        assertEquals(
            "QNDWLMGNS",
            part2(readFileLines(File("src/main/kotlin/com/onefastsnail/day5/resources/input.txt").absolutePath))
        )
    }
}