//
//  MemoryGame.swift
//  Memorize
//
//  Created by Aleks Nazarenko on 28.06.20.
//  Copyright © 2020 Aleks Nazarenko. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
    }
    
    var cards: Array<Card>
    
    init(pairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
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
        
        let chosenIndex: Int = self.cards.firstIndex(matching: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
}
