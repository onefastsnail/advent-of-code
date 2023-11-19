package com.onefastsnail.day3

import com.onefastsnail.utils.readFile
import java.io.File

fun main() {
    val part1 = part1(readFile(File("src/main/kotlin/com/onefastsnail/day3/resources/input.txt").absolutePath))
    println("Part 1: $part1")

//    val part2 = part2(readFile(File("src/main/kotlin/com/onefastsnail/day3/resources/input.txt").absolutePath))
//    println("Part 2: $part2")
}

fun part1(input: List<String>): Int {
    val rucksacks = input.map { it.toCharArray().map { it }.chunked(it.length / 2) }

    val itemMatches = rucksacks.map { it[0].intersect(it[1]) }

    val itemMatchesPriorities = itemMatches.map {
        it.map {
            if (it.isUpperCase()) {
                alphabet[it.lowercaseChar()]!! + 26
            } else {
                alphabet[it.lowercaseChar()]!!
            }
        }
    }

    return itemMatchesPriorities.flatten().sumOf { it }
}

fun part2(input: List<String>): Int {
    return 0
}

val alphabet = ('a'..'z').withIndex().associate { it.value to it.index + 1 }
