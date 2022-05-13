//
//  ViewExtension.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 05/05/22.
//

import UIKit

extension UIView {
    func addShadow() {
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
    }
}
