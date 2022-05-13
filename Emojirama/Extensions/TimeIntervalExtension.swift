//
//  TimeIntervalExtension.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 09/05/22.
//

import UIKit

extension TimeInterval {
    func toString() -> String {
        let seconds: Int = Int(self)
        let (min, sec) = (Int(seconds / 60), seconds % 60)
        return String(format: "%02d:%02d", min, sec)
    }
}
