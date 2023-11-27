package com.onefastsnail.day7

import com.onefastsnail.utils.readFileLines
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import java.io.File

internal class PuzzleTest {

    @Test
    fun testRemoveLastSegment() {
        listOf(
            Pair("/a/", "/"),
            Pair("/a/b/", "/a/"),
            Pair("/a/b/c/", "/a/b/")
        ).forEach {
            assertEquals(it.second, removeLastSegment(it.first))
        }
    }

    @Test
    fun testPart1Teaser1() {
        assertEquals(
            95437,
            part1(readFileLines(File("src/main/kotlin/com/onefastsnail/day7/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart1() {
        assertEquals(
            1350966,
            part1(readFileLines(File("src/main/kotlin/com/onefastsnail/day7/resources/input.txt").absolutePath))
        )
    }

    @Test
    fun testPart2Teaser() {
        assertEquals(
            24933642,
            part2(readFileLines(File("src/main/kotlin/com/onefastsnail/day7/resources/input-teaser1.txt").absolutePath))
        )
    }

    @Test
    fun testPart2() {
        assertEquals(
            6296435,
            part2(readFileLines(File("src/main/kotlin/com/onefastsnail/day7/resources/input.txt").absolutePath))
        )
    }
}