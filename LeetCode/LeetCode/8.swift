//
//  8.swift
//  LeetCode
//
//  Created by Link on 2020/5/30.
//  Copyright © 2020 Link. All rights reserved.
//

import Cocoa

// https://leetcode-cn.com/problems/string-to-integer-atoi/solution/
// 字符串转换整数 (atoi)
class Solution8 {
    enum FirstValueType {
        case noteFound
        case number
        case signed
    }
    
    func myAtoi(_ str: String) -> Int {
        let numberArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        let signArray = ["+", "-"]
        let space = " "
        var resultStr = ""
        
        let mergeArray = [numberArray, signArray, [space]].flatMap { $0 }
        
        var firstStrState = FirstValueType.noteFound
        var isGreatThan0 = true
        
        for c in Array(str) {
            let subStr = String(c)
            
            // 其他情况
            if !mergeArray.contains(subStr) {
                break
            }
            
            // 开头的0跳跃处理
            if subStr == "0", resultStr.count == 0 {
                firstStrState = .number
                continue
            }
            
            // 空格处理
            if subStr == space, firstStrState == .noteFound {
                continue
                // 第一位已经是数字或者符号时
            } else if subStr == space, firstStrState != .noteFound {
                break
            }
            
            // 符号处理
            if signArray.contains(subStr), firstStrState == .noteFound {
                firstStrState = .signed
                isGreatThan0 = subStr == "+" ? true : false
                continue
            } else if signArray.contains(subStr), firstStrState != .noteFound {
                // 符号已有
                break
            }
            
            // 数字处理
            if numberArray.contains(subStr) {
                firstStrState = .number
                resultStr += subStr
            }
        }
        
        let result = Int32(resultStr) ?? 0
        if result == 0, resultStr.count > 0 {
            return isGreatThan0 ? Int(Int32.max) : Int(Int32.min)
        }
        return Int(isGreatThan0 ? result : -result)
    }
}
