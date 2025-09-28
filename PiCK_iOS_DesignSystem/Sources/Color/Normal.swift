import SwiftUI

public extension Color {
    struct Normal { }
}

// MARK: - Normal Colors
public extension Color.Normal {
    static let white: Color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).color
    static let black: Color = #colorLiteral(red: 0.0784313725, green: 0.0784313725, blue: 0.0784313725, alpha: 1).color
}
