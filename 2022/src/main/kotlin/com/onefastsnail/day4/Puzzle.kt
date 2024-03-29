package com.onefastsnail.day4

import com.onefastsnail.utils.readFileLines
import java.io.File

fun main() {
    val part1 = part1(readFileLines(File("src/main/kotlin/com/onefastsnail/day4/resources/input.txt").absolutePath))
    println("Part 1: $part1")

    val part2 = part2(readFileLines(File("src/main/kotlin/com/onefastsnail/day4/resources/input.txt").absolutePath))
    println("Part 2: $part2")
}

fun part1(input: List<String>): Int {
    val assignmentPairs = convertToAssignmentsPairs(input)

    val assignmentRanges = assignmentPairs.map { it.map { (it[0]..it[1]).map { it } } }

    return assignmentRanges.fold(0) { acc, pairs ->
        val overlaps = pairs[0].intersect(pairs[1])

        if (overlaps.size >= pairs[0].size || overlaps.size >= pairs[1].size) {
            acc + 1
        } else {
            acc
        }
    }
}

fun part2(input: List<String>): Int {
    val assignmentPairs = convertToAssignmentsPairs(input)

    val assignmentRanges = assignmentPairs.map { it.map { (it[0]..it[1]).map { it } } }

    return assignmentRanges.fold(0) { acc, pairs ->
        val overlaps = pairs[0].intersect(pairs[1])

        if (overlaps.isNotEmpty()) {
            acc + 1
        } else {
            acc
        }
    }
}

private fun convertToAssignmentsPairs(input: List<String>): List<List<List<Int>>> {
    return input.map { it.split(",").map { it.split("-").map { it.toInt() } } }
}