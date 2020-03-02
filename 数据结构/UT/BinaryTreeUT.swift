//
//  BinaryTreeUT.swift
//  BinaryTreeUT
//
//  Created by Link on 2020/2/29.
//  Copyright © 2020 dadaabc. All rights reserved.
//

import XCTest

class BinaryTreeUT: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPreorderTraversal() {
        let tree = buildBinaryTree()
        var result = [Int]()
        tree.preorderTraversal(array: &result, rootNode: tree.rootNode)
        assert(result == [7, 4, 2, 1, 3, 5, 9, 8, 11, 10, 12], "false")
    }

    func testInorderTraversal() {
        let tree = buildBinaryTree()
        var result = [Int]()
        tree.inorderTraversal(array: &result, rootNode: tree.rootNode)
        assert(result == [1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12], "false")
    }

    func testPostorderTraversal() {
        let tree = buildBinaryTree()
        var result = [Int]()
        tree.postorderTraversal(array: &result, rootNode: tree.rootNode)
        assert(result == [1, 3, 2, 5, 4, 8, 10, 12, 11, 9, 7], "false")
    }
    
    func testLevelOrderTraversal() {
        let tree = buildBinaryTree()
        var result = [Int]()
        tree.levelOrderTraversal(array: &result, lastNodeArray: [tree.rootNode])
        assert(result == [7, 4, 9, 2, 5, 8, 11, 1, 3, 10, 12], "false")
    }

    func buildBinaryTree() -> BinaryTree<Int> {
        
        let node41 = BinaryTreeNode(element: 1)
        let node42 = BinaryTreeNode(element: 3)
        let node43 = BinaryTreeNode(element: 10)
        let node44 = BinaryTreeNode(element: 12)
        
        let node31 = BinaryTreeNode(element: 2, leftNode: node41, rightNode: node42)
        let node32 = BinaryTreeNode(element: 5)
        let node33 = BinaryTreeNode(element: 8)
        let node34 = BinaryTreeNode(element: 11, leftNode: node43, rightNode: node44)
        
        let node21 = BinaryTreeNode(element: 4, leftNode: node31, rightNode: node32)
        let node22 = BinaryTreeNode(element: 9, leftNode: node33, rightNode: node34)
        let rootNode = BinaryTreeNode(element: 7, leftNode: node21, rightNode: node22)
        
        return BinaryTree(rootNode: rootNode)
    }
}
