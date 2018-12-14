//
//  median of two sorted arrays.swift
//  Leetcode
//
//  Created by Link on 2018/12/12.
//  Copyright © 2018 dadaabc. All rights reserved.
//

import Foundation

// https://leetcode-cn.com/problems/median-of-two-sorted-arrays/

/*
 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。
 
 请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
 
 你可以假设 nums1 和 nums2 不会同时为空。
 
 示例 1:
 
 nums1 = [1, 3]
 nums2 = [2]
 
 则中位数是 2.0
 示例 2:
 
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 则中位数是 (2 + 3)/2 = 2.5
 */

// 其实没达到题的要求,时间复杂度是(M + N)/2
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let nums1Count = nums1.count
    let nums2Count = nums2.count
    let sumCount = nums1Count + nums2Count
    
    //确保num1的数量比num2小
    guard nums1Count <= nums2Count else {
        return findMedianSortedArrays(nums2, nums1)
    }
    
    //确保num1的数量不为0
    guard nums1Count != 0 else {
        if nums2Count % 2 == 0 {
            return Double((nums2[(sumCount / 2) - 1] + nums2[sumCount / 2])) / 2.0
        } else {
            return Double(nums2[sumCount / 2])
        }
    }
    
    //中位数下标奇数时使用leftIndex
    let leftIndex: Int
    var rightIndex: Int?
    
    if sumCount % 2 == 0 {
        // 偶数
        leftIndex = (sumCount / 2) - 1
        rightIndex = leftIndex + 1
    } else {
        // 奇数
        leftIndex = sumCount / 2
    }
    
    //遍历时的头指针
    var nums1Head = 0
    var nums2Head = 0
    
    //标记某一个数组是否已经遍历完毕
    var nums1Finish = false
    var nums2Finish = false
    
    var sortArray: [Int] = []
    for _ in 0...(leftIndex + 1) {
        
        //判断当前头指针下的数字哪个大
        if nums1[nums1Head] <= nums2[nums2Head] {
            
            //当数组达到尽头后,添加完当前数组最后一个元素之后,全部添加另外一个数组,这里性能可以再优化一点,
            //不需要在判断大小
            guard (nums1Head + 1) != nums1Count else {
                
                guard nums1Finish else {
                    sortArray.append(nums1[nums1Head])
                    nums1Finish = true
                    continue
                }
                sortArray.append(nums2[nums2Head])
                nums2Head += 1
                continue
            }
            sortArray.append(nums1[nums1Head])
            nums1Head += 1
        } else {
            guard (nums2Head + 1) != nums2Count else {
                
                guard nums2Finish else {
                    sortArray.append(nums2[nums2Head])
                    nums2Finish = true
                    continue
                }
                sortArray.append(nums1[nums1Head])
                nums1Head += 1
                continue
            }
            sortArray.append(nums2[nums2Head])
            nums2Head += 1
        }
    }
    
    if rightIndex != nil {
        return Double((sortArray[leftIndex] + sortArray[rightIndex!])) / 2.0
    } else {
        return Double(sortArray[leftIndex])
    }
}

print(findMedianSortedArrays([1, 2, 3, 4, 5, 6], [3, 4]))
