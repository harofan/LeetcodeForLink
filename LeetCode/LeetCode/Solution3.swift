//
//  Solution3.swift
//  LeetCode
//
//  Created by harofan on 2025/5/31.
//  Copyright © 2025 Link. All rights reserved.
//

import Foundation

class Solution3 {
    // https://leetcode.cn/problems/longest-substring-without-repeating-characters/?envType=problem-list-v2&envId=2cktkvj
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var longest = 0
        var charIndexMap = [Character: Int]() // 记录每个字符最后出现的位置
        let charArray = Array(s)
        var left = 0 // 滑动窗口左边界
        
        for right in 0..<charArray.count {
            let currentChar = charArray[right]
            // 如果当前字符在窗口中已存在，移动左边界到重复字符的下一位置
            if let prevIndex = charIndexMap[currentChar], prevIndex >= left {
                left = prevIndex + 1
            }
            // 更新当前字符的位置
            charIndexMap[currentChar] = right
            // 更新最长长度
            longest = max(longest, right - left + 1)
        }
        
        return longest
    }
}
