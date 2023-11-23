package com.onefastsnail.day5

import com.onefastsnail.utils.readFileLines
import java.io.File

fun main() {
    val part1 = part1(readFileLines(File("src/main/kotlin/com/onefastsnail/day5/resources/input.txt").absolutePath))
    println("Part 1: $part1")

    val part2 = part2(readFileLines(File("src/main/kotlin/com/onefastsnail/day5/resources/input.txt").absolutePath))
    println("Part 2: $part2")
}

fun part1(input: List<String>): String {
    val stacksAndMoves = getStackAndMoves(input)

    val updatedStacks =
        stacksAndMoves.first.fold(stacksAndMoves.second.map { it.toMutableList() }.toMutableList()) { acc, move ->
            // Crates we need to move, in order of how they would be stacked
            var crates = acc.getOrNull(move.second - 1)?.take(move.first)?.asReversed() ?: emptyList()

            // Stack we need to remove crates from
            acc.get(move.second - 1)?.let { list ->
                acc[move.second - 1] = list.drop(move.first).toMutableList()
            }

            // Stack we need to add crates to
            acc.getOrNull(move.third - 1)?.addAll(0, crates)

            acc
        }

    return updatedStacks.map { it.take(1) }.flatten().joinToString("")
}

fun part2(input: List<String>): String {
    val stacksAndMoves = getStackAndMoves(input)

    val updatedStacks =
        stacksAndMoves.first.fold(stacksAndMoves.second.map { it.toMutableList() }.toMutableList()) { acc, move ->
            // Crates we need to move, in order of how they would be stacked
            var crates = acc.getOrNull(move.second - 1)?.take(move.first) ?: emptyList()

            // Stack we need to remove crates from
            acc.get(move.second - 1)?.let { list ->
                acc[move.second - 1] = list.drop(move.first).toMutableList()
            }

            // Stack we need to add crates to
            acc.getOrNull(move.third - 1)?.addAll(0, crates)

            acc
        }

    return updatedStacks.map { it.take(1) }.flatten().joinToString("")
}

fun getStackAndMoves(input: List<String>): Pair<List<Triple<Int, Int, Int>>, MutableList<MutableList<String>>> {
    val stacks = input.filter { it.contains("[") }.map {
        it.chunked(4).map {
            it.firstOrNull { it.isLetter() }
        }
    }

    val x = "hello"

    val verticalStacks = stacks.fold(mutableListOf<MutableList<String>>()) { acc, crates ->
        crates.mapIndexed { index, crate ->
            acc.getOrNull(index) ?: acc.add(mutableListOf())
            crate?.toString()?.let { acc.getOrNull(index)?.add(it) }
        }

        acc
    }

    val moves = input.filter { it.startsWith("move") }.mapNotNull { line ->
        val regex = """move (\d+) from (\d+) to (\d+)""".toRegex()
        val match = regex.find(line)

        match?.destructured?.let { (move, stackFrom, stackTo) ->
            Triple(move.toInt(), stackFrom.toInt(), stackTo.toInt())
        }
    }

    return Pair(moves, verticalStacks)
}