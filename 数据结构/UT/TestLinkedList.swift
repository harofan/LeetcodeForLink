//
//  TestLinkedList.swift
//  Test
//
//  Created by Link on 2020/1/30.
//  Copyright © 2020 Link. All rights reserved.
//

import XCTest

class TestLinkedList: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func createLinkedList() -> LinkedList<Int> {
        let node0 = LinkedListNode(value: 0)
        let node1 = LinkedListNode(value: 1)
        let node2 = LinkedListNode(value: 2)

        node0.next = node1
        node1.next = node2

        return LinkedList(headNode: node0)
    }

    // MARK: - Insert
    func testInsertHead() {
        
        var linkedList = createLinkedList()
        let tempNode = LinkedListNode(value: 10)
        
        assert(linkedList.getSize() == 3)
        try? linkedList.insert(index: 0, element: tempNode)
        
        assert(linkedList.container.headNode?.value == 10)
        assert(linkedList.getSize() == 4)
    }
    
    func testInsertMiddle() {
        var linkedList = createLinkedList()
        let tempNode = LinkedListNode(value: 10)
        
        try? linkedList.insert(index: 1, element: tempNode)
        
        assert(linkedList.container.headNode?.next?.value == 10)
        assert(linkedList.getSize() == 4)
    }
    
    func testInsertEnd() {
        var linkedList = createLinkedList()
        let tempNode = LinkedListNode(value: 10)
        
        try? linkedList.insert(index: 3, element: tempNode)
        assert(linkedList.container.headNode?.next?.next?.next?.value == 10)
        assert(linkedList.getSize() == 4)
    }
    
    func testInsertOutOfBounds() {
        var linkedList = createLinkedList()
        let tempNode = LinkedListNode(value: 10)
        
        do {
            try linkedList.insert(index: 4, element: tempNode)
        } catch let error {
            print(error)
        }
    }
    
    // MARK: - Contains
    func testContains() {
        let linkedList = createLinkedList()
        let tempNode1 = LinkedListNode(value: 0)
        let tempNode2 = LinkedListNode(value: 10)
        
        let result1 = linkedList.contains(node: tempNode1)
        let result2 = linkedList.contains(node: tempNode2)
        
        assert(result1 == true)
        assert(result2 == false)
    }
    
    // MARK: - Get
    func testGet() {
        let linkedList = createLinkedList()
        let headNode = try? linkedList.get(index: 0)
        let middleNode = try? linkedList.get(index: 1)
        let endNode = try? linkedList.get(index: 2)
        let nilNode = try? linkedList.get(index: 3)
        
        assert(headNode?.value == 0)
        assert(middleNode?.value == 1)
        assert(endNode?.value == 2)
        assert(nilNode?.value == nil)
    }
    
    // MARK: - Set
    func testSet() {
        var linkedList = createLinkedList()
        try? linkedList.set(index: 0, element: 11)
        try? linkedList.set(index: 1, element: 12)
        try? linkedList.set(index: 2, element: 13)
        do {
            try linkedList.set(index: 3, element: 100)
        } catch let error {
            print("🌞")
            print(error)
        }
        
        assert(linkedList.container.headNode?.value == 11)
        assert(linkedList.container.headNode?.next?.value == 12)
        assert(linkedList.container.headNode?.next?.next?.value == 13)
    }
    
    // MARK: Remove
    func testRemoveHead() {
        var linkedList = createLinkedList()
        let deleteNode = try? linkedList.remove(index: 0)
        
        assert(deleteNode?.value == 0)
        assert(linkedList.getSize() == 2)
        assert(linkedList.container.headNode?.value == 1)
    }
    
    func testRemoveMiddle() {
        var linkedList = createLinkedList()
        let deleteNode = try? linkedList.remove(index: 1)
        
        assert(deleteNode?.value == 1)
        assert(linkedList.getSize() == 2)
        assert(linkedList.container.headNode?.value == 0)
        assert(linkedList.container.headNode?.next?.value == 2)
    }
    
    func testRemoveEnd() {
        var linkedList = createLinkedList()
        let deleteNode = try? linkedList.remove(index: 2)
        
        assert(deleteNode?.value == 2)
        assert(linkedList.getSize() == 2)
        assert(linkedList.container.headNode?.value == 0)
        assert(linkedList.container.headNode?.next?.value == 1)
    }
    
    func testRemoveOutOfBounds() {
        var linkedList = createLinkedList()
        do {
            try linkedList.remove(index: 3)
        } catch let error {
            print(error)
        }
    }
    
    func testIndexOf() {
        let linkedList = createLinkedList()
        let tempNode0 = LinkedListNode(value: 0)
        let tempNode1 = LinkedListNode(value: 1)
        let tempNode2 = LinkedListNode(value: 2)
        let tempNodeNil = LinkedListNode(value: 10)
        
        let result0 = linkedList.indexOf(element: tempNode0)
        let result1 = linkedList.indexOf(element: tempNode1)
        let result2 = linkedList.indexOf(element: tempNode2)
        let resultNil = linkedList.indexOf(element: tempNodeNil)
        
        assert(result0 == 0)
        assert(result1 == 1)
        assert(result2 == 2)
        assert(resultNil == nil)
    }
}

//func indexOf(element: ElementType) -> Int?
