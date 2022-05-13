//
//  GameOverController.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 12/05/22.
//

import UIKit

protocol GameOverDelegate: AnyObject {
    func retry()
}

class GameOverController: UIViewController {
    
    var delegate: GameOverDelegate?
    private weak var gameView: GameOverView?
    
    private var didWin: Bool!
    
    override func loadView() {
        let gameView: GameOverView = GameOverView(controller: self)
        self.gameView = gameView
        view = gameView
    }
    
    convenience init(didWin: Bool) {
        self.init()
        self.didWin = didWin
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if didWin {
            gameView?.configureWin()
        } else {
            gameView?.configureLose()
        }
    }
    
    func retry() {
        delegate?.retry()
        navigationController?.popViewController(animated: true)
    }

    func changeLevel() {
        navigationController?.popToRootViewController(animated: true)
    }
}
