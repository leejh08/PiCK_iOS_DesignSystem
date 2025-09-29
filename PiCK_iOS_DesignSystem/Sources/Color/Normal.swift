import SwiftUI

public extension Color {
    struct Normal { }
}

// MARK: - Normal Colors
public extension Color.Normal {
    static let white = Color("white", bundle: .module)
    static let black = Color("black", bundle: .module)
}
