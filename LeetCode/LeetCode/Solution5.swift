//
//  Solution5.swift
//  LeetCode
//
//  Created by harofan on 2025/5/31.
//  Copyright © 2025 Link. All rights reserved.
//

import Foundation

class Solution5 {
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        let charArray = Array(s)
        var result = ""
        for i in 0..<(s.count - 1) {
            // 中心发散
            let result1 = findMaxlongestPalindrome(charArray, leftStartIndex: i, rightStartIndex: i)
            // 对称发散
            let result2 = findMaxlongestPalindrome(charArray, leftStartIndex: i, rightStartIndex: i + 1)
            let caculateResult = result1.count > result2.count ? result1 : result2
            result = result.count > caculateResult.count ? result : caculateResult
        }
        return result
    }
    
    func findMaxlongestPalindrome(_ s: [Character], leftStartIndex: Int, rightStartIndex: Int) -> String {
        var left = leftStartIndex, right = rightStartIndex
        var result = ""
        // 对称传进来不是空串的话直接return
        if (left != right && s[left] != s[right]) {
            return ""
        }
        while left >= 0, right < s.count {
            if left == right, s[left] == s[right] {
                result = "\(s[left])"
                left -= 1
                right += 1
                continue
            }
            if s[left] != s[right] {
                return result
            }
            result = "\(s[left])\(result)\(s[right])"
            left -= 1
            right += 1
        }
        return result
    }
}
