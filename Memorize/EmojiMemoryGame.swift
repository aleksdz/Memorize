//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aleks Nazarenko on 28.06.20.
//  Copyright © 2020 Aleks Nazarenko. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis: Array<String> = ["👻", "🎃", "🕷", "💀", "🧙‍♀️", "👹", "👽", "👮‍♀️", "🧟‍♂️", "🧜‍♀️", "🧚‍♀️", "🧞‍♂️"]
        let cardCount = Int.random(in: 2 ... emojis.count)
        
        emojis.shuffle()
        
        return MemoryGame<String>(pairsOfCards: cardCount) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    //MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
