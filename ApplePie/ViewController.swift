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
    var incorrectMovesAllowed = 7
    var totalWins = 0
    var totalLosses = 0
    
    
    // MARK: - New Round
    func newRound() {
        game.incorrectMovesRemaining = incorrectMovesAllowed
        game.word = game.listOfWords.city[0] // Tokyo
        updateUI()
    }
    
    
    // MARK: - Update UI
    func updateUI() {
        let imageName = "Tree \(game.incorrectMovesRemaining ?? 0)"
        treeImageView.image = UIImage(named: imageName)
        scoreLabel.text = "Win: \(totalWins)       Losses: \(totalLosses)"
    }


    // MARK: - Action
    @IBAction func pressedLetterButton(_ sender: UIButton) {
        incorrectMovesAllowed -= 1
        identificationLetter(of: sender)
        newRound()
        
    }
    
    
    func identificationLetter(of button: UIButton) {
        button.isEnabled = false
        for city in game.listOfWords.city {
            if button.titleLabel?.text == city.first?.description {
                correctWordLabel.text = city
            }
        }
    }
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
}

