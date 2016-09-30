//: Playground - noun: a place where people can play

import UIKit

/*
    Arrays: Left Rotation
    [1,2,3,4,5] -> [3,4,5,1,2] if N is 2
 
    Sample Input:               Output:
    5 4                         5 1 2 3 4
    1 2 3 4 5


    My Thoughts:
    Arr length = 6,  if d = 2 then [..d...d+1..d+2]   the tail is equal to (arr.length - d)
                    the head is for [d-n.. d-2.. d-1 .. d]  which is d..0
    1 2 3 4 5  d = 2
    (tail) starts at d...d+1..d+2..d+n
    d[0] = d[2]    3
    d[1] = d[3]    4
    d[2] = d[4]    5
    (head) starts at 0..d
    d[0] = d[3]    1
    d[1] = d[4]    2
*/

/* My Solution O(N):

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

*/

/* Strings: Making Anagrams
    Given two large strings, a and b which may or may not be the same length. Determine the minimum number of character  deletions required to make a and b anagrams. Any characters can be deleted from either of the strings
 
    Input: cde      Output:  4
           abc
 
    Example:
        - remove d and e from a to get c
        - remove a and b from b to get c
        - must delete 4 characters total to make an anagram, so output 4 on a new line
 
 
    My Thoughts:
    First... there would be three cases
    
    1. string a and b are same length
    2. a is longer
    3. b is longer
 
    arr[25] ascii for alphabet as key and count as value
    arr2[25] ascii for second string
 
 
 
*/





