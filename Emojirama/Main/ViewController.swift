//
//  ViewController.swift
//  Emojirama
//
//  Created by Juan Jose Elias Navarro on 05/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    weak var mainView: MainView?
    
    override func loadView() {
        let mainView: MainView = MainView(controller: self)
        self.mainView = mainView
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func startGame() {
        if let level: Level = mainView?.levelSelected {
            let game: GameController = GameController(level: level)
            navigationController?.pushViewController(game, animated: true)
        }
    }
}

