package com.onefastsnail.day7

fun printTree(node: TreeNode, depth: Int) {
    println("${" ".repeat(depth)}${node.name}")
    node.children.forEach { printTree(it, depth + 1) }
}

fun getFolderSizes(fileTree: TreeNode): Map<String, Int> {
    val folderSizes = mutableMapOf<String, Int>().withDefault { 0 }

    fun calculateSize(node: TreeNode, parentName: String): Int {
        if (node.type == TreeNodeType.FILE) {
            return node.size!!
        }

        val folderSize = node.children.sumOf {
            calculateSize(
                it,
                listOf(parentName, node.name, it.name).joinToString(separator = "/")
            )
        }

        folderSizes[listOf(parentName, node.name).joinToString(separator = "/")] = folderSize

        return folderSize
    }

    calculateSize(fileTree, fileTree.name)

    return folderSizes
}

private fun countFileSizes(treeNode: TreeNode): Int {
    return treeNode.children.sumOf { node ->
        when (node.type) {
            TreeNodeType.FOLDER -> countFileSizes(node)
            TreeNodeType.FILE -> node.size ?: 0
        }
    }
}