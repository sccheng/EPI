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

func isBalanced(root: BinaryTreeNode?) -> Bool {
    return isBalancedOptimized(root: root).balanced
    //return isBalancedInitial(root: root)
}

// intial implementation
func isBalancedInitial(root: BinaryTreeNode?) -> Bool {
    guard let root = root else {
        return true
    }
    
    let left = height(root.left, 0)
    let right = height(root.right, 0)
    
    return abs(left - right) <= 1
}

func height(_ node: BinaryTreeNode?, _ currentHeight: Int) -> Int {
    guard let node = node else {
        return currentHeight + 1
    }
    return max(height(node.left, currentHeight + 1), height(node.right, currentHeight + 1))
}

// Optimized implementation
func isBalancedOptimized(root: BinaryTreeNode?) -> BalanceStatusWithHeight {
    guard let root = root else {
         return BalanceStatusWithHeight(balanced: true, height: -1)
    }
    
    let leftStatus = isBalancedOptimized(root: root.left)
    if !leftStatus.balanced {
        return leftStatus
    }
    
    let rightStatus = isBalancedOptimized(root: root.right)
    if !rightStatus.balanced {
        return rightStatus
    }
    
    let isBalanced = abs(leftStatus.height - rightStatus.height) <= 1
    let height = max(leftStatus.height, rightStatus.height) + 1
    return BalanceStatusWithHeight(balanced: isBalanced, height: height)
}

struct BalanceStatusWithHeight {
    var balanced: Bool
    var height: Int
}

// Testing
let root = BinaryTreeNode(value: 3)
let l1 = BinaryTreeNode(value: 1)
let l2 = BinaryTreeNode(value: 2)
let r1 = BinaryTreeNode(value: 4)

assert(true == isBalanced(root: nil))
assert(true == isBalanced(root: root))

root.left = l2
assert(true == isBalanced(root: root))

l2.left = l1
assert(false == isBalanced(root: root))

root.right = r1
assert(true == isBalanced(root: root))
