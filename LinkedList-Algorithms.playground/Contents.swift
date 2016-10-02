//: Playground - noun: a place where people can play

import UIKit


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                            LinkedList Class
 TODO:
    print
    insert at index
    removeall
    remove at index
    remove last
    remove given a node
    reverse linked list
    detect cycle
    + .. more to come
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

public class LinkedList<Int>
{
    fileprivate var head: Node<Int>?
    
    public var isEmpty: Bool {
        
        return head == nil
    }
    
    public var getHead: Node<Int>? {
    
        return head
    }
    
    public var getLast: Node<Int>? {
        
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
    
    public func append(data: Int)
    {
        let node = Node<Int>(data: data)
        
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

    
}


let numberList = LinkedList<Int>()
numberList.append(data: 3)
numberList.append(data: 4)
numberList.append(data: 5)

numberList.printList()
