//
//  Deck.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 05/05/22.
//

import Foundation

class Deck {
    
    private init() {}
    
    static func generate(from level: Level) -> [Card] {
        let emojis: String
        switch level {
        case .easy:
            emojis = "โค๏ธ๐บ๐ป๐คกโ ๏ธ๐ฅถ๐บ๐ฝ๐พ๐ค๐๐ฉ"
        case .medium:
            emojis = "โค๏ธ๐บ๐ป๐คกโ ๏ธ๐ฅถ๐บ๐ฝ๐พ๐ค๐๐ฉ๐๐๐คฉ๐ก๐คฏ๐๐ผ๐ค๐ค "
        case .hard:
            emojis = "๐บ๐ผ๐๐๐ฌ๐๐๐ก๐คฌ๐ฅต๐ฐ๐ฅ๐๐ฆ๐ฎ"
        }
        
        let selected: [String] = Array(emojis.map({ String($0)}).shuffled().prefix(upTo: level.pairs))
        var cards: [Card] = []
        for select in selected {
            cards.append(Card(id: select))
            cards.append(Card(id: select))
        }
        return cards.shuffled()
    }
    
    
}
