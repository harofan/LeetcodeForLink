//
//  LinkedList.swift
//  Test
//
//  Created by Link on 2020/1/28.
//  Copyright © 2020 Link. All rights reserved.
//

import Foundation

protocol LinkedListable {
    associatedtype E: Equatable
    typealias ElementType = LinkedListNode<E>
    var container: LinkedListContainer<E> { get set }
    
    func getSize() -> Int
    func contains(node: ElementType) -> Bool
    func get(index: Int) throws -> ElementType?
    mutating func set(index: Int, element: E) throws
    mutating func insert(index: Int, element: ElementType) throws
    @discardableResult mutating func remove(index: Int) throws -> ElementType?
    func indexOf(element: ElementType) -> Int?
    mutating func replaceHeadNode(element: ElementType)
}

extension LinkedListable {
    
    func getSize() -> Int {
        var result = 1
        guard var currentNode = container.headNode else { return result }
        while currentNode.next != nil {
            guard let nextNode = currentNode.next else { return result }
            result += 1
            currentNode = nextNode
        }
        return result
    }
    
    func contains(node: ElementType) -> Bool {
        var nodeIndex = 0
        guard var currentNode = container.headNode else { return false }
        while currentNode.next != nil {
            
            if currentNode.value == node.value {
                return true
            }
            guard let nextNode = currentNode.next else { return false }
            currentNode = nextNode
            nodeIndex += 1
        }
        
        return false
    }
    
    func get(index: Int) throws -> ElementType? {
        
        guard index >= 0 else { throw LinkedListError.outOfBounds }
        var nodeIndex = 0
        guard var currentNode = container.headNode else { return nil }
        while nodeIndex <= index {
            if index == nodeIndex {
                return currentNode
            }
            guard let nextNode = currentNode.next else {
                throw LinkedListError.outOfBounds
            }
            nodeIndex += 1
            currentNode = nextNode
        }
        return nil
    }
    
    mutating func set(index: Int, element: E) throws {
        let node = try get(index: index)
        node?.value = element
    }
    
    mutating func insert(index: Int, element: ElementType) throws {
        
        guard index >= 0 else { throw LinkedListError.outOfBounds }
        var nodeIndex = 0
        // 下标为0
        guard index != 0 else {
            element.next = container.headNode
            container.headNode = element
            return
        }
        guard var currentNode = container.headNode else { return }
        //下标不为0
        while nodeIndex < index {
            if index - 1 == nodeIndex {
                element.next = currentNode.next
                currentNode.next = element
                return
            }
            guard let nextNode = currentNode.next else {
                throw LinkedListError.outOfBounds
            }
            nodeIndex += 1
            currentNode = nextNode
            
        }
    }
    
    @discardableResult mutating func remove(index: Int) throws -> ElementType? {
        guard index >= 0 else { throw LinkedListError.outOfBounds }
        
        // 移除头节点
        guard index != 0 else {
            let deleteNode = container.headNode
            container.headNode = container.headNode?.next
            return deleteNode
        }
        
        var nodeIndex = 0
        guard var currentNode = container.headNode else { return nil }
        while nodeIndex <= index {
            guard let nextNode = currentNode.next else {
                throw LinkedListError.outOfBounds
            }
            if index == nodeIndex + 1 {
                let deleteNode = currentNode.next
                currentNode.next = currentNode.next?.next
                return deleteNode
            }
            nodeIndex += 1
            currentNode = nextNode
        }
        
        return nil
    }
    
    func indexOf(element: ElementType) -> Int? {
        var nodeIndex = 0
        guard var currentNode = container.headNode else { return nil }
        while true {
            if currentNode.value == element.value {
                return nodeIndex
            }
            guard let nextNode = currentNode.next else {
                return nil
            }
            nodeIndex += 1
            currentNode = nextNode
        }
    }
    
    mutating func replaceHeadNode(element: ElementType) {
        container.headNode = element
    }
}

enum LinkedListError: Error {
    case outOfBounds
}

class LinkedListNode<T: Equatable> {
    var next: LinkedListNode<T>?
    var value: T
    init(value: T) {
        self.value = value
    }
}

struct LinkedListContainer<T: Equatable> {
    fileprivate var headNode: LinkedListNode<T>?
}

struct LinkedList<T: Equatable>: LinkedListable {
    var container = LinkedListContainer<T>()
    typealias E = T
    init(headNode: LinkedListNode<T>) {
        container.headNode = headNode
    }
}
