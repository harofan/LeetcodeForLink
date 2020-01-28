//
//  DynamicArray.swift
//  Test
//
//  Created by Link on 2020/1/28.
//  Copyright © 2020 Link. All rights reserved.
//

import Foundation

protocol DynamicArrayable {
    associatedtype E: Equatable
    var pArray: [E?] { set get }
    
    func size() -> Int
    func isEmpty() -> Bool
    func contains(element: E) -> Bool
    func get(index: Int) -> E
    mutating func set(index: Int, element: E)
    mutating func insert(index: Int, element: E)
    @discardableResult mutating func remove(index: Int) -> E
    func indexOf(element: E) -> Int?
    mutating func clear()
}

extension DynamicArrayable {
    
    func size() -> Int {
        pArray.count
    }
    
    func isEmpty() -> Bool {
        size() == 0
    }
    
    func contains(element: E) -> Bool {
        for e in pArray where e! == element {
            return true
        }
        return false
    }
    
    func get(index: Int) -> E {
        pArray[index]!
    }
    
    mutating func set(index: Int, element: E) {
        pArray[index] = element
    }
    
    mutating func insert(index: Int, element: E) {
        // 这里可能需要对数据进行扩容, 但swift没这个机制所以就简单的写一下
        pArray.insert(element, at: index)
    }
    
    @discardableResult mutating func remove(index: Int) -> E {
        pArray.remove(at: index)!
    }
    
    func indexOf(element: E) -> Int? {
        for (index, e) in pArray.enumerated() where e! == element {
            return index
        }
        return nil
    }
    
    mutating func clear() {
        pArray = []
    }
}

struct DynamicArray<T: Equatable>: DynamicArrayable {
    typealias E = T
    private var pArray: [T?]
}
