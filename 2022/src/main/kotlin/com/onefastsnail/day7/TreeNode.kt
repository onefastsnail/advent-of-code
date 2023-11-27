package com.onefastsnail.day7

enum class TreeNodeType {
    FOLDER,
    FILE
}

class TreeNode(val type: TreeNodeType, val name: String, val size: Int? = null) {

    var children: List<TreeNode> = mutableListOf()

    fun addChildren(child: TreeNode): TreeNode {
        children = children + child
        return this
    }

    fun addChildren(childNames: List<String>, parent: TreeNode): TreeNode {
        if (childNames.isEmpty()) {
            return parent
        }

        val start = childNames.first()
        val child = parent.findChild(start)

        if (child == null) {
            val newParent = TreeNode(TreeNodeType.FOLDER, start)

            parent.addChildren(newParent)

            return addChildren(childNames.drop(1), newParent)
        }

        return addChildren(childNames.drop(1), child)
    }

    private fun findChild(name: String): TreeNode? {
        return children.find { it.name == name }
    }
}