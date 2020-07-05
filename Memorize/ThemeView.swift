//
//  ThemeView.swift
//  Memorize
//
//  Created by Aleks Nazarenko on 03.07.20.
//  Copyright © 2020 Aleks Nazarenko. All rights reserved.
//

import SwiftUI

struct ThemeView: View {
    let Themes: [MemoryGameTheme]
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationView {
                VStack() {
                    Text("Memorize")
                        .font(Font.system(size: 60))
                        .foregroundColor(Color.green)
                    ForEach(0..<Themes.count) { index in
                        NavigationLink(destination: EmojiMemoryGameView(viewModel:  EmojiMemoryGame(theme: self.Themes[index]))) {
                                ThemeSelectionButton(theme: self.Themes[index])
                        }
                        Divider()
                    }
                }
                    .padding()
                    .foregroundColor(Color.green)
            }
        }
    }
}

struct ThemeSelectionButton: View {
    let theme: MemoryGameTheme
    let cornerRadius: CGFloat = 10.0
    let lineWidth: CGFloat = 3
    let fontScale: CGFloat = 0.6
    
    var body : some View {
        GeometryReader{ geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(lineWidth: lineWidth)
                .foregroundColor(theme.Color)
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.white)
            Text(theme.Name)
        }
            .aspectRatio(5, contentMode: .fit)
            .font(Font.system(size: fontSize(for: size)))
            .foregroundColor(theme.Color)
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScale
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(Themes: memoryGameThemes())
    }
}

func memoryGameThemes() -> [MemoryGameTheme] {
    let halloweenContent: [String] = ["👻", "🎃", "🕷", "💀", "🧙‍♀️", "👹", "👽", "👮‍♀️", "🧟‍♂️", "🧜‍♀️", "🧚‍♀️", "🧞‍♂️"]
    let petContent: [String] = ["🐈", "🐕", "🐹", "🐇", "🦜", "🐍", "🦎", "🕷", "🐷", "🐁"]
    let christmasContent: [String] = ["🎅🏻", "🎄", "🌟", "🎁", "🚂", "🧸", "🎉"]
    let flowerContent: [String] = ["🌹", "🌷", "🌺", "🌻", "🌼", "🥀", "💐", "🌸"]
    
    var themes = [
        MemoryGameTheme(color: Color.pink, name: "Flowers", cardContent: flowerContent),
        MemoryGameTheme(color: Color.blue, name: "Pets", cardContent: petContent),
        MemoryGameTheme(color: Color.orange, name: "Halloween", cardContent: halloweenContent),
        MemoryGameTheme(color: Color.red, name: "Christmas", cardContent: christmasContent),
    ]
    
    let randomTheme = themes[Int.random(in: 1..<themes.count)]
    
    themes.append(
        MemoryGameTheme(
            color: Color.green,
            name: "New Game",
            cardContent: randomTheme.Content
        )
    )
    
    return themes
}
