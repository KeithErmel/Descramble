import SwiftUI

/// Displayed when game state is `.reportingResults`
struct ReportingResultsView: View {
    @EnvironmentObject var game: DescrambleGame

    var body: some View {
        VStack(spacing: 20) {
            if game.isCorrectAnswer {
                Text(AppStringKeys.correctAnswer)
                    .foregroundColor(.green)
            } else {
                Text(AppStringKeys.wrongAnswer)
                    .foregroundColor(.red)
            }
            OutlineButton(appStringKey: .playAgain, textColor: .purple, borderColor: .purple, action: game.playGame)
        }
    }
}

struct ReportingResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ReportingResultsView()
    }
}
