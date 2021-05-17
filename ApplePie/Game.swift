//
//  Game.swift
//  ApplePie
//
//  Created by Sergey Lukaschuk on 12.05.2021.
//

import Foundation


class Game  {
    
    // MARK: - Properties
    private let listOfWords = ListOfWords() // List of words
    private(set) lazy var word: String = listOfWords.city.randomElement()!
    private(set) var incorrectMovesRemaining: Int = 7 // the count of apples on the tree
    private var guessedLetters: [Character] = [] //
    private(set) var totalWins = 0 // score for win
    private(set) var totalLosses = 0 // score for losses
    
    /// Property for toggling buttons
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
    /// Counting the number of apples on a tree
    /// - Parameter letter: the current letter pressed
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
    // Checking the state of the game for winning or losing
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
    // Start a new round
    func newRound() {
        word = listOfWords.city.randomElement()!
        guessedLetters = [Character]()
        incorrectMovesRemaining = 7
        onButton = true
    }
}
