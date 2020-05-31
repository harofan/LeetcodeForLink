//
//  17.swift
//  LeetCode
//
//  Created by Link on 2020/5/31.
//  Copyright © 2020 Link. All rights reserved.
//

import Cocoa

class Solution17 {
    func letterCombinations(_ digits: String) -> [String] {
        
        guard digits.count > 0 else {
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
        
        let digitsStrArray = Array(digits)
        var resultArray = [[String]]()
        for c in digitsStrArray {
            let numberValue = Int(String(c)) ?? 0
            // 过滤
            guard data.keys.contains(numberValue) else {
                continue
            }
            
            resultArray.append(data[numberValue]!)
        }

        var resultStrArray = [String]()
        
        func dfs(_ result: String, _ enumIndex: Int) {
            guard enumIndex < resultArray.count else {
                resultStrArray.append(result)
                return
            }
            
            let resultSubStrArray = resultArray[enumIndex]
            for c in resultSubStrArray {
                dfs(result + String(c), enumIndex + 1)
            }
        }
        
        dfs("", 0)
        
        return resultStrArray
    }
}
