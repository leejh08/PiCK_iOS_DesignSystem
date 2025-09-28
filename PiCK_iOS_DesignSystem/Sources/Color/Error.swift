import SwiftUI

public extension Color {
    struct Error { }
}

// MARK: - Error Colors
public extension Color.Error {
    static let light: Color = #colorLiteral(red: 1, green: 0.2313725490, blue: 0.1960784314, alpha: 1).color
    static let dark:  Color = #colorLiteral(red: 1, green: 0.4588235294, blue: 0.3803921569, alpha: 1).color
}
