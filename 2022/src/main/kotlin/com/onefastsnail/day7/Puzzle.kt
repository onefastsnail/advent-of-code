package com.onefastsnail.day7

import com.onefastsnail.utils.readFileLines
import java.io.File

fun main() {
    val part1 = part1(readFileLines(File("src/main/kotlin/com/onefastsnail/day7/resources/input.txt").absolutePath))
    println("Part 1: $part1")

    val part2 = part2(readFileLines(File("src/main/kotlin/com/onefastsnail/day7/resources/input.txt").absolutePath))
    println("Part 2: $part2")
}

fun part1(input: List<String>): Int {
    val fileTree = buildFileTree(input)
    val folderSizes = getFolderSizes(fileTree)

    return folderSizes.filter { it.value <= 100000 }.map { it.value }.sumOf { it }
}


fun part2(input: List<String>): Int {
    return 0
}

data class Command(val command: String, val args: String?)

data class CommandResult(var path: String, var previousCommand: Command, var files: List<DataFile>)

data class DataFile(val name: String, val path: String, val size: Int)

fun buildFileTree(input: List<String>): TreeNode {
    // Make a flat list of files with absolute paths
    val result = input.fold(CommandResult("", Command("", ""), emptyList())) { acc, line ->
        if (acc.previousCommand.command == "ls" && !line.startsWith("$")) {
            val fileSplit = line.split(" ")
            if (fileSplit.first() != "dir") {
                acc.files += DataFile(fileSplit.last(), acc.path, fileSplit.first().toInt())
            }
        }

        if (line.startsWith("$")) {
            val commandSplit = line.drop(2).split(" ")
            val currentCommand = Command(commandSplit.first(), commandSplit.last())

            when (currentCommand.command) {
                "cd" -> {
                    when (currentCommand.args) {
                        "/" -> acc.path = "/"
                        ".." -> acc.path = removeLastSegment(acc.path)
                        else -> acc.path += currentCommand.args + "/"
                    }
                }
            }

            acc.previousCommand = currentCommand
        }

        acc
    }

    val fileTree = result.files.fold(TreeNode(TreeNodeType.FOLDER, "/")) { tree, file ->
        // Get paths of nodes
        val pathNames = file.path.split("/").filter { it.isNotEmpty() }

        // Create folders down the tree
        val parent = tree.addChildren(pathNames, tree)

        // Then add the file to the final folder parent
        parent.addChildren(TreeNode(TreeNodeType.FILE, file.name, file.size))

        tree
    }

    return fileTree
}

fun removeLastSegment(input: String): String {
    val lastSlashIndex = input.dropLastWhile { it == '/' }.lastIndexOf('/')
    return if (lastSlashIndex >= 0) {
        input.substring(0, lastSlashIndex + 1)
    } else {
        input
    }
}