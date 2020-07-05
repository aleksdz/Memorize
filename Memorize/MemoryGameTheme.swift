//
//  EmojiTheme.swift
//  Memorize
//
//  Created by Aleks Nazarenko on 03.07.20.
//  Copyright © 2020 Aleks Nazarenko. All rights reserved.
//

import SwiftUI

struct MemoryGameTheme {
    let Color: Color
    let CardCount: Int
    
    var Name: String
    var Content: [String]
    
    init(color: Color, name: String, cardContent: [String], cardCount: Int? = nil) {
        Color = color
        Name = name
        Content = cardContent
        
        CardCount = cardCount ?? Int.random(in: 3 ... 4)
    }
}
