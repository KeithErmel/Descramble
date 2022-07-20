import SwiftUI
import EnglishWords
import os

@main
struct DescrambleApp: App {
    static let words = EnglishWords()!
    private let log = Logger(category: "       app")

    var body: some Scene {
        WindowGroup {
            ContentView()
                .padding()
                .onAppear(perform: onDidAppear)
        }
    }

    private func onDidAppear() {
        log.debug("\(Self.words.byOrdinalAscending.count) words available")
    }
}
