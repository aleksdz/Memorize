//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aleks Nazarenko on 28.06.20.
//  Copyright © 2020 Aleks Nazarenko. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame
    let Theme: MemoryGameTheme
    
    init(theme: MemoryGameTheme) {
        var content = theme.Content
        
        content.shuffle()
        
        Theme = theme
        
        model = MemoryGame(pairsOfCards: theme.CardCount) { pairIndex in
            content[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame.Card) {
        model.choose(card: card)
    }
}
