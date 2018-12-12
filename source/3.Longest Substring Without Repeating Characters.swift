//
//  Longest Substring Without Repeating Characters.swift
//  Leetcode
//
//  Created by fanyang on 2018/12/12.
//  Copyright © 2018 dadaabc. All rights reserved.
//

import Foundation

//https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution/

/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:
 
 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:
 
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
 请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    var longest = 0, left = 0, set = Set<Character>()
    let sChars = Array(s)
    
    for (i, char) in sChars.enumerated() {
        //如果集合中有这个字母
        if set.contains(char) {
            
            //求出当前串和上一次的字符串哪一个更长
            longest = max(longest, i - left)
            
            //当字符串最左边的字符串与当前遍历的字符不相等时,将这个字符从集合中移除,同时将头index偏移,直到二者相等
            while sChars[left] != char {
                set.remove(sChars[left])
                left += 1
            }
            
            //计算完成后将字符串的起点加一
            left += 1
            
        } else {
            set.insert(char)
        }
    }
    
    return max(longest, sChars.count - left)
}
print(lengthOfLongestSubstring("pwwkew"))

