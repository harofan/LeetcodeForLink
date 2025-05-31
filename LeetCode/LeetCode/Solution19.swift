//
//  Solution19.swift
//  LeetCode
//
//  Created by harofan on 2025/5/31.
//  Copyright © 2025 Link. All rights reserved.
//

import Foundation

class Solution19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy: ListNode? = ListNode(0)
        dummy?.next = head
        var leftNode = dummy
        var rightNode = dummy
        // 快慢指针, 快指针先走n+1步, 因为要删除倒数第n个节点, 所以需要走n+1步, 否则快指针走到最后, 慢指针还没走到倒数第n个节点
        for _ in 0..<n+1 {
            rightNode = rightNode?.next
        }
        // 快慢指针一起走, 直到快指针走到最后
        while rightNode != nil {
            rightNode = rightNode?.next
            leftNode = leftNode?.next
        }
        // 删除倒数第n个节点
        leftNode?.next = leftNode?.next?.next
        return dummy?.next
    }
}
