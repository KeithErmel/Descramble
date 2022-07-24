import Foundation

extension DescrambleGame {
    /// The various states of the game.
    public enum State {
        /// The user is currently not playing the game.
        case notPlaying

        /// The system has selected a random word, scrambled its letters and presented it to the user,
        /// now the user just needs to provide an answer.
        case awaitingAnswer

        /// The user has entered their answer, now the system will report the results.
        case reportingResults
    }
}
