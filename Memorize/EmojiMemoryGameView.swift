//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Aleks Nazarenko on 28.06.20.
//  Copyright © 2020 Aleks Nazarenko. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(self.viewModel.Theme.Name)
                .font(Font.largeTitle)
                .foregroundColor(Color.green)
            Grid(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        self.viewModel.choose(card: card)
                    }
            .padding(5)
            }
                .foregroundColor(self.viewModel.Theme.Color)
                .padding()
        }
    }
}

struct CardView: View  {
    let cornerRadius: CGFloat = 10.0
    let lineWidth: CGFloat = 3
    let fontScale: CGFloat = 0.75
    
    var card: MemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineWidth)
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                Text(self.card.content)
                    .font(Font.system(size: fontSize(for: size)))
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScale
    }
}

struct ContentView_Previews: PreviewProvider {
    static let petContent: [String] = ["🐈", "🐕", "🐹", "🐇", "🦜", "🐍", "🦎", "🕷", "🐷", "🐁"]
    static let PetTheme = MemoryGameTheme(color: Color.pink, name: "Pets", cardContent: petContent)
    
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: PetTheme))
    }
}
