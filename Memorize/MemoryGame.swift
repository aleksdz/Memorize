//
//  MemoryGame.swift
//  Memorize
//
//  Created by Aleks Nazarenko on 28.06.20.
//  Copyright © 2020 Aleks Nazarenko. All rights reserved.
//

import Foundation

struct MemoryGame {
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: String
        
        var id: Int
    }
    
    var cards: Array<Card>
    var currentIndex: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(pairsOfCards: Int, cardContentFactory: (Int) -> String) {
        cards = Array<Card>()
        
        for pairIndex in 0..<pairsOfCards {
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        
        if let chosenIndex = self.cards.firstIndex(matching: card), !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = currentIndex {
                if (cards[chosenIndex].content == cards[potentialMatchIndex].content) && (potentialMatchIndex != chosenIndex) {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                
                self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
            } else {
                currentIndex = chosenIndex
            }
        }
    }
    
}
