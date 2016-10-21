//: Poker - noun: a card game played by two or more people who bet on the value of the hands dealt to them.

import UIKit

// ♥️♣️♦️♠️ //

/*
 
 The first challenge for any novice poker player is figuring out how to evaluate any given hand, and understanding how strong it is within the spectrum of all possible hands.

 Your task: write a method that accepts as input an array of 7 arbitrary cards (from a standard 52-card deck) and returns the best 5-card poker hand, as well as the name of that hand


 For example, an input of [8♦ 3♠ 5♦ 8♣ J♦ 3♦ 2♦] should return the output [J♦ 8♦ 5♦ 3♦ 2♦] and "Flush"
 See https://en.wikipedia.org/wiki/List_of_poker_hand_categories for a list and ranking of poker hands
 
*/

enum Suit {
    
    case clubs
    case diamonds
    case hearts
    case spades
    
    init?(string: String) {
        
        switch string {
        
        case "♣️" : self = .clubs
        case "♦️" : self = .diamonds
        case "♥️" : self = .hearts
        case "♠️" : self = .spades
            
        default: return nil

        }
    }
}

enum Rank: Int {
    
    case two = 0, three, four, five, six, seven, eight, nine, ten
    case jack
    case queen
    case king
    case ace
    
}


Suit.hearts.hashValue > Suit.spades.hashValue


struct Card {
    let rank : Int
    let suit: Suit
}

class HandChecker {
    
}

let cards = ["8♦", "3♠", "5♦", "8♣", "J♦", "3♦", "2♦"]

let sorted = cards.sorted()

