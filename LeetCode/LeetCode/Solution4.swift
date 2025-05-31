//
//  Solution4.swift
//  LeetCode
//
//  Created by harofan on 2025/5/31.
//  Copyright © 2025 Link. All rights reserved.
//

import Foundation

class Solution4 {
    // https://leetcode.cn/problems/median-of-two-sorted-arrays/?envType=problem-list-v2&envId=2cktkvj
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let nums1Count = nums1.count
        let nums2Count = nums2.count
        let needMergeCount = (nums1Count + nums2Count) / 2 + 1
        var nums1Index = 0, nums2Index = 0
        var mergeArray = [Int]()
        
        // 当两个数组都还有元素时
        while nums1Index < nums1Count && nums2Index < nums2Count {
            if nums1[nums1Index] <= nums2[nums2Index] {
                mergeArray.append(nums1[nums1Index])
                nums1Index += 1
            } else {
                mergeArray.append(nums2[nums2Index])
                nums2Index += 1
            }
            if mergeArray.count == needMergeCount {
                break
            }
        }
        
        // 处理nums1中剩余的元素
        while nums1Index < nums1Count && mergeArray.count < needMergeCount {
            mergeArray.append(nums1[nums1Index])
            nums1Index += 1
        }
        
        // 处理nums2中剩余的元素
        while nums2Index < nums2Count && mergeArray.count < needMergeCount {
            mergeArray.append(nums2[nums2Index])
            nums2Index += 1
        }
        
        // 判断总长度是奇数还是偶数
        if (nums1Count + nums2Count) % 2 == 0 {
            return Double(mergeArray[needMergeCount - 1] + mergeArray[needMergeCount - 2]) / 2.0
        } else {
            return Double(mergeArray[needMergeCount - 1])
        }
    }
}
