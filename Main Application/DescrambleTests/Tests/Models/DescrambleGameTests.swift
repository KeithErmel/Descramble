import XCTest
import os
@testable import Descramble

/// Validation of `DescrambleGame`.
final class DescrambleGameTests: XCTestCase {
    private var sut: DescrambleGame!

    override func setUpWithError() throws {
        try super.setUpWithError()

        sut = DescrambleGame()
    }

    override func tearDownWithError() throws {
        sut = nil

        try super.tearDownWithError()
    }

    /// Validates that we can initialize a new instance.
    func testInit() throws {
        XCTAssertTrue(sut.wordInput.isEmpty)
        XCTAssertTrue(sut.currentAnswer.isEmpty)
        XCTAssertTrue(sut.scrambledWord.isEmpty)
        XCTAssertFalse(sut.isCorrectAnswer)
        XCTAssertEqual(sut.state, .notPlaying)
        XCTAssertFalse(sut.hasPlayed)
    }

    /// Validates that `playGame()` works as expected.
    func testPlayGame() throws {
        sut.playGame()
        XCTAssertTrue(sut.wordInput.isEmpty)
        XCTAssertFalse(sut.currentAnswer.isEmpty)
        XCTAssertFalse(sut.scrambledWord.isEmpty)
        XCTAssertFalse(sut.isCorrectAnswer)
        XCTAssertEqual(sut.state, .awaitingAnswer)
        XCTAssertFalse(sut.hasPlayed)
    }

    /// Validates that `validateAnswer()` works as expected when given a correct answer.
    func testValidateAnswerSuccess() throws {
        let expectedAnswer = "plane"
        let sut = DescrambleGame(answer: expectedAnswer)
        XCTAssertEqual(sut.wordInput, expectedAnswer)
        XCTAssertEqual(sut.currentAnswer, expectedAnswer)
        XCTAssertNotEqual(sut.scrambledWord, expectedAnswer)
        XCTAssertEqual(sut.state, .awaitingAnswer)

        sut.validateAnswer()
        XCTAssertEqual(sut.wordInput, sut.currentAnswer)
        XCTAssertTrue(sut.isCorrectAnswer)
    }

    /// Validates that `validateAnswer()` works as expected when given a wrong answer.
    func testValidateAnswerFailure() throws {
        let expectedAnswer = "plank"
        let sut = DescrambleGame(answer: expectedAnswer)
        XCTAssertEqual(sut.wordInput, expectedAnswer)
        XCTAssertEqual(sut.currentAnswer, expectedAnswer)
        XCTAssertNotEqual(sut.scrambledWord, expectedAnswer)
        XCTAssertEqual(sut.state, .awaitingAnswer)

        sut.wordInput = "bogus"
        sut.validateAnswer()
        XCTAssertNotEqual(sut.wordInput, sut.currentAnswer)
        XCTAssertFalse(sut.isCorrectAnswer)
    }
}
