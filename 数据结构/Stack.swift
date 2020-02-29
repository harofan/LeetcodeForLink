//
//  Stack.swift
//  Leetcode
//
//  Created by Link on 2020/2/29.
//  Copyright © 2020 dadaabc. All rights reserved.
//

struct Stack<E> {
    private(set) var size = 0
    private var dataArray = [E]()
    
    var isEmpty: Bool {
        size == 0
    }
    
    mutating func push(element: E) {
        dataArray.insert(element, at: 0)
        size += 1
    }
    
    mutating func pop() -> E? {
        let firstElement = dataArray.first
        if firstElement != nil {
            size -= 1
        }
        return firstElement
    }
    
    mutating func clear() {
        dataArray.removeAll()
        size = 0
    }
}
