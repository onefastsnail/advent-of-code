package com.onefastsnail.day1

import com.onefastsnail.utils.readFile
import java.io.File

fun main() {
    val part1 = part1(readFile(File("src/main/kotlin/com/onefastsnail/day1/resources/input.txt").absolutePath))
    println("Part 1: $part1")

    val part2 = part2(readFile(File("src/main/kotlin/com/onefastsnail/day1/resources/input.txt").absolutePath))
    println("Part 2: $part2")
}

fun part1(input: List<String>): Int {
    val result = splitInput(input)
    val totals = result.map { it.sumOf { it.toInt() } }

    return totals.maxOf { it }
}

fun part2(input: List<String>): Int {
    val result = splitInput(input)
    val totals = result.map { it.sumOf { it.toInt() } }

    return totals.sortedDescending().take(3).sumOf { it }
}

private fun splitInput(input: List<String>): MutableList<MutableList<String>> {
    val result = input.fold(mutableListOf<MutableList<String>>()) { acc, element ->
        if (element.isNotBlank()) {
            acc.lastOrNull()?.add(element)
        } else {
            acc.add(mutableListOf())
        }
        acc
    }

    return result
}