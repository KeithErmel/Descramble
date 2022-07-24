import Foundation
import EnglishWords
import os

/// The primary interface between the app and the game.
public final class DescrambleGame: ObservableObject {
    /// Captures what the user enters as their answer.
    @Published public var wordInput = ""

    /// The current word, randomly selected.
    @Published public private(set) var currentAnswer = ""

    /// `currentWord`, but with its letters scrambled.
    @Published public private(set) var scrambledWord = ""

    /// `true` indicates the user has entered a correct answer;
    /// `false` means an incorrect answer.
    @Published public private(set) var isCorrectAnswer = false

    /// The collection of English words we'll use for the game.
    public let words = EnglishWords()!
    private let log = Logger(category: "      game")

    /// The current game state.
    public private(set) var state = State.notPlaying

    /// `true` indicates this is not the first game being played (after launching the app).
    public private(set) var hasPlayed = false

    /// Begins the round of play.
    public func playGame() {
        state = .awaitingAnswer
        wordInput = ""
        guard let currentWord = words.randomWord(length: 5) else { return }

        let wordScrambled = String(currentWord.text.uppercased().shuffled())
        currentAnswer = currentWord.text
        scrambledWord = wordScrambled
        log.debug("scrambled word: \(self.scrambledWord) [answer: '\(self.currentAnswer)']")
    }

    /// Validates `wordInput` against `currentAnswer` and sets the value of `isCorrectAnswer`.
    public func validateAnswer() {
        let userInput = wordInput.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        if userInput == currentAnswer {
            isCorrectAnswer = true
        } else {
            isCorrectAnswer = false
        }
        log.debug("validate '\(self.wordInput)' [\(self.isCorrectAnswer)]")
        state = .reportingResults
        hasPlayed = true
    }

    public func endGame() {
        state = .notPlaying
    }
}

extension DescrambleGame {
    /// Provides a means of initializing into a state with a correct answer.
    /// - Parameter answer: The answer to be applied.
    internal convenience init(answer: String) {
        self.init()
        self.wordInput = answer
        self.currentAnswer = answer
        self.scrambledWord = String(answer.shuffled())
        self.state = .awaitingAnswer
    }
}
