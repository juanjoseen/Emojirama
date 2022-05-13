//
//  GameController.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 05/05/22.
//

import UIKit

class GameController: UIViewController {
    
    weak var gameView: GameView?
    var level: Level!
    var cards: [Card] = []
    
    convenience init(level: Level) {
        self.init()
        self.level = level
        self.cards = Deck.generate(from: level)
    }
    
    override func loadView() {
        let gameView: GameView = GameView(controller: self)
        self.gameView = gameView
        view = gameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gameView?.startGame()
    }
    
    func showWinScreen() {
        let goc: GameOverController = GameOverController(didWin: true)
        goc.delegate = self
        navigationController?.pushViewController(goc, animated: true)
    }
    
    func showLoseScreen() {
        let goc: GameOverController = GameOverController(didWin: false)
        goc.delegate = self
        navigationController?.pushViewController(goc, animated: true)
    }
}

extension GameController: GameOverDelegate {
    func retry() {
        self.cards = Deck.generate(from: level)
        gameView?.collecion?.reloadData()
    }
}
