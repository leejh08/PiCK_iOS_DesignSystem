import SwiftUI

public extension Color {
    struct Background { }
}

// MARK: - Background Colors
public extension Color.Background {
    static let background = Color("background", bundle: .module)
}
