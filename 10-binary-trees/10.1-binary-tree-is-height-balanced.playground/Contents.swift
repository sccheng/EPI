/**
 A binary tree is height-balanced if for each node in the tree, the difference in the height of its left and right subtrees is at most one. A perfect binary tree is height-balanced, as is a complete binary tree. A height-balanced binary tree does not have to perfect or complete.
 
 Write a program that takes as input the root of a binary tree and checks whether the tree is height-balanced.
 
 Hint: Think of a classic binary tree algorithm.
 */

class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(value: Int) {
        self.value = value
    }
}

func isBalanced(root: BinaryTreeNode) -> Bool {
    
    return false
}

