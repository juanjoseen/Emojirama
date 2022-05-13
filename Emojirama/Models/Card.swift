//
//  Card.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 05/05/22.
//

import Foundation

class Card {
    let id: String
    var isSelected: Bool
    var locked: Bool
    
    init(id: String) {
        self.id = id
        isSelected = false
        locked = false
    }
}
