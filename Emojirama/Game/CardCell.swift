//
//  CardCell.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 09/05/22.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    static let identifier: String = "CardCell"
    
    private weak var lblTitle: UILabel?
    private weak var imgCover: UIImageView?
    private weak var viewCard: UIView?
    
    var card: Card!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        let viewCard: UIView = UIView(frame: .zero)
        viewCard.translatesAutoresizingMaskIntoConstraints = false
        viewCard.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        viewCard.layer.cornerRadius = 8
        viewCard.isHidden = true
        self.viewCard = viewCard
        
        let lblTitle: UILabel = UIFactory.getLabel(font: .title(40), alignment: .center)
        lblTitle.isHidden = true
        self.lblTitle = lblTitle
        
        let image: UIImage? = UIImage(named: "pattern")
        
        let imgCover: UIImageView = UIFactory.getImageView(image: image, contentMode: .scaleAspectFill)
        imgCover.layer.cornerRadius = 8
        self.imgCover = imgCover
        
        viewCard.addSubview(lblTitle)
        addSubview(viewCard)
        addSubview(imgCover)
        
        NSLayoutConstraint.activate([
            viewCard.topAnchor.constraint(equalTo: topAnchor),
            viewCard.bottomAnchor.constraint(equalTo: bottomAnchor),
            viewCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            lblTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            lblTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            lblTitle.heightAnchor.constraint(equalTo: lblTitle.widthAnchor),
            lblTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            imgCover.topAnchor.constraint(equalTo: topAnchor),
            imgCover.bottomAnchor.constraint(equalTo: bottomAnchor),
            imgCover.leadingAnchor.constraint(equalTo: leadingAnchor),
            imgCover.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func config(card: Card) {
        self.card = card
        lblTitle?.text = card.id
    }
    
    func flipUp(completion: (() -> Void)? = nil) {
        card.isSelected = true
        UIView.animate(withDuration: 0.25) {
            self.imgCover?.layer.transform = CATransform3DMakeRotation(0 - .pi / 2, 0, 1, 0)
        } completion: { finished in
            self.viewCard?.layer.transform = CATransform3DMakeRotation(.pi / 2, 0, 1, 0)
            self.viewCard?.isHidden = false
            self.lblTitle?.isHidden = false
            UIView.animate(withDuration: 0.25) {
                self.viewCard?.transform3D = CATransform3DIdentity
            } completion: { didFinish in
                completion?()
            }
        }
    }
    
    func flipDown(completion: (() -> Void)? = nil) {
        card.isSelected = false
        UIView.animate(withDuration: 0.25) {
            self.viewCard?.layer.transform = CATransform3DMakeRotation(.pi / 2, 0, 1, 0)
        } completion: { finished in
            self.imgCover?.layer.transform = CATransform3DMakeRotation(.pi / 2, 0, 1, 0)
            self.viewCard?.isHidden = true
            self.lblTitle?.isHidden = true
            UIView.animate(withDuration: 0.25) {
                self.imgCover?.transform3D = CATransform3DIdentity
            } completion: { didFinish in
                completion?()
            }
        }
    }
}
