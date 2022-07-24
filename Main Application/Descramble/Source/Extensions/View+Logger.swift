import SwiftUI
import EnglishWords
import os

public extension Logger {
    static let ui         = Logger(category: .ui)
    static let testing    = Logger(category: .testing)
}

public extension LoggingProvider.Category {
    static let ui         = LoggingProvider.Category(rawValue: "        ui")
    static let testing    = LoggingProvider.Category(rawValue: "   testing")
}

public extension View {
    var log: Logger { Logger.ui }
}
