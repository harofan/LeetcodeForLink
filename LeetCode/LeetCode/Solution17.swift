//
//  Solution17.swift
//  LeetCode
//
//  Created by harofan on 2025/5/31.
//  Copyright © 2025 Link. All rights reserved.
//

import Foundation

class Solution17 {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return []
        }
        
        let data = [
            2: ["a", "b", "c"],
            3: ["d", "e", "f"],
            4: ["g", "h", "i"],
            5: ["j", "k", "l"],
            6: ["m", "n", "o"],
            7: ["p", "q", "r", "s"],
            8: ["t", "u", "v"],
            9: ["w", "x", "y", "z"]
        ]
        
        // 初始结果集为一个空字符串
        var result = [""]
        
        // 遍历每个数字
        for digit in digits {
            let numberValue = Int(String(digit)) ?? 0
            
            // 过滤无效数字
            guard let letters = data[numberValue] else {
                continue
            }
            
            // 保存当前结果
            var newResult = [String]()
            
            // 对每个当前结果，添加新数字对应的每个字母
            for str in result {
                for letter in letters {
                    newResult.append(str + letter)
                }
            }
            
            // 更新结果
            result = newResult
        }
        
        return result
    }
}
