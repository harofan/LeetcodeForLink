//
//  Solution6.swift
//  LeetCode
//
//  Created by harofan on 2025/5/31.
//  Copyright © 2025 Link. All rights reserved.
//

import Foundation

class Solution6 {
    func maxArea(_ height: [Int]) -> Int {
        if height.count < 2 {
            return 0
        }
        var left = 0, right = height.count - 1
        var result = 0
        while left != right {
            let currentArea = min(height[left], height[right]) * (right - left)
            result = max(currentArea, result)
            if height[left] > height[right] {
                right -= 1
            } else {
                left += 1
            }
        }
        return result
    }
}
