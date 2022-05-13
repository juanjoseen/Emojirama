//
//  Level.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 05/05/22.
//

import UIKit

enum Level: Int {
    case easy = 1
    case medium = 2
    case hard = 3
    
    var pairs: Int {
        switch self {
        case .easy:
            return 8
        case .medium:
            return 12
        case .hard:
            return 15
        }
    }
    
    var title: String {
        switch self {
        case .easy:
            return "🥳  Fácil (4x4)"
        case .medium:
            return "🤨  Medio (4x6)"
        case .hard:
            return "😱  Difícil (5x6)"
        }
    }
    
    var time: TimeInterval {
        switch self {
        case .easy:
            return 60
        case .medium:
            return 90
        case .hard:
            return 120
        }
    }
    
    var showTime: TimeInterval {
        switch self {
        case .easy:
            return 2
        case .medium:
            return 4
        case .hard:
            return 6
        }
    }
}
