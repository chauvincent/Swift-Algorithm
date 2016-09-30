//: Playground - noun: a place where people can play

import UIKit

/*
    Arrays: Left Rotation
    [1,2,3,4,5] -> [3,4,5,1,2] if N is 2
 
    Sample Input:               Output:
    5 4                         5 1 2 3 4
    1 2 3 4 5
*/

/*  My Thoughts:
    Arr length = 6,  if d = 2 then [..d...d+1..d+2]   the tail is equal to (arr.length - d)
                    the head is for [d-n.. d-2.. d-1 .. d]  which is d..0 d--
    1 2 3 4 5  d = 2
    d[0] = d[2]    3
    d[1] = d[3]    4
    d[2] = d[4]    5
 
    d[0] = d[3]    1
    d[1] = d[4]    2
*/

func leftRotate(arr: [Int], d: Int) -> [Int]
{
    let length = arr.count - 1
    var rotated = [Int](repeating: 0, count: arr.count)
    var startIndex = 0
    
    for (index, element) in arr.enumerated()
    {
        if (index >= (length - d))
        {
            rotated[startIndex] = element
            startIndex += 1
        }
        else
        {
            rotated[index + d + 1] = element
        }
    }
    
    return rotated // Time Complexity: O(N)
}

let arr = [1,2,3,4,5]
leftRotate(arr: arr, d: 2)

