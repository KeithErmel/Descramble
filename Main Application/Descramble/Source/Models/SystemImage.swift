import Foundation
import SwiftUI

/// Used for representing an SF Symbols image.
public protocol SystemImage: CustomStringConvertible, CustomDebugStringConvertible {
    /// Initializes using the provided `keyName`.
    /// - Parameter keyName: The SF Symbols image name.
    init?(keyName: String)
}

@available(iOS 13.0, *)
@available(macOS 11.0, *)
public extension SystemImage where Self: RawRepresentable, Self.RawValue == String  {
    init?(keyName: String) { self.init(rawValue: keyName) }
    var description: String { rawValue }
    var debugDescription: String { rawValue }
    var image: Image { Image(systemName: rawValue) }
}

@available(iOS 13.0, *)
@available(macOS 11.0, *)
public extension Image {
    init(imageKey: SystemImage) {
        self.init(systemName: imageKey.description)
    }
}
