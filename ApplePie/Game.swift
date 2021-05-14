//
//  Game.swift
//  ApplePie
//
//  Created by Sergey Lukaschuk on 12.05.2021.
//

import Foundation


class Game  {
    
    // MARK: - Properties
    private let listOfWords = ListOfWords()
    private(set) lazy var word: String = listOfWords.city.randomElement()!
    private(set) var incorrectMovesRemaining: Int = 7
    private var guessedLetters: [Character] = []
    private(set) var totalWins = 0
    private(set) var totalLosses = 0
    var onButton = false
    
    
    // MARK: - Letter Matching
    // checking for matches of letters in a word
    var guessedWord: String {
        var wordLabel = ""
        for letter in word.lowercased() {
            guessedLetters.contains(letter) ? wordLabel.append(letter) : wordLabel.append("_")
        }
        return wordLabel.uppercased()
    }
    
    
    // MARK: - Count Apples
    func playerGuessed(letter: Character) {
        let lowerWord = word.lowercased()
        let loverLetter = letter.lowercased()
        if !lowerWord.contains(loverLetter) {
            incorrectMovesRemaining -= 1
        } else {
            guessedLetters.append(Character(loverLetter))
        }
    }
    
    
    // MARK: - State Game
    func state() {
        print(word, guessedWord)
        let newWord = word.filter { !$0.isWhitespace }.lowercased()
        if newWord == guessedWord.lowercased() {
            totalWins += 1
            newRound()
        } else if incorrectMovesRemaining < 1 {
            totalLosses += 1
            newRound()
        }
    }
    
    
    // MARK: - New Round
    func newRound() {
        word = listOfWords.city.randomElement()!
        guessedLetters = [Character]()
        incorrectMovesRemaining = 7
        onButton = true
    }
}
