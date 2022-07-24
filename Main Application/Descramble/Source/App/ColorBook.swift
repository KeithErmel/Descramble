import UIKit
import SwiftUI

/// Houses the colors found in the `Color Book` assets catalog.
public struct ColorBook {
    /// Primary app background color
    public static var primaryBackground: UIColor { UIColor.primaryBackground }

    public static var secondaryBackground: UIColor { UIColor.secondaryBackground }
    
    /// Primary app text color
    public static var primaryText: UIColor { UIColor.primaryText }

    /// Secondary app text color
    public static var secondaryText: UIColor { UIColor.secondaryText }
}

extension UIColor {
    /// Primary app background color
    public static var primaryBackground: UIColor { UIColor(named: "Primary Background")! }

    public static var secondaryBackground: UIColor { UIColor(named: "Secondary Background")! }

    /// Primary app text color
    public static var primaryText: UIColor { UIColor(named: "Primary Text")! }

    /// Secondary app text color
    public static var secondaryText: UIColor { UIColor(named: "Secondary Text")! }
}

extension Color {
    /// Primary app background color
    public static var primaryBackground: Color { Color("Primary Background") }

    public static var secondaryBackground: Color { Color("Secondary Background") }

    /// Primary app text color
    public static var primaryText: Color { Color("Primary Text") }

    /// Secondary app text color
    public static var secondaryText: Color { Color("Secondary Text") }
}
