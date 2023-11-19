package com.onefastsnail.day3

import com.onefastsnail.utils.readFile
import java.io.File

fun main() {
    val part1 = part1(readFile(File("src/main/kotlin/com/onefastsnail/day3/resources/input.txt").absolutePath))
    println("Part 1: $part1")

    val part2 = part2(readFile(File("src/main/kotlin/com/onefastsnail/day3/resources/input.txt").absolutePath))
    println("Part 2: $part2")
}

fun part1(input: List<String>): Int {
    val rucksacks = input.map { it.toCharArray().map { it }.chunked(it.length / 2) }

    val itemMatches = rucksacks.map { it[0].intersect(it[1]) }

    val itemMatchesPriorities = mapToPriorityValue(itemMatches)

    return itemMatchesPriorities.flatten().sumOf { it }
}

fun part2(input: List<String>): Int {
    val rucksacks = input.map { it.toCharArray().map { it } }.chunked(3)

    val itemMatches = rucksacks.fold(mutableListOf<Set<Char>>()) { acc, it ->
        var firstGroupMatches = it[0].intersect(it[1])
        var secondGroupMatches = firstGroupMatches.intersect(it[2])
        acc.add(secondGroupMatches)
        acc
    }

    val itemMatchesPriorities = mapToPriorityValue(itemMatches)

    return itemMatchesPriorities.flatten().sumOf { it }
}

fun mapToPriorityValue(matches: List<Set<Char>>): List<List<Int>> {
    return matches.map {
        it.map {
            if (it.isUpperCase()) {
                alphabet[it.lowercaseChar()]!! + 26
            } else {
                alphabet[it.lowercaseChar()]!!
            }
        }
    }
}

val alphabet = ('a'..'z').withIndex().associate { it.value to it.index + 1 }
