package com.onefastsnail.day2

import com.onefastsnail.utils.readFileLines
import java.io.File

fun main() {
    val part1 = part1(readFileLines(File("src/main/kotlin/com/onefastsnail/day2/resources/input.txt").absolutePath))
    println("Part 1: $part1")

    val part2 = part2(readFileLines(File("src/main/kotlin/com/onefastsnail/day2/resources/input.txt").absolutePath))
    println("Part 2: $part2")
}

fun part1(input: List<String>): Int {
    val hands = input.map { it.split(" ") }
    val results = hands.map { Pair(myHand[it[1]]!!, whoWon(opponentHand[it[0]]!!, myHand[it[1]]!!)) }

    return results.fold(0) { acc, result ->
        acc + resultScores[result.second]!! + handValues[result.first]!!
    }
}

fun part2(input: List<String>): Int {
    val hands = input.map { it.split(" ") }
    val results = hands.map {
        var myHand = whatHandIsNeededForResult(opponentHand[it[0]]!!, myResultNeeded[it[1]]!!)
        Pair(
            myHand,
            whoWon(opponentHand[it[0]]!!, myHand)
        )
    }

    return results.fold(0) { acc, result ->
        acc + resultScores[result.second]!! + handValues[result.first]!!
    }
}

fun whoWon(player1: Hand, player2: Hand): Result {
    // Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock
    when (player1) {
        Hand.Rock -> {
            if (player2 == Hand.Paper) {
                return Result.Player2
            }
            if (player2 == Hand.Scissors) {
                return Result.Player1
            }
        }

        Hand.Paper -> {
            if (player2 == Hand.Rock) {
                return Result.Player1
            }
            if (player2 == Hand.Scissors) {
                return Result.Player2
            }
        }

        Hand.Scissors -> {
            if (player2 == Hand.Rock) {
                return Result.Player2
            }
            if (player2 == Hand.Paper) {
                return Result.Player1
            }
        }
    }

    return Result.Draw
}

fun whatHandIsNeededForResult(player1: Hand, neededResult: Result): Hand {
    // Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock
    when (neededResult) {
        Result.Player1 -> {
            return when (player1) {
                Hand.Rock -> Hand.Scissors
                Hand.Paper -> Hand.Rock
                Hand.Scissors -> Hand.Paper
            }
        }

        Result.Player2 -> {
            return when (player1) {
                Hand.Rock -> Hand.Paper
                Hand.Paper -> Hand.Scissors
                Hand.Scissors -> Hand.Rock
            }
        }

        Result.Draw -> {
            return player1
        }
    }
}

enum class Hand {
    Rock, Paper, Scissors
}

enum class Result {
    Player1, Player2, Draw
}

val handValues = mapOf(
    Hand.Rock to 1,
    Hand.Paper to 2,
    Hand.Scissors to 3,
)

val opponentHand = mapOf(
    "A" to Hand.Rock,
    "B" to Hand.Paper,
    "C" to Hand.Scissors
)

val myHand = mapOf(
    "X" to Hand.Rock,
    "Y" to Hand.Paper,
    "Z" to Hand.Scissors
)

val resultScores = mapOf(
    Result.Player1 to 0,
    Result.Player2 to 6,
    Result.Draw to 3
)

val myResultNeeded = mapOf(
    "X" to Result.Player1,
    "Y" to Result.Draw,
    "Z" to Result.Player2
)