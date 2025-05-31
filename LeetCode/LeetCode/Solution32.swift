//
//  Solution32.swift
//  LeetCode
//
//  Created by harofan on 2025/5/31.
//  Copyright © 2025 Link. All rights reserved.
//

import Foundation

class Solution32 {
    func longestValidParentheses(_ s: String) -> Int {
        let chars = Array(s)
        var stack = [-1] // 初始化栈底为-1，作为边界
        var maxLength = 0
        
        for i in 0..<chars.count {
            if chars[i] == "(" {
                // 遇到左括号，将其索引入栈
                stack.append(i)
            } else { // 遇到右括号
                // 弹出栈顶
                stack.removeLast()
                
                if stack.isEmpty {
                    // 栈空了，说明右括号多了，将当前位置入栈作为新的边界
                    stack.append(i)
                } else {
                    // 计算当前有效括号串的长度：当前位置 - 栈顶位置
                    let currLength = i - stack.last!
                    maxLength = max(maxLength, currLength)
                }
            }
        }
        return maxLength
    }
}
