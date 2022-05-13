//
//  GameView.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 05/05/22.
//

import UIKit

class GameView: UIView {
    unowned var controller: GameController!
    
    weak var collecion: UICollectionView?
    weak var lblTime: UILabel?
    
    private var selectedCell: CardCell?
    private var endDate: Date!
    private var timer: Timer?
    
    init(controller: GameController) {
        self.controller = controller
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = .bgColor
        isUserInteractionEnabled = false
        
        let lblTitle: UILabel = UIFactory.getLabel(text: controller.level.title, font: .largeTitle(), color: .white, alignment: .center)
        
        let lblTime: UILabel = UIFactory.getLabel(text: "⏱ 00:00", font: .subtitle(25), color: .white, alignment: .center)
        self.lblTime = lblTime
        
        let collecion: UICollectionView = UIFactory.getCollection()
        collecion.delegate = self
        collecion.dataSource = self
        collecion.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        self.collecion = collecion
        
        addSubview(lblTitle)
        addSubview(lblTime)
        addSubview(collecion)
        
        NSLayoutConstraint.activate([
            lblTitle.heightAnchor.constraint(equalToConstant: 29),
            lblTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            lblTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            lblTitle.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -8),
            
            lblTime.heightAnchor.constraint(equalTo: lblTitle.heightAnchor),
            lblTime.topAnchor.constraint(equalTo: lblTitle.topAnchor),
            lblTime.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 8),
            lblTime.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            collecion.topAnchor.constraint(equalTo: lblTime.bottomAnchor),
            collecion.leadingAnchor.constraint(equalTo: leadingAnchor),
            collecion.trailingAnchor.constraint(equalTo: trailingAnchor),
            collecion.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func startGame() {
        
        let level: Level = controller.level
        
        for i in 0..<controller.cards.count {
            let index: IndexPath = IndexPath(row: i, section: 0)
            let cell: CardCell = collecion?.cellForItem(at: index) as! CardCell
            cell.flipUp() {
                DispatchQueue.main.asyncAfter(deadline: .now() + level.showTime) {
                    cell.flipDown()
                }
            }
        }
        
        lblTime?.text = String(format: "⏱ %@", Date().addingTimeInterval(level.time + 1).timeIntervalSinceNow.toString())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + level.showTime + 1) {
            self.isUserInteractionEnabled = true
            self.endDate = Date().addingTimeInterval(level.time )
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    private func matchFor(cell: CardCell) {
        isUserInteractionEnabled = false
        cell.flipUp() {
            self.isUserInteractionEnabled = true
        }
        if let selectedCell = selectedCell {
            if selectedCell.card.id == cell.card.id {
                // Good Match
                if didWinGame() {
                    animateWin()
                }
                UINotificationFeedbackGenerator().notificationOccurred(.success)
            } else {
                // Bad Match
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    selectedCell.flipDown()
                    cell.flipDown()
                }
                UINotificationFeedbackGenerator().notificationOccurred(.error)
            }
            self.selectedCell = nil
        } else {
            // Just selected a cell
            selectedCell = cell
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        }
    }
    
    private func didWinGame() -> Bool {
        for card in controller.cards {
            if !card.isSelected {
                return false
            }
        }
        return true
    }
    
    private func animateWin() {
        self.timer?.invalidate()
        animateText("🥳") {
            self.animateText("🎉") {
                self.animateText("🎊") {
                    self.endGame()
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.controller.showWinScreen()
        }
    }
    
    private func animateLose() {
        self.timer?.invalidate()
        animateText("😥", time: 0.5, delay: 0.25) {
            self.endGame()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.controller.showLoseScreen()
        }
    }
    
    @objc private func updateTimer() {
        let rest: TimeInterval = endDate.timeIntervalSinceNow
        if rest > 0 {
            DispatchQueue.main.async {
                self.lblTime?.text = String(format: "⏱ %@", rest.toString())
            }
        } else {
            animateLose()
        }
    }
    
    private func animateText(_ str: String, time: TimeInterval = 0.25, delay: TimeInterval = 0.1, completion: (() -> Void)? = nil) {
        let label: UILabel = UIFactory.getLabel(text: str, font: .title(150), alignment: .center)
        label.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        label.alpha = 0.0
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 155),
        ])
        
        UIView.animate(withDuration: time, delay: 0.0, options: .curveLinear) {
            label.transform = .identity
            label.alpha = 1.0
        } completion: { finished in
            UIView.animate(withDuration: 0.15, delay: delay) {
                label.alpha = 0.0
            }
            completion?()
        }
    }
    
    private func endGame() {
        for i in 0..<controller.cards.count {
            let index: IndexPath = IndexPath(row: i, section: 0)
            let cell: CardCell = collecion?.cellForItem(at: index) as! CardCell
            cell.flipDown()
        }
    }
}

extension GameView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CardCell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        let card: Card = controller.cards[indexPath.row]
        cell.config(card: card)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth: CGFloat = UIScreen.main.bounds.width - 16
        let colHeight: CGFloat = collectionView.frame.size.height - 32
        let factor: CGFloat = controller.level == .hard ? 5.0 : 4.0
        let vFacror: CGFloat = controller.level == .easy ? 4.0 : 6.0
        let width: CGFloat = screenWidth / factor
        let height: CGFloat = min(width * 1.33333, colHeight / vFacror)
        return CGSize(width: width - 8, height: height - 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let cell: CardCell = collectionView.cellForItem(at: indexPath) as! CardCell
        if !cell.card.isSelected {
            matchFor(cell: cell)
        }
    }
}
