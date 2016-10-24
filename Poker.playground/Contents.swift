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
       // print(string)
        if let rank = Int(string), rank >= 2 && rank <= 10 {
      //      print(string)
            self = Rank.init(rawValue: rank)!
        } else {
      //      print(string)
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
        let allowedRank = NSCharacterSet(charactersIn: "1234567890AJKQ")
        let allowedSuit = NSCharacterSet(charactersIn: "♥️♣️♦️♠️")
        for element in self {
            if element is String {
                let rankChar = String(describing: element).components(separatedBy: allowedRank.inverted).first
                let suitChar = String(describing: element).components(separatedBy: allowedSuit.inverted).last
                guard let rank = Rank(string: rankChar!) else { return nil }
                guard let suit = Suit(string: suitChar!) else { return nil }
                cards.append(Card(rank: rank, suit: suit))
            }
        }
        return cards
    }
}

protocol TargetType {}
extension Array: TargetType {}

extension Collection where Self:TargetType, Iterator.Element == Card {
    func sortCardsByRankAscending() -> [Card] { return sorted { l, r in l.rank.rawValue < r.rank.rawValue } }
    func sortCardsByRankDescending() -> [Card] { return sorted { l, r in l.rank.rawValue > r.rank.rawValue } }
    func sortCardsBySuitAscending() -> [Card] { return sorted { l, r in l.suit.hashValue < r.suit.hashValue } }
    func sortCardsBySuitDescending() -> [Card] { return sorted { l, r in l.suit.hashValue > r.suit.hashValue } }
}

// Straight Flush
// Four of a kind
// Full House
// Flush
// Straight
// Three of a kind
// Two pair
// One pair
// High Card

class Hand {
    var cards: [Card]!
    var handName: String?
    var bestCards: [Card]?
    
    lazy var isStraightFlush: Bool = {
        var sortedCards = self.cards.sortCardsBySuitDescending()
        
        return false;
    }()
    
    
    init(cards: [Card]) {
        self.cards = cards
       // print(isStraightFlush)
    }
    
}

func getBestHand(cardString: [String]) {
    
    guard let cards = cardString.toCardsArray() else { return }
    
    print(cards)
    let hand = Hand(cards: cards)
    
    //print(hand.cards)
    
}

let straightFlush = ["A♠️", "K♠️", "Q♠️", "10♠️", "J♠️", "2♠️", "3♦️"]
//let cards = ["8♦️", "3♠️", "5♦️", "8♣️", "J♦️", "3♦️", "2♦️"]

getBestHand(cardString: straightFlush)






