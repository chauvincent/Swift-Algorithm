//: Playground - noun: a place where people can play

import UIKit


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                            Linked List Class
 
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
        var node = head
        
        while node != nil
        {
            node = node!.next
        }
        return node
    }
    
}


let numberList = LinkedList<Int>()

