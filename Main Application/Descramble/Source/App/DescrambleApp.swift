import SwiftUI
import EnglishWords
import os

@main
/// The main interface for the app.
struct DescrambleApp: App {
    static let game = DescrambleGame()
    private let log = Logger(category: "       app")

    var body: some Scene {
        WindowGroup {
            ContentView()
                .padding()
                .onAppear(perform: onDidAppear)
                .environmentObject(Self.game)
        }
    }

    private func onDidAppear() {
        log.debug("\(Self.game.words.byOrdinalAscending.count) words available")
    }
}
