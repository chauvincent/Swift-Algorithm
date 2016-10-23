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
    // Ranked in ascending order
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack
    case queen
    case king
    case ace
    
    init?(string: String) {
        if let rank = Int(string), rank >= 2 && rank <= 10 {
            self = Rank.init(rawValue: rank)!
        } else {
            switch string {
            case "J":
                self = Rank.init(rawValue: 11)!
            case "K":
                self = Rank.init(rawValue: 12)!
            case "Q":
                self = Rank.init(rawValue: 13)!
            case "A":
                self = Rank.init(rawValue: 14)!
            default:
                return nil
            }
        }
    }
}

struct Card {
    let rank : Rank
    let suit: Suit
}

extension Array {
    // Convert string array of card rank and suit to Cards array
    func toCardsArray() -> [Card]? {
        var cards: [Card] = []
        for element in self {
            if element is String {
                let characters = String(describing: element).characters.map { String($0) }
                guard let rank = Rank(string: characters[0]) else { return nil }
                guard let suit = Suit(string: characters[1]) else { return nil }
                cards.append(Card(rank: rank, suit: suit))
            }
        }
        return cards
    }
}

//
//class Hand {
//    var cards: [Card]!
//    var handType: String?
//    
//    init(cardStringArr: [String]) {
//        self.cards = cardStringArr.sorted().toCardsArray()
//    }
//}

//struct Foo  {
//    var name:String
//}

protocol TargetType {}
extension Array: TargetType {}

extension Collection where Self:TargetType, Iterator.Element == Card {
//    func byName() -> [Foo] { return sorted { l, r in l.name < r.name } }
}
//
//let foos:[Foo] = ["c", "b", "a"].map { s in Foo(name: s) }
//print(foos.byName())



let cards = ["8♦️", "3♠️", "5♦️", "8♣️", "J♦️", "3♦️", "2♦️"]
let allCards = cards.toCardsArray()

