package com.onefastsnail.day4

import com.onefastsnail.utils.readFile
import java.io.File

fun main() {
    val part1 = part1(readFile(File("src/main/kotlin/com/onefastsnail/day4/resources/input.txt").absolutePath))
    println("Part 1: $part1")

    val part2 = part2(readFile(File("src/main/kotlin/com/onefastsnail/day4/resources/input.txt").absolutePath))
    println("Part 2: $part2")
}

fun part1(input: List<String>): Int {
    val assignments = input.map { it.split(",").map { it.split("-") } }

    val assignmentRanges = assignments.map { it.map { (it[0].toInt()..it[1].toInt()).map { it } } }

    return assignmentRanges.fold(0) { acc, pairs ->
        val overlaps = pairs[0].intersect(pairs[1])

        if (overlaps.size >= pairs[0].size || overlaps.size >= pairs[1].size
        ) {
            acc + 1
        } else {
            acc
        }
    }
}

fun part2(input: List<String>): Int {
    return 0
}