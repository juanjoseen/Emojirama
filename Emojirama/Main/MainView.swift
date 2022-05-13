//
//  MainView.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 05/05/22.
//

import UIKit

class MainView: UIView {

    unowned var controller: ViewController!
    
    weak var btnEasy: UIButton?
    weak var btnMedium: UIButton?
    weak var btnHard: UIButton?
    weak var btnStart: UIButton?
    
    var levelSelected: Level!
    
    init(controller: ViewController) {
        self.controller = controller
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .bgColor
        
        let lblTitle: UILabel = UIFactory.getLabel(text: "Emojirama\n😃", font: .largeTitle(50), color: .white, alignment: .center)
        
        let lblSelect: UILabel = UIFactory.getLabel(text: "Dificultad:", font: .largeTitle(), color: .white)
        
        let btnEasy: UIButton = dificultyButton(Level.easy.title)
        btnEasy.tag = 1
        self.btnEasy = btnEasy
        
        let btnMedium: UIButton = dificultyButton(Level.medium.title)
        btnMedium.tag = 2
        self.btnMedium = btnMedium
        
        let btnHard: UIButton = dificultyButton(Level.hard.title)
        btnHard.tag = 3
        self.btnHard = btnHard
        
        let btnStart: UIButton = UIButton()
        btnStart.translatesAutoresizingMaskIntoConstraints = false
        btnStart.layer.cornerRadius = 12
        btnStart.backgroundColor = .systemBlue
        btnStart.setTitle("Start!!", for: .normal)
        btnStart.setTitleColor(.white, for: .normal)
        btnStart.setTitleColor(.gray, for: .disabled)
        btnStart.addShadow()
        btnStart.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        btnStart.alpha = 0.0
        btnStart.addTarget(self, action: #selector(actionStart), for: .touchUpInside)
        self.btnStart = btnStart
        
        addSubview(lblTitle)
        addSubview(lblSelect)
        addSubview(btnEasy)
        addSubview(btnMedium)
        addSubview(btnHard)
        addSubview(btnStart)
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            lblTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblTitle.heightAnchor.constraint(equalToConstant: 150),
            
            lblSelect.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 64),
            lblSelect.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            lblSelect.heightAnchor.constraint(equalToConstant: 29),
            
            btnEasy.topAnchor.constraint(equalTo: lblSelect.bottomAnchor, constant: 32),
            btnEasy.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            btnEasy.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            btnEasy.heightAnchor.constraint(equalToConstant: 50),
            
            btnMedium.topAnchor.constraint(equalTo: btnEasy.bottomAnchor, constant: 16),
            btnMedium.leadingAnchor.constraint(equalTo: btnEasy.leadingAnchor),
            btnMedium.trailingAnchor.constraint(equalTo: btnEasy.trailingAnchor),
            btnMedium.heightAnchor.constraint(equalTo: btnEasy.heightAnchor),
            
            btnHard.topAnchor.constraint(equalTo: btnMedium.bottomAnchor, constant: 16),
            btnHard.leadingAnchor.constraint(equalTo: btnMedium.leadingAnchor),
            btnHard.trailingAnchor.constraint(equalTo: btnMedium.trailingAnchor),
            btnHard.heightAnchor.constraint(equalTo: btnMedium.heightAnchor),
            
            btnStart.topAnchor.constraint(equalTo: btnHard.bottomAnchor, constant: 32),
            btnStart.leadingAnchor.constraint(equalTo: btnHard.leadingAnchor),
            btnStart.trailingAnchor.constraint(equalTo: btnHard.trailingAnchor),
            btnStart.heightAnchor.constraint(equalTo: btnHard.heightAnchor)
            
        ])
        
        for btn in [btnEasy, btnMedium, btnHard] {
            btn.addTarget(self, action: #selector(selectDificulty(_:)), for: .touchUpInside)
        }
    }
    
    private func dificultyButton(_ title: String) -> UIButton {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .bgColor
        button.addShadow()
        
        let lblTitle: UILabel = UIFactory.getLabel(text: title, font: .title(), color: .white, alignment: .center)
        
        button.addSubview(lblTitle)
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: button.topAnchor, constant: 5),
            lblTitle.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -5),
            lblTitle.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 5),
            lblTitle.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -5),
        ])
        
        return button
    }
    
    @objc private func selectDificulty(_ sender: UIButton) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        levelSelected = Level(rawValue: sender.tag)
        
        for btn in [btnEasy!, btnMedium!, btnHard!] {
            btn.backgroundColor = .bgColor
        }
        sender.backgroundColor = .primary
        animateBtnStart()
    }
    
    @objc func actionStart() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        controller.startGame()
    }
    
    private func animateBtnStart() {
        btnStart?.alpha = 1.0
        UIView.animate(withDuration: 0.75, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveEaseOut) {
            self.btnStart?.transform = .identity
        } completion: { finished in
            
        }
    }
    
}
