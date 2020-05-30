//
//  11.swift
//  LeetCode
//
//  Created by Link on 2020/5/31.
//  Copyright © 2020 Link. All rights reserved.
//

import Cocoa

// https://leetcode-cn.com/problems/container-with-most-water/
class Solution11 {
    func maxArea(_ height: [Int]) -> Int {
        
        func caculateArea(leftIndex: Int, rightIndex: Int) -> Int {
            return min(height[leftIndex], height[rightIndex]) * (rightIndex - leftIndex)
        }
        
        var i = 0
        var j = height.count - 1
        var maxArea = caculateArea(leftIndex: i, rightIndex: j)
        while i < j {
            if height[i] < height[j] {
                i += 1
            } else {
                j -= 1
            }
            let cirrentArea = caculateArea(leftIndex: i, rightIndex: j)
            maxArea = max(maxArea, cirrentArea)
        }
        
        return maxArea
    }
}
