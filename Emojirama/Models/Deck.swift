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
            emojis = "❤️😺👻🤡☠️🥶👺👽👾🤖🎃💩"
        case .medium:
            emojis = "❤️😺👻🤡☠️🥶👺👽👾🤖🎃💩😀😍🤩😡🤯😈😼🤑🤠"
        case .hard:
            emojis = "😺😼😀😁😬🙂🙃😡🤬🥵😰😥😓😦😮"
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
