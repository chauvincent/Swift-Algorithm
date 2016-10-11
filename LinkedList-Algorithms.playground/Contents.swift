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
        let newNode = Node<T>(data: value)
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
        head = nil
    }
    
    public func removeAt(index: Int)
    {
        var count = 0
        var node = getHead
        
        while node != nil
        {

            if index == 0
            {
                let next = head?.next
                head = nil
                self.head = next
                return
            }
            
            if count == index
            {

                var prev = node?.prev
                let next = node?.next
                
                if prev == nil
                {
                    prev = head
                }
                
                prev?.next = next
                next?.prev = prev
                node?.prev = nil

            }
            count += 1
            node = node?.next
        }
    }
    
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                            CTCI LinkedList Problems
     
     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    
    /*
     (Unsorted)
    Brute Force Iterative:
            1 - 2 - 3 - 5 - 6 - 2 - 3 - 7
      p1   /\
      p2       /\../\../\../\../\../\../\ ...
    Go through and call remove if same O(N^2)
     
     */
    
    public func removeDuplicatedUnsorted()
    {
        var node = getHead

        var count = 0
       
        while node != nil
        {
            var runner = getHead?.next
            while runner != nil
            {
                if compareData(of: node!.data as! Int, and: runner!.data as! Int)!
                {
                    // 3 3 4 5 6
                    node?.next = runner?.next
                    
                }
                runner = runner?.next
            }
            node = node?.next
        }
        
        
    }
    
    fileprivate func compareData<T: Equatable>(of value1: T, and value2:T) -> Bool?
    {
        if value1 as! Int == value2 as! Int
        {
            return true
        }
        
        return false
    }
    /*
     
     (Sorted)
     Iterative:   |----------|
           1 - 2 - 3 - 3 - 3 - 5 - 6 - 7
     p1   /\
     p2       /\
     
     p1       /\
     p2           /\
     
     p1           /\  /\
     p2           /\          /\            // delete the range 
           1 - 2 - 5 - 6 - 7
     p1            /\  /\
    
     */
    public func removeDuplicatedSorted()
    {
        
    }
    
    
}










/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                            Function Calls
 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

let numberList = LinkedList<Int>()
numberList.append(data: 3)
numberList.append(data: 4)
numberList.append(data: 5)
numberList.insertAtIndex(value: 10, atIndex: 1)
numberList.removeAt(index: 3)
numberList.append(data: 11)
numberList.removeAt(index: 1)
numberList.append(data: 9)
numberList.append(data: 11)
numberList.append(data: 10)
numberList.append(data: 11)
numberList.removeAll()

// Remove Duplicates
numberList.append(data: 0)
numberList.append(data: 1)
numberList.append(data: 1)
numberList.append(data: 2)
numberList.append(data: 2)
numberList.append(data: 23)

numberList.removeDuplicatedUnsorted()
numberList.printList()




