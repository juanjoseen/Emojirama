//
//  GameOverView.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 12/05/22.
//

import UIKit

class GameOverView: UIView {

    unowned var controller: GameOverController!
    private weak var lblEmoji: UILabel?
    private weak var lblTitle: UILabel?
    
    init(controller: GameOverController) {
        self.controller = controller
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .bgColor
        
        let lblEmoji: UILabel = UIFactory.getLabel(font: .title(50), alignment: .center)
        self.lblEmoji = lblEmoji
        
        let lblTitle: UILabel = UIFactory.getLabel(font: .largeTitle(), color: .white, alignment: .center)
        self.lblTitle = lblTitle
        
        let btnRetry: UIButton = UIButton()
        btnRetry.translatesAutoresizingMaskIntoConstraints = false
        btnRetry.backgroundColor = .primary
        btnRetry.setTitleColor(.white, for: .normal)
        btnRetry.setTitle("Volver a intentarlo", for: .normal)
        btnRetry.layer.cornerRadius = 8
        btnRetry.addTarget(self, action: #selector(actionRetry), for: .touchUpInside)
        
        let btnChange: UIButton = UIButton()
        btnChange.translatesAutoresizingMaskIntoConstraints = false
        btnChange.setTitleColor(.white, for: .normal)
        btnChange.setTitle("Cambiar nivel", for: .normal)
        btnChange.layer.cornerRadius = 8
        btnChange.layer.borderColor = UIColor.white.cgColor
        btnChange.layer.borderWidth = 1
        btnChange.addTarget(self, action: #selector(actionChangeLevel), for: .touchUpInside)
        
        addSubview(lblEmoji)
        addSubview(lblTitle)
        addSubview(btnRetry)
        addSubview(btnChange)
        
        NSLayoutConstraint.activate([
            lblEmoji.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            lblEmoji.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            lblTitle.topAnchor.constraint(equalTo: lblEmoji.bottomAnchor, constant: 8),
            lblTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            lblTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            btnRetry.heightAnchor.constraint(equalToConstant: 50),
            btnRetry.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            btnRetry.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            btnRetry.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            btnChange.topAnchor.constraint(equalTo: btnRetry.bottomAnchor, constant: 16),
            btnChange.leadingAnchor.constraint(equalTo: btnRetry.leadingAnchor),
            btnChange.trailingAnchor.constraint(equalTo: btnRetry.trailingAnchor),
            btnChange.heightAnchor.constraint(equalTo: btnRetry.heightAnchor),
        ])
    }
    
    func configureWin() {
        lblEmoji?.text = "🥳"
        lblTitle?.text = "Felicidades!!!\nGanaste!!"
    }
    
    func configureLose() {
        lblEmoji?.text = "😭"
        lblTitle?.text = "Que pena\nPerdiste"
    }
    
    @objc func actionRetry() {
        controller.retry()
    }
    
    @objc func actionChangeLevel() {
        controller.changeLevel()
    }
}
