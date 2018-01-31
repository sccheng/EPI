// Write a program that takes two singly linked lists, assumed to be sorted, and returns their merge. The only field your program can change in a node is its next field.
// Hint: Two sorted arrays can be merged using two indices. For lists, take care when one iterator reaches the end.

class ListNode<T> {
    var value: T
    var next: ListNode?
    
    init(value: T) {
        self.value = value
    }
}

func mergeTwoSortedLists(l1: ListNode<Int>?, l2: ListNode<Int>?) -> ListNode<Int>? {
    var result = ListNode(value: 0)
    var current = result
    var node1 = l1
    var node2 = l2
    
    while node1 != nil && node2 != nil {
        if node1!.value < node2!.value {
            current.next = node1
            node1 = node1!.next
        } else {
            current.next = node2
            node2 = node2!.next
        }
        current = current.next!
    }
    current.next = node1 ?? node2
    
    return result.next
}

// Testing
let node1a = ListNode(value: 2)
let node1b = ListNode(value: 5)
let node1c = ListNode(value: 7)
node1a.next = node1b
node1b.next = node1c
let node2a = ListNode(value: 3)
let node2b = ListNode(value: 11)
node2a.next = node2b
printNodes(mergeTwoSortedLists(l1: node1a, l2: node2a))

let node3a = ListNode(value: 3)
let node3b = ListNode(value: 11)
node3a.next = node3b
printNodes(mergeTwoSortedLists(l1: nil, l2: node3a))
printNodes(mergeTwoSortedLists(l1: node3a, l2: nil))

func printNodes(_ list: ListNode<Int>?) {
    var node = list
    while node != nil {
        print("\(node!.value)")
        node = node!.next
    }
    print()
}
