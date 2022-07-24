import SwiftUI
import os

public extension View {
    /// Makes the `View` invisible, but the screen real estate it occupies is still visible.
    /// - Parameter shouldHide: `true` indicates the `View` should be invisible.
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }

    /// Makes the `View` not even part of the view hierarchy when passed a value of `true`
    /// - Parameter isGone: `true` means the view will not be in the view hierarchy;
    /// `false` means the view is in the hierarchy and will be visible.
    @ViewBuilder func gone(_ isGone: Bool) -> some View {
        if !isGone {
            self
        }
    }

    /// Prints a message reflecting this `View` type to the console.
    func debug() -> Self {
        log.debug("\(Mirror(reflecting: self).subjectType)")
        return self
    }

    /// Prints the given message to the console.
    /// - Parameter message: The message to be logged.
    func debug(_ message: String) -> Self {
        log.debug("\(message)")
        return self
    }

    /// Provides a means of setting both the `width` and `height` of this view to the given `value`.
    /// - Parameters:
    ///   - value: The value to apply to `width` and `height`.
    ///   - alignment: The alignment of this view inside the resulting frame. Defaults to `.center`.
    func frame(square value: CGFloat, alignment: Alignment = .center) -> some View {
        frame(width: value, height: value, alignment: alignment)
    }
}
