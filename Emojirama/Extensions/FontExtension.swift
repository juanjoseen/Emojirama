//
//  FontExtension.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 05/05/22.
//

import UIKit

public extension UIFont {    
    
    /// Standarized Avenir font to be used in normal text
    /// - Parameter size: font size
    /// - Returns: Avenir font with the specified size
    static func normal(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir", size: size)!
    }
    
    /// Standarized Avenir-Light font
    /// - Parameter size: font size
    /// - Returns: Avenir-Light font with the specified size
    static func light(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size)!
    }
    
    /// Standarized Avenir-LightOblique font
    /// - Parameter size: font size
    /// - Returns: Avenir-LightOblique font with the specified size
    static func lightItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-LightOblique", size: size)!
    }
    
    /// Standarized Avenir-Medium font
    /// - Parameter size: font size
    /// - Returns: Avenir-Medium font with the specified size
    static func medium(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Medium", size: size)!
    }
    
    /// Standarized Avenir-Heavy font
    /// - Parameter size: font size
    /// - Returns: Avenir-Heavy font with the specified size
    static func heavy(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Heavy", size: size)!
    }
    
    /// Standarized font to be used for large titles, default font: Avenir-Heavy
    /// - Parameter size: font size, default: 25
    /// - Returns: an Avenir-Heavy font with the specified size
    static func largeTitle(_ size: CGFloat = 25) -> UIFont {
        return .heavy(size)
    }
    
    /// Standarized font to be used for titles, default font: Avenir-Heavy
    /// - Parameter size: font size, default: 20
    /// - Returns: an Avenir-Heavy font with the specified size
    static func title(_ size: CGFloat = 20) -> UIFont {
        return .heavy(size)
    }
    
    /// Standarized font to be used for subtitles, default font: Avenir-Medium
    /// - Parameter size: font size, default: 17
    /// - Returns: an Avenir-Medium font with the specified size
    static func subtitle(_ size: CGFloat = 17) -> UIFont {
        return .medium(size)
    }
    
    /// Standarized font to be used for normal text, default font: Avenir
    /// - Parameter size: font size, default: 15
    /// - Returns: an Avenir font with the specified size
    static func text(_ size: CGFloat = 15) -> UIFont {
        return .normal(size)
    }
    
    /// Standarized font to be used for light text, default font: Avenir-Light
    /// - Parameter size: font size, default: 12
    /// - Returns: an Avenir-Light font with the specified size
    static func smallText(_ size: CGFloat = 12) -> UIFont {
        return .light(size)
    }
}
