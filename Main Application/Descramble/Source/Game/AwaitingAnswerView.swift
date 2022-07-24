import SwiftUI

/// Displayed when the game state is `.awaitingAnswer`.
struct AwaitingAnswerView: View {
    @EnvironmentObject var game: DescrambleGame

    var body: some View {
        VStack(spacing: 20) {
            Text(game.scrambledWord)
                .font(.largeTitle)
            TextField(AppStringKeys.answerPlaceholder.localized, text: $game.wordInput)
                .font(.largeTitle)
            Button(action: game.validateAnswer) {
                Text(AppStringKeys.submitAnswer)
            }

            OutlineButton(appStringKey: .exitGame, textColor: .red, borderColor: .red, action: game.endGame)
        }
    }
}

struct AwaitingAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AwaitingAnswerView()
    }
}
