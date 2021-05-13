//
//  ViewController.swift
//  ApplePie
//
//  Created by Sergey Lukaschuk on 11.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlet
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    
    // MARK: - Game Setting
    let game = Game()
    
    
    // MARK: - Update UI
    func updateUI() {
        let imageName = "Tree \(game.incorrectMovesRemaining)"
        treeImageView.image = UIImage(named: imageName)
        scoreLabel.text = "Win: \(game.totalWins)       Losses: \(game.totalLosses)"
        correctWordLabel.text = game.guessedWord
    }


    // MARK: - Action
    @IBAction func pressedLetterButton(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        game.playerGuessed(letter: Character(letter))
        updateUI()
    }
    

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
}

