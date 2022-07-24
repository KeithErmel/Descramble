import SwiftUI
import EnglishWords
import os

/// The primary game view for the Descramble app.
struct GameView: View {
    @EnvironmentObject var game: DescrambleGame

    var body: some View {
        VStack {
            GameTitleView()
            Spacer()
            switch game.state {
            case .awaitingAnswer:
                AwaitingAnswerView()
            case .reportingResults:
                ReportingResultsView()
            default:
                GameLobbyView()
            }
            Spacer()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
