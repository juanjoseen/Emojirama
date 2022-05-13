//
//  ColorExtension.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 05/05/22.
//

import UIKit

extension UIColor {
    
    static var textColor: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ? UIColor(red: 0.969, green: 0.973, blue: 0.980, alpha: 1) : UIColor(red: 0.106, green: 0.102, blue: 0.157, alpha: 1)
        }
    }
    
    static let bgColor: UIColor = UIColor(named: "bgColor") ?? UIColor(red: 0.00, green: 0.59, blue: 0.53, alpha: 1.00)
    
    static let primary: UIColor = UIColor(named: "primary") ?? UIColor(red: 0.56, green: 0.47, blue: 0.82, alpha: 1.00)
}
