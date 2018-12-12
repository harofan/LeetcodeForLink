//
//  twoSum.swift
//  Leetcode
//
//  Created by Link on 2018/12/12.
//  Copyright © 2018 dadaabc. All rights reserved.
//

import Foundation

//https://leetcode-cn.com/problems/two-sum/
/*
给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。

示例:

给定 nums = [2, 7, 11, 15], target = 9

因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]
*/

//执行用时: 500 ms, 在Two Sum的Swift提交中击败了43.63% 的用户
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
        let subNumber = target - nums[i]
        //这里优化了下,本质上还是两遍遍历
        for j in (i+1)..<nums.count {
            if subNumber == nums[j] {
                return [i, j]
            }
        }
    }
    return []
}

//执行用时: 716 ms, 在Two Sum的Swift提交中击败了28.53% 的用户
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
        let number = nums[i]
        let subNumber = target - number
        for j in 0..<nums.count {
            let tempNum = nums[j]
            if tempNum == subNumber, j != i {
                return [i, j]
            }
        }
    }
    return []
}
