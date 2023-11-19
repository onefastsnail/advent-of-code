package com.onefastsnail.day2

import com.onefastsnail.utils.readFile
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import java.io.File

internal class PuzzleTest {
    // TODO parametrized tests
    @Test
    fun testWhoWon() {
        assertEquals(Result.Player1, whoWon(Hand.Rock, Hand.Scissors))
        assertEquals(Result.Player2, whoWon(Hand.Paper, Hand.Scissors))
        assertEquals(Result.Draw, whoWon(Hand.Paper, Hand.Paper))
    }

    // TODO parametrized tests
    @Test
    fun testPart1SingleGame() {
        assertEquals(3, part1(listOf("A Z")))
    }

    @Test
    fun testPart1Teaser() {
        assertEquals(
            15,
            part1(readFile(File("src/main/kotlin/com/onefastsnail/day2/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart1() {
        assertEquals(
            10624,
            part1(readFile(File("src/main/kotlin/com/onefastsnail/day2/resources/input.txt").absolutePath))
        )
    }

    @Test
    fun testPart2Teaser() {
        assertEquals(
            12,
            part2(readFile(File("src/main/kotlin/com/onefastsnail/day2/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart2() {
        assertEquals(
            14060,
            part2(readFile(File("src/main/kotlin/com/onefastsnail/day2/resources/input.txt").absolutePath))
        )
    }
}