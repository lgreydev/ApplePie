//
//  Game.swift
//  ApplePie
//
//  Created by Sergey Lukaschuk on 12.05.2021.
//

import Foundation


class Game  {
    
    private let listOfWords = ListOfWords()
    private(set) lazy var word: String = listOfWords.city.randomElement()!
    private(set) var incorrectMovesRemaining: Int = 7
    private var guessedLetters: [Character] = []
    private(set) var totalWins = 0
    private(set) var totalLosses = 0
    
    var guessedWord: String {
        print(word)
        var wordLabel = ""
        for letter in word.lowercased() {
            guessedLetters.contains(letter) ? wordLabel.append(letter) : wordLabel.append("_")
        }
        return wordLabel.uppercased()
    }
    
    func playerGuessed(letter: Character) {
        let lowerWord = word.lowercased()
        let loverLetter = letter.lowercased()
        if !lowerWord.contains(loverLetter) {
            guard incorrectMovesRemaining > 0 else { fatalError("Game Over!") }
            incorrectMovesRemaining -= 1
        } else {
            guessedLetters.append(Character(loverLetter))
        }
    }
}
