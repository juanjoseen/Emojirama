//
//  UIFactory.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 05/05/22.
//

import UIKit

class UIFactory {
    private init() { }
    
    static func getLabel(text: String? = nil, font: UIFont = .text(), color: UIColor = .textColor, alignment: NSTextAlignment = .left) -> UILabel {
        let label: UILabel = UILabel()
        label.textColor = color
        label.font = font
        label.text = text
        label.numberOfLines = 0
        label.textAlignment = alignment
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
    static func getCollection() -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.scrollDirection = .vertical
        
        let collection: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        
        return collection
    }
    
    static func getImageView(image: UIImage?, contentMode: UIImageView.ContentMode = .scaleAspectFit) -> UIImageView {
        let imageView: UIImageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = contentMode
        imageView.clipsToBounds = true
        return imageView
    }
}
