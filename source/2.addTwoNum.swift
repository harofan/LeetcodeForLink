//
//  addTwoSum.swift
//  Leetcode
//
//  Created by fanyang on 2018/12/12.
//  Copyright © 2018 dadaabc. All rights reserved.
//

import Foundation

// https://leetcode-cn.com/problems/add-two-numbers/

/*
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
// 执行用时: 80 ms, 在Add Two Numbers的Swift提交中击败了98.39% 的用户
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

    var tempNode1 = l1
    var tempNode2 = l2
    var tempNode: ListNode?
    var isNeedAddOne = false
    var node: ListNode?

    while tempNode1 != nil || tempNode2 != nil || isNeedAddOne {
        let num1 = tempNode1?.val ?? 0
        let num2 = tempNode2?.val ?? 0
        
        let oneNum = isNeedAddOne ? 1 : 0
        isNeedAddOne = false
        
        tempNode1 = tempNode1?.next
        tempNode2 = tempNode2?.next
        
        let caculateNode: ListNode
        if num1 + num2 + oneNum > 9 {
            //进位
            caculateNode = ListNode(num1 + num2 + oneNum - 10 )
            isNeedAddOne = true
        } else {
            caculateNode = ListNode(num1 + num2 + oneNum)
        }
        
        if tempNode == nil {
            node = caculateNode
            tempNode = caculateNode
        } else {
            tempNode?.next = caculateNode
            tempNode = caculateNode
        }

    }
    
    return node
}

let node1 = ListNode(2)
let node2 = ListNode(4)
let node3 = ListNode(3)
node2.next = node3
node1.next = node2

let node4 = ListNode(5)
let node5 = ListNode(6)
let node6 = ListNode(4)
let node7 = ListNode(2)
node6.next = node7
node5.next = node6
node4.next = node5

print(addTwoNumbers(node1, node4))
