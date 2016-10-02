//: Playground - noun: a place where people can play

import UIKit

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                            Arrays: Left Rotation
 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

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


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                        Strings: Making Anagrams
 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/*
    Given two large strings, a and b which may or may not be the same length. Determine the minimum number of character  deletions required to make a and b anagrams. Any characters can be deleted from either of the strings
 
    Input: cde      Output:  4
           abc
 
    Example:
        - remove d and e from a to get c
        - remove a and b from b to get c
        - must delete 4 characters total to make an anagram, so output 4 on a new line
 
 
    My Thoughts:
    (1) First... there would be three cases
    
    1. string a and b are same length
    2. a is longer
    3. b is longer
 
    arr[25] ascii for alphabet as key and count as value
    arr2[25] ascii for second string
    store into two buckets and interate through.. if different, different count += difference in values for key
 
 
*/

/* My Solution O(N):
extension Character
{
    func unicodeScalarCodePoint() -> Int
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        return Int(scalars[scalars.startIndex].value)
    }
}

func makeAnagram(str1: String, str2: String) -> Int
{
    var letterBucket = Array(repeating: 0, count: 25)
    var letterBucket2 = Array(repeating: 0, count: 25)
    var amountNeeded = 0;
    
    for c in str1.lowercased().characters
    {
        let ascii = c.unicodeScalarCodePoint() - 97
        letterBucket[ascii] += 1
    }
    
    for c in str2.lowercased().characters
    {
        let ascii = c.unicodeScalarCodePoint() - 97
        letterBucket2[ascii] += 1
    }

    for (index, element) in letterBucket.enumerated()
    {
        let difference = abs(element - letterBucket2[index])
        
        if(difference != 0)
        {
            amountNeeded += difference
        }
        
    }
    
    return amountNeeded  // Time Complexity : O(length of longest string) ~ O(N), Space Complexity : O(S1 + S2 + 42) ~ O(N)
}

let amount = makeAnagram(str1: "cde", str2: "abc")
*/


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                        Hash Tables: Ransom Note
 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*
 
    Given the words in the magazine and the words in the ransom note,
    print Yes if he can replicate his ransom note exactly using whole words from the magazine; otherwise, print No.
 
    Input:
 
    The first line contains two space-separated integers describing the respective values of  (the number of words in the magazine) and  (the number of words in the ransom note).
    The second line contains  space-separated strings denoting the words present in the magazine.
    The third line contains  space-separated strings denoting the words present in the ransom note.
 
    1 <= m,n <= 30000
    1 <= length of anyword <= 5
    words are all case sensitive
 
    Input:                              Output:
    6 4                                 YES
    give me one grand today night (magazine words)
    give one grand today   (ransom notes magazine)
 
 
    My Thoughts:
    Store magazine words into a hashtable
    hash lookup for ransomnote words
 
*/
/*
func isGoodRansomNote(m: Int, n: Int, magazineWords: String, randsomNotes: String) -> Bool
{
    let magazineArr = magazineWords.components(separatedBy: " ");
    let randsomArr = randsomNotes.components(separatedBy: " ");
    
    var wordDict: [String:Int] = [:]
    
    for word in magazineArr
    {
        wordDict[word] = 1
    }
    
    for word in randsomArr
    {
        if let val = wordDict[word]
        {
            // valid word
        }
        else
        {
            return false;
        }
    }
    
    return true; // Time: O(M + N) Space: O(M + N)
}

let m = 6
let n = 4
let magWords = "give me one grand today night"
let randWords = "give one grand today"

isGoodRansomNote(m: m, n: n, magazineWords: magWords, randsomNotes: randWords)
*/




