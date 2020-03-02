//
//  BinaryTree.swift
//  Leetcode
//
//  Created by Link on 2020/2/29.
//  Copyright © 2020 dadaabc. All rights reserved.
//

class BinaryTree<T> {
    var rootNode: BinaryTreeNode<T>
    init(rootNode: BinaryTreeNode<T>) {
        self.rootNode = rootNode
    }
}

extension BinaryTree {
    
    func preorderTraversal(array: inout [T], rootNode: BinaryTreeNode<T>?) {
        guard rootNode != nil else { return }
        rootNode?.logElement()
        array.append(rootNode!.element)
        preorderTraversal(array: &array, rootNode: rootNode!.leftNode)
        preorderTraversal(array: &array, rootNode: rootNode!.rightNode)
    }
    
    func inorderTraversal(array: inout [T], rootNode: BinaryTreeNode<T>?) {
        guard rootNode != nil else { return }
        inorderTraversal(array: &array, rootNode: rootNode!.leftNode)
        rootNode?.logElement()
        array.append(rootNode!.element)
        inorderTraversal(array: &array, rootNode: rootNode!.rightNode)
    }
    
    func postorderTraversal(array: inout [T], rootNode: BinaryTreeNode<T>?) {
        guard rootNode != nil else { return }
        postorderTraversal(array: &array, rootNode: rootNode!.leftNode)
        postorderTraversal(array: &array, rootNode: rootNode!.rightNode)
        rootNode?.logElement()
        array.append(rootNode!.element)
    }
    
    func levelOrderTraversal(array: inout [T], lastNodeArray: [BinaryTreeNode<T>]) {
        guard lastNodeArray.count >= 1 else { return }
        
        var result = [BinaryTreeNode<T>]()
        lastNodeArray.forEach { (e) in
            array.append(e.element)
            e.logElement()
            if let leftNode = e.leftNode {
                result.append(leftNode)
            }
            
            if let rightNode = e.rightNode {
                result.append(rightNode)
            }
        }
        
        levelOrderTraversal(array: &array, lastNodeArray: result)
    }
}

protocol BinaryTreeNodeTestable {
    func logElement()
}

class BinaryTreeNode<T> {
    var element: T
    var leftNode: BinaryTreeNode<T>?
    var rightNode: BinaryTreeNode<T>?
    init(element: T, leftNode: BinaryTreeNode<T>? = nil, rightNode: BinaryTreeNode<T>? = nil) {
        self.element = element
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

extension BinaryTreeNode: BinaryTreeNodeTestable {
    func logElement() {
        print(element)
    }
}
