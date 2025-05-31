//
//  Solution7.swift
//  LeetCode
//
//  Created by harofan on 2025/5/31.
//  Copyright © 2025 Link. All rights reserved.
//

import Foundation

class Solution7 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        let sortNums = nums.sorted(by: <)
        var result = [[Int]]()
        for i in 0..<sortNums.count {
            guard sortNums[i] <= 0 else {
                return result
            }
            if i != 0, sortNums[i - 1] == sortNums[i] {
                continue
            }
            var left = i + 1, right = sortNums.count - 1
            while left < right {
                let iValue = sortNums[i], leftValue = sortNums[left], rightValue = sortNums[right]
                let sum = iValue + leftValue + rightValue
                if sum == 0 {
                    result.append([iValue, leftValue, rightValue])
                    while left < right && sortNums[left] == sortNums[left + 1] {
                        left += 1
                    }
                    // 跳过重复的右指针值
                    while left < right && sortNums[right] == sortNums[right - 1] {
                        right -= 1
                    }
                    left += 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return result
    }
}
