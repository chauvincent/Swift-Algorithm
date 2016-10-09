//: Playground - noun: a place where people can play

import UIKit


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                            LinkedList Class

 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

public class Node<T>
{
    var data: T
    var next: Node?
    weak var prev: Node?
    
    public init(data: T)
    {
        self.data = data
    }
    
}

public class LinkedList<T>
{
    fileprivate var head: Node<T>?
    
    public var isEmpty: Bool {
        
        return head == nil
    }
    
    public var getHead: Node<T>? {
    
        return head
    }
    
    public var getLast: Node<T>? {
        
        if var node = head
        {
            while case let next? = node.next
            {
                node = next
            }
            
            return node
        }
        else
        {
            return nil
        }
    }
    
    public func append(data: T)
    {
        let node = Node<T>(data: data)
        
        if let last = getLast
        {
            node.prev = last
            last.next = node
        }
        else
        {
            head = node
        }
    }
    
    public func printList()
    {
        var node = getHead
        
        while node != nil
        {
            print(node!.data)
            node = node?.next
        }
    }

    public func insertAtIndex(value: T, atIndex: Int)
    {
        var newNode = Node<T>(data: value)
        var count = 0
        
        var node = getHead
        
        while node != nil
        {
            
            if (count == atIndex)
            {

                if node?.prev == nil
                {
                    self.head = newNode
                    return
                }
               
                node?.prev?.next = newNode
                node?.prev = newNode
                newNode.next = node
                return
            }
            
            node = node?.next
            count += 1
        }
        
        // Out of bounds, add to end
        self.append(data: value)
        
    }
    
    public func remove(node: Node<T>)
    {
        let next = node.next
        let prev = node.prev
        
        if let prev = prev
        {
            prev.next = next
        }
        else // if delete head node
        {
            head = next
        }
        next?.prev = prev
        node.prev = nil
        node.next = nil
    }
    
    public func removeAll()
    {
        
    }
    
    public func removeAt(index: Int)
    {
        
        
    }
    
 
    
    
}


let numberList = LinkedList<Int>()
numberList.append(data: 3)
numberList.append(data: 4)
numberList.append(data: 5)
numberList.insertAtIndex(value: 10, atIndex: 1)
numberList.printList()
