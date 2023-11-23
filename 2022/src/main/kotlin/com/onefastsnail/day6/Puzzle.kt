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
    var windowSize = 4
    var windows = input.windowed(windowSize, 1)
    var startMarker = windows.indexOfFirst { it.toCharArray().toSet().size == windowSize }

    return windowSize + startMarker
}

fun part2(input: String): Int {
    return 0
}