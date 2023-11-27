package com.onefastsnail.day6

import com.onefastsnail.utils.readFile
import java.io.File

fun main() {
    val part1 = part1(readFile(File("src/main/kotlin/com/onefastsnail/day6/resources/input.txt").absolutePath))
    println("Part 1: $part1")

    val part2 = part2(readFile(File("src/main/kotlin/com/onefastsnail/day6/resources/input.txt").absolutePath))
    println("Part 2: $part2")
}

fun part1(input: String): Int {
    return findMarker(input, 4)
}

fun part2(input: String): Int {
    return findMarker(input, 14)
}

private fun findMarker(input: String, windowSize: Int): Int {
    val windows = input.windowed(windowSize, 1)
    val startMarker = windows.indexOfFirst { it.toCharArray().toSet().size == windowSize }

    return windowSize + startMarker
}