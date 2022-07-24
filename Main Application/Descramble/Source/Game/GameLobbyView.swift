import SwiftUI

/// Displayed when the game state is not either `.awaitingAnswer` or `.reportingResults`.
struct GameLobbyView: View {
    @EnvironmentObject var game: DescrambleGame

    var body: some View {
        OutlineButton(appStringKey: buttonTitleKey,
                      textColor: .purple,
                      borderColor: .purple,
                      action: game.playGame)
    }

    private var buttonTitleKey: AppStringKeys {
        if game.hasPlayed {
            return .playAgain
        } else {
            return .playGame
        }
    }
}

struct GameLobbyView_Previews: PreviewProvider {
    static var previews: some View {
        GameLobbyView()
    }
}
