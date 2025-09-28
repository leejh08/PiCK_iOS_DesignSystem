import SwiftUI

public extension Color {
    struct Background { }
}

// MARK: - Background Colors
public extension Color.Background {
    static let light: Color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).color
    static let dark:  Color = #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1).color
}
